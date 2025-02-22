import NimQml, json, stint, strutils, chronicles

import ../../../../../app_service/service/community_tokens/service as community_tokens_service
import ../../../../../app_service/service/transaction/service as transaction_service
import ../../../../../app_service/service/network/service as networks_service
import ../../../../../app_service/service/community/dto/community
import ../../../../../app_service/service/accounts/utils as utl
import ../../../../core/eventemitter
import ../../../../global/global_singleton
import ../../../shared_models/currency_amount
import ../io_interface as parent_interface
import ./io_interface, ./view , ./controller

export io_interface

type
  ContractAction {.pure.} = enum
    Unknown = 0
    Deploy = 1
    Airdrop = 2

type
  Module*  = ref object of io_interface.AccessInterface
    parent: parent_interface.AccessInterface
    controller: Controller
    view: View
    viewVariant: QVariant
    tempTokenAndAmountList: seq[CommunityTokenAndAmount]
    tempAddressFrom: string
    tempCommunityId: string
    tempChainId: int
    tempContractAddress: string
    tempDeploymentParams: DeploymentParameters
    tempTokenMetadata: CommunityTokensMetadataDto
    tempWalletAddresses: seq[string]
    tempContractAction: ContractAction

proc newCommunityTokensModule*(
    parent: parent_interface.AccessInterface,
    events: EventEmitter,
    communityTokensService: community_tokens_service.Service,
    transactionService: transaction_service.Service,
    networksService: networks_service.Service): Module =
  result = Module()
  result.parent = parent
  result.view = newView(result)
  result.viewVariant = newQVariant(result.view)
  result.controller = controller.newCommunityTokensController(result, events, communityTokensService, transactionService, networksService)

method delete*(self: Module) =
  self.view.delete
  self.viewVariant.delete
  self.controller.delete

method resetTempValues(self:Module) =
  self.tempAddressFrom = ""
  self.tempCommunityId = ""
  self.tempDeploymentParams = DeploymentParameters()
  self.tempTokenMetadata = CommunityTokensMetadataDto()
  self.tempChainId = 0
  self.tempContractAddress = ""
  self.tempWalletAddresses = @[]
  self.tempContractAction = ContractAction.Unknown
  self.tempTokenAndAmountList = @[]

method load*(self: Module) =
  singletonInstance.engine.setRootContextProperty("communityTokensModule", self.viewVariant)
  self.controller.init()
  self.view.load()

proc authenticate(self: Module) =
  if singletonInstance.userProfile.getIsKeycardUser():
    let keyUid = singletonInstance.userProfile.getKeyUid()
    self.controller.authenticateUser(keyUid)
  else:
    self.controller.authenticateUser()

method airdropCollectibles*(self: Module, communityId: string, collectiblesJsonString: string, walletsJsonString: string) =
  let collectiblesJson = collectiblesJsonString.parseJson
  self.tempTokenAndAmountList = @[]
  for collectible in collectiblesJson:
    let symbol = collectible["key"].getStr
    let amount = collectible["amount"].getInt
    let tokenDto = self.controller.getCommunityTokenBySymbol(communityId, symbol)
    if tokenDto.tokenType == TokenType.Unknown:
      error "Can't find token for community", communityId=communityId, symbol=symbol
      return
    self.tempTokenAndAmountList.add(CommunityTokenAndAmount(communityToken: tokenDto, amount: amount))

  self.tempWalletAddresses = walletsJsonString.parseJson.to(seq[string])
  self.tempCommunityId = communityId
  self.tempContractAction = ContractAction.Airdrop
  self.authenticate()

method deployCollectible*(self: Module, communityId: string, fromAddress: string, name: string, symbol: string, description: string,
                        supply: int, infiniteSupply: bool, transferable: bool, selfDestruct: bool, chainId: int, image: string) =
  self.tempAddressFrom = fromAddress
  self.tempCommunityId = communityId
  self.tempChainId = chainId
  self.tempDeploymentParams.name = name
  self.tempDeploymentParams.symbol = symbol
  self.tempDeploymentParams.supply = supply
  self.tempDeploymentParams.infiniteSupply = infiniteSupply
  self.tempDeploymentParams.transferable = transferable
  self.tempDeploymentParams.remoteSelfDestruct = selfDestruct
  self.tempDeploymentParams.tokenUri = utl.changeCommunityKeyCompression(communityId) & "/"
  self.tempTokenMetadata.image = singletonInstance.utils.formatImagePath(image)
  self.tempTokenMetadata.description = description
  self.tempContractAction = ContractAction.Deploy
  self.authenticate()

method onUserAuthenticated*(self: Module, password: string) =
  defer: self.resetTempValues()
  if password.len == 0:
    discard
    #TODO signalize somehow
  else:
    if self.tempContractAction == ContractAction.Deploy:
      self.controller.deployCollectibles(self.tempCommunityId, self.tempAddressFrom, password, self.tempDeploymentParams, self.tempTokenMetadata, self.tempChainId)
    elif self.tempContractAction == ContractAction.Airdrop:
      self.controller.airdropCollectibles(self.tempCommunityId, password, self.tempTokenAndAmountList, self.tempWalletAddresses)

method onDeployFeeComputed*(self: Module, ethCurrency: CurrencyAmount, fiatCurrency: CurrencyAmount, errorCode: ComputeFeeErrorCode) =
  self.view.updateDeployFee(ethCurrency, fiatCurrency, errorCode.int)

method computeDeployFee*(self: Module, chainId: int, accountAddress: string) =
  self.controller.computeDeployFee(chainId, accountAddress)

method onCommunityTokenDeployStateChanged*(self: Module, communityId: string, chainId: int, transactionHash: string, deployState: DeployState) =
  let network = self.controller.getNetwork(chainId)
  let url = if network != nil: network.blockExplorerURL & "/tx/" & transactionHash else: ""
  self.view.emitDeploymentStateChanged(communityId, deployState.int, url)