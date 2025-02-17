import strformat
import ../../../app_service/service/community/dto/community
import ../../../app_service/service/chat/dto/chat
import token_criteria_model
import token_criteria_item
import token_permission_chat_list_model
import token_permission_chat_list_item

type
  TokenPermissionItem* = object
    id*: string
    `type`*: int
    tokenCriteria*: TokenCriteriaModel
    chatList*: TokenPermissionChatListModel
    isPrivate*: bool
    tokenCriteriaMet*: bool

proc `$`*(self: TokenPermissionItem): string =
  result = fmt"""TokenPermissionItem(
    id: {self.id},
    type: {self.type},
    ]"""

proc initTokenPermissionItem*(
  id: string,
  `type`: int,
  tokenCriteria: seq[TokenCriteriaItem],
  chatList: seq[TokenPermissionChatListItem],
  isPrivate: bool,
  tokenCriteriaMet: bool
): TokenPermissionItem =
  result.id = id
  result.`type` = `type`
  result.tokenCriteria = newTokenCriteriaModel()
  result.chatList = newTokenPermissionChatListModel()
  result.isPrivate = isPrivate
  result.tokenCriteriaMet = tokenCriteriaMet

  for tcItem in tokenCriteria:
    result.tokenCriteria.addItem(tcItem)

  for clItem in chatList:
    result.chatList.addItem(clItem)

proc addTokenCriteria*(self: TokenPermissionItem, tokenCriteria: TokenCriteriaItem) =
  self.tokenCriteria.addItem(tokenCriteria)

proc getId*(self: TokenPermissionItem): string =
  return self.id

proc getType*(self: TokenPermissionItem): int =
  return self.`type`

proc getTokenCriteria*(self: TokenPermissionItem): TokenCriteriaModel =
  return self.tokenCriteria

proc getChatList*(self: TokenPermissionItem): TokenPermissionChatListModel =
  return self.chatList

proc getIsPrivate*(self: TokenPermissionItem): bool =
  return self.isPrivate

proc getTokenCriteriaMet*(self: TokenPermissionItem): bool =
  return self.tokenCriteriaMet
