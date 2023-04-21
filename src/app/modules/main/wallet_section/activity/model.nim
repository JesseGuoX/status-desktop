import NimQml, Tables, strutils, strformat, sequtils

import ./entry

# TODO - DEV: remove this
import app_service/service/transaction/dto
import app/modules/shared_models/currency_amount
import ../transactions/item as transaction

type
  ModelRole {.pure.} = enum
    ActivityEntryRole = UserRole + 1

QtObject:
  type
    Model* = ref object of QAbstractListModel
      entries: seq[ActivityEntry]
      hasMore: bool

  proc delete(self: Model) =
    self.entries = @[]
    self.QAbstractListModel.delete

  proc setup(self: Model) =
    self.QAbstractListModel.setup

  proc newModel*(): Model =
    new(result, delete)

    # TODO - DEV
    var mtDto = MultiTransactionDto()
    mtDto.id = 1
    mtDto.timestamp = 1000020304
    mtDto.fromAddress = "0x1"
    mtDto.toAddress = "0x2"
    mtDto.fromAsset = "eth"
    mtDto.toAsset = "noteth"
    mtDto.fromAmount = "0x10"
    mtDto.multiTxtype = MultiTransactionSend

    var trDto: ref Item = new Item
    let dummyAmount = newCurrencyAmount(10.12, "eth", 2, true)
    trDto[] = transaction.initItem(id = "10",
      txType = "tst-type",
      address = "0x0012",
      blockNumber = "10",
      blockHash = "0x1234",
      timestamp = 1230000,
      gasPrice = dummyAmount,
      gasLimit = 100,
      gasUsed = 1000,
      nonce = "1",
      txStatus = "success",
      value = dummyAmount,
      fro = "0x0013",
      to = "0x0014",
      contract = "0x0015",
      chainId = 1,
      maxFeePerGas = dummyAmount,
      maxPriorityFeePerGas = dummyAmount,
      input = "Something",
      txHash = "0017",
      multiTransactionID = 10,
      isTimeStamp = false,
      baseGasFees = dummyAmount,
      totalFees = dummyAmount,
      maxTotalFees = dummyAmount,
      symbol = "ETH")
    var trDto1: ref Item = new Item
    trDto1[] = transaction.initItem(id = "10",
      txType = "tst-type",
      address = "0x0022",
      blockNumber = "20",
      blockHash = "0x2234",
      timestamp = 2230000,
      gasPrice = dummyAmount,
      gasLimit = 200,
      gasUsed = 2000,
      nonce = "2",
      txStatus = "fail",
      value = dummyAmount,
      fro = "0x0023",
      to = "0x0024",
      contract = "0x0025",
      chainId = 2,
      maxFeePerGas = dummyAmount,
      maxPriorityFeePerGas = dummyAmount,
      input = "Something Else",
      txHash = "0027",
      multiTransactionID = 20,
      isTimeStamp = false,
      baseGasFees = dummyAmount,
      totalFees = dummyAmount,
      maxTotalFees = dummyAmount,
      symbol = "ETH")
    result.entries = @[newTransactionActivityEntry(trDto, false), newMultiTransactionActivityEntry(mtDto), newTransactionActivityEntry(trDto1, false)]

    result.setup
    result.hasMore = true

  proc `$`*(self: Model): string =
    for i in 0 ..< self.entries.len:
      result &= fmt"""[{i}]:({$self.entries[i]})"""

  proc countChanged(self: Model) {.signal.}

  proc getCount*(self: Model): int {.slot.} =
    self.entries.len

  QtProperty[int] count:
    read = getCount
    notify = countChanged

  method rowCount(self: Model, index: QModelIndex = nil): int =
    return self.entries.len

  method roleNames(self: Model): Table[int, string] =
    {
      ModelRole.ActivityEntryRole.int:"activityEntry",
    }.toTable

  method data(self: Model, index: QModelIndex, role: int): QVariant =
    if (not index.isValid):
      return

    if (index.row < 0 or index.row >= self.entries.len):
      return

    let entry = self.entries[index.row]
    let enumRole = role.ModelRole

    case enumRole:
    of ModelRole.ActivityEntryRole:
      result = newQVariant(entry)

  proc setEntries*(self: Model, entries: seq[ActivityEntry]) =
    self.beginResetModel()
    self.entries = entries
    self.endResetModel()
    self.countChanged()

  # TODO: update data

  # TODO: fetch more

  proc hasMoreChanged*(self: Model) {.signal.}

  proc getHasMore*(self: Model): bool {.slot.} =
    return self.hasMore

  proc setHasMore*(self: Model, hasMore: bool) {.slot.} =
    self.hasMore = hasMore
    self.hasMoreChanged()

  QtProperty[bool] hasMore:
    read = getHasMore
    write = setHasMore
    notify = hasMoreChanged
