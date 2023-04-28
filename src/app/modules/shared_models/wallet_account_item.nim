import strformat
from ../../../app_service/service/wallet_account/dto import AccountNonOperable

export AccountNonOperable

type
  WalletAccountItem* = ref object of RootObj
    name: string
    address: string
    color: string
    emoji: string
    walletType: string
    path: string
    keyUid: string
    operable: string

proc setup*(self: WalletAccountItem,
  name: string = "",
  address: string = "",
  color: string = "",
  emoji: string = "",
  walletType: string = "",
  path: string = "",
  keyUid: string = "",
  operable: string = AccountNonOperable
  ) =
    self.name = name
    self.address = address
    self.color = color
    self.emoji = emoji
    self.walletType = walletType
    self.path = path
    self.keyUid = keyUid
    self.operable = operable

proc initWalletAccountItem*(
  name: string = "",
  address: string = "",
  color: string = "",
  emoji: string = "",
  walletType: string = "",
  path: string = "",
  keyUid: string = "",
  operable: string = AccountNonOperable
  ): WalletAccountItem =
  result = WalletAccountItem()
  result.setup(name,
    address,
    color,
    emoji,
    walletType,
    path,
    keyUid,
    operable)
  

proc `$`*(self: WalletAccountItem): string =
  result = fmt"""WalletAccountItem(
    name: {self.name},
    address: {self.address},
    color: {self.color},
    emoji: {self.emoji},
    walletType: {self.walletType},
    path: {self.path},
    keyUid: {self.keyUid},
    operable: {self.operable}
    ]"""

proc name*(self: WalletAccountItem): string {.inline.} =
  return self.name

proc `name=`*(self: WalletAccountItem, value: string) {.inline.} =
  self.name = value

proc address*(self: WalletAccountItem): string {.inline.} =
  return self.address

proc emoji*(self: WalletAccountItem): string {.inline.} =
  return self.emoji

proc `emoji=`*(self: WalletAccountItem, value: string) {.inline.} =
  self.emoji = value

proc color*(self: WalletAccountItem): string {.inline.} =
  return self.color

proc `color=`*(self: WalletAccountItem, value: string) {.inline.} =
  self.color = value

proc walletType*(self: WalletAccountItem): string {.inline.} =
  return self.walletType

proc path*(self: WalletAccountItem): string {.inline.} =
  return self.path

proc keyUid*(self: WalletAccountItem): string {.inline.} =
  return self.keyUid

proc operable*(self: WalletAccountItem): string {.inline.} =
  return self.operable

proc `operable=`*(self: WalletAccountItem, value: string) {.inline.} =
  self.operable = value