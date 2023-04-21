import NimQml, logging, std/json, sequtils, sugar

import model
import entry

import ../transactions/item
import ../transactions/module as transaction_module

import backend/activity as backend_activity
import backend/backend as backend

import app_service/service/transaction/service as transaction_service
import app_service/service/transaction/dto as transaction_dto

export transaction_dto

QtObject:
  type
    Controller* = ref object of QObject
      model: Model
      transactionModule: transaction_module.AccessInterface
      currentActivityFilter: backend_activity.ActivityFilter

  proc setup(self: Controller) =
    self.QObject.setup

  proc delete*(self: Controller) =
    self.QObject.delete

  proc newController*(transactionModule: transaction_module.AccessInterface): Controller =
    new(result, delete)
    result.model = newModel()
    result.transactionModule = transactionModule
    result.currentActivityFilter = backend_activity.getIncludeAllActivityFilter()
    result.setup()

  # TODO: move it to service and make it async
  proc backendToPresentation(self: Controller, backendEnties: seq[backend_activity.ActivityEntry]): seq[entry.ActivityEntry] =
    var multiTransactionsIds: seq[int]
    var transactionIdentities: seq[backend.TransactionIdentity]
    var pendingTransactionIdentities: seq[backend.TransactionIdentity]
    for backendEntry in backendEnties:
      # Switch equivalent in nim for backendEntry.transactionType values
      case backendEntry.transactionType:
        of MultiTransaction:
          multiTransactionsIds.add(backendEntry.id)
        of SimpleTransaction:
          transactionIdentities.add(backend.TransactionIdentity(chainId: 0, hash: backendEntry.hash ))
        of PendingTransaction:
          pendingTransactionIdentities.add(backend.TransactionIdentity(chainId: 0, hash: backendEntry.hash ))

    echo "@dd multiTransactionsIds ", len(multiTransactionsIds), "; transactionIdentities ", len(transactionIdentities), "; pendingTransactionIdentities ", len(pendingTransactionIdentities)

    let multiTransactions = transaction_service.getMultiTransactions(multiTransactionsIds)
    let response = backend.getPendingTransactionsForIdentities(pendingTransactionIdentities)
    if response.error != nil:
      error "error fetching pending transactions: ", response.error
      return @[]

    var transactions: seq[ref Item] = @[]
    var pendingTransactions: seq[Item] = @[]
    let res = response.result
    if (res.kind == JArray and res.len > 0):
      let pendingTransactionsDtos = res.getElems().map(x => x.toPendingTransactionDto())
      pendingTransactions = self.transactionModule.transactionsToItems(pendingTransactionsDtos, @[])

    result = newSeq[entry.ActivityEntry](multiTransactions.len + transactions.len + pendingTransactions.len)
    for mtDto in multiTransactions:
      result.add(entry.newMultiTransactionActivityEntry(mtDto))

    for t in transactions:
      result.add(entry.newTransactionActivityEntry(t, false))

    for pt in pendingTransactions:
      let refInstance = new(Item)
      refInstance[] = pt
      result.add(entry.newTransactionActivityEntry(refInstance, true))

    # TODO fetch transactions and pending transactions

  proc refreshData*(self: Controller) {.slot.} =
    # result type is RpcResponse
    let response = backend_activity.getActivityEntries(@["0x0000000000000000000000000000000000000001"], @[1], self.currentActivityFilter, 0, 10)
    if response.error != nil or response.result.kind != JArray:
      error "error fetching activity entries: ", response.error
      return

    var backendEnties = newSeq[backend_activity.ActivityEntry](response.result.len)
    for i in 0 ..< response.result.len:
      backendEnties[i] = fromJson(response.result[i], backend_activity.ActivityEntry)
    let entries = self.backendToPresentation(backendEnties)
    echo "@dd 2", entries
    self.model.setEntries(entries)

  # TODO: add all parameters and separate in different methods
  proc updateFilter*(self: Controller, startTimestamp: int, endTimestamp: int) {.slot.} =
    # Update filter
    self.currentActivityFilter.period = backend_activity.newPeriod(startTimestamp, endTimestamp)

    self.refreshData()
