import NimQml
import io_interface
import ../io_interface as delegate_interface
import view, controller
import ../../../../../global/global_singleton
import ../../../../../core/eventemitter

import ../../../../../../app_service/service/chat/service as chat_service
import ../../../../../../app_service/service/community/service as community_service
import ../../../../../../app_service/service/gif/service as gif_service
import ../../../../../../app_service/service/gif/dto

export io_interface

type
  Module* = ref object of io_interface.AccessInterface
    delegate: delegate_interface.AccessInterface
    view: View
    viewVariant: QVariant
    controller: Controller
    moduleLoaded: bool

proc newModule*(
    delegate: delegate_interface.AccessInterface,
    events: EventEmitter,
    sectionId: string,
    chatId: string,
    belongsToCommunity: bool,
    chatService: chat_service.Service,
    communityService: community_service.Service,
    gifService: gif_service.Service,
    ):
  Module =
  result = Module()
  result.delegate = delegate
  result.view = view.newView(result)
  result.viewVariant = newQVariant(result.view)
  result.controller = controller.newController(result, events, sectionId, chatId, belongsToCommunity, chatService, communityService, gifService)
  result.moduleLoaded = false

method delete*(self: Module) =
  self.view.delete
  self.viewVariant.delete
  self.controller.delete

method load*(self: Module) =
  singletonInstance.engine.setRootContextProperty("chatSectionChatContentInputArea", self.viewVariant)

  self.controller.init()
  self.view.load()

method isLoaded*(self: Module): bool =
  return self.moduleLoaded

method viewDidLoad*(self: Module) =
  self.moduleLoaded = true
  self.delegate.inputAreaDidLoad()

method getModuleAsVariant*(self: Module): QVariant =
  return self.viewVariant

proc getChatId*(self: Module): string =
  return self.controller.getChatId()

method sendImages*(self: Module, imagePathsAndDataJson: string, msg: string, replyTo: string): string =
  self.controller.sendImages(imagePathsAndDataJson, msg, replyTo)

method sendChatMessage*(
    self: Module,
    msg: string,
    replyTo: string,
    contentType: int) =
  self.controller.sendChatMessage(msg, replyTo, contentType,
    singletonInstance.userProfile.getPreferredName())

method requestAddressForTransaction*(self: Module, fromAddress: string, amount: string, tokenAddress: string) =
  self.controller.requestAddressForTransaction(fromAddress, amount, tokenAddress)

method requestTransaction*(self: Module, fromAddress: string, amount: string, tokenAddress: string) =
  self.controller.requestTransaction(fromAddress, amount, tokenAddress)

method declineRequestTransaction*(self: Module, messageId: string) =
  self.controller.declineRequestTransaction(messageId)

method declineRequestAddressForTransaction*(self: Module, messageId: string) =
  self.controller.declineRequestAddressForTransaction(messageId)

method acceptRequestAddressForTransaction*(self: Module, messageId: string, address: string) =
  self.controller.acceptRequestAddressForTransaction(messageId, address)

method acceptRequestTransaction*(self: Module, transactionHash: string, messageId: string, signature: string) =
  self.controller.acceptRequestTransaction(transactionHash, messageId, signature)

method searchGifs*(self: Module, query: string) =
  self.controller.searchGifs(query)

method getTrendingsGifs*(self: Module) =
  self.controller.getTrendingsGifs()

method getRecentsGifs*(self: Module): seq[GifDto] =
  return self.controller.getRecentsGifs()

method loadRecentGifs*(self: Module) =
  self.controller.loadRecentGifs()

method loadRecentGifsDone*(self: Module, gifs: seq[GifDto]) =
  self.view.updateGifColumns(gifs)

method loadTrendingGifsStarted*(self: Module) =
  self.view.updateGifColumns(@[])
  self.view.setGifLoading(true)

method loadTrendingGifsError*(self: Module) =
  # Just setting loading to false works because the UI shows an error when there are no gifs
  self.view.setGifLoading(false)

method loadTrendingGifsDone*(self: Module, gifs: seq[GifDto]) =
  self.view.setGifLoading(false)
  self.view.updateGifColumns(gifs)

method searchGifsStarted*(self: Module) =
  self.view.updateGifColumns(@[])
  self.view.setGifLoading(true)

method searchGifsError*(self: Module) =
  # Just setting loading to false works because the UI shows an error when there are no gifs
  self.view.setGifLoading(false)

method serachGifsDone*(self: Module, gifs: seq[GifDto]) =
  self.view.setGifLoading(false)
  self.view.updateGifColumns(gifs)

method getFavoritesGifs*(self: Module): seq[GifDto] =
  return self.controller.getFavoritesGifs()

method loadFavoriteGifs*(self: Module) =
  self.controller.loadFavoriteGifs()

method loadFavoriteGifsDone*(self: Module, gifs: seq[GifDto]) =
  self.view.updateGifColumns(gifs)

method toggleFavoriteGif*(self: Module, item: GifDto) =
  self.controller.toggleFavoriteGif(item)

method addToRecentsGif*(self: Module, item: GifDto) =
  self.controller.addToRecentsGif(item)

method isFavorite*(self: Module, item: GifDto): bool =
  return self.controller.isFavorite(item)
