from scripts.global_names import *

# Main:
navBarListView_Wallet_navbar_StatusNavBarTabButton = {"checkable": True, "container": mainWindow_navBarListView_ListView, "objectName": "Wallet-navbar", "type": "StatusNavBarTabButton", "visible": True}
wallet_navbar_wallet_icon_StatusIcon = {"container": navBarListView_Wallet_navbar_StatusNavBarTabButton, "objectName": "wallet-icon", "type": "StatusIcon", "visible": True}
mainWallet_LeftTab = {"container": statusDesktop_mainWindow, "objectName": "walletLeftTab", "type": "LeftTabView", "visible": True}
mainWallet_Account_Name = {"container": statusDesktop_mainWindow, "objectName": "accountName", "type": "StatusBaseText", "visible": True}
mainWallet_Address_Panel = {"container": statusDesktop_mainWindow, "objectName": "addressPanel", "type": "StatusAddressPanel", "visible": True}
mainWallet_Add_Account_Button = {"container": statusDesktop_mainWindow, "objectName": "addAccountButton", "type": "StatusRoundButton", "visible": True}
signPhrase_Ok_Button = {"container": statusDesktop_mainWindow, "type": "StatusFlatButton", "objectName": "signPhraseModalOkButton", "visible": True}
mainWallet_Saved_Addresses_Button = {"container": statusDesktop_mainWindow, "objectName": "savedAddressesBtn", "type": "StatusButton"}
mainWallet_Network_Selector_Button = {"container": statusDesktop_mainWindow, "objectName": "networkSelectorButton", "type": "StatusListItem"}
mainWallet_Right_Side_Tab_Bar = {"container": statusDesktop_mainWindow, "objectName": "rightSideWalletTabBar", "type": "StatusTabBar"}
mainWallet_Ephemeral_Notification_List = {"container": statusDesktop_mainWindow, "objectName": "ephemeralNotificationList", "type": "StatusListView"}

mainWallet_RightClick_CopyAddress_MenuItem_Placeholder = {"container": statusDesktop_mainWindow, "enabled": True, "objectName": "AccountMenu-CopyAddressAction-%NAME%", "type": "StatusMenuItem"}
mainWallet_RightClick_EditAccount_MenuItem_Placeholder = {"container": statusDesktop_mainWindow, "enabled": True, "objectName": "AccountMenu-EditAction-%NAME%", "type": "StatusMenuItem"}
mainWallet_RightClick_DeleteAccount_MenuItem_Placeholder = {"container": statusDesktop_mainWindow, "enabled": True, "objectName": "AccountMenu-DeleteAction-%NAME%", "type": "StatusMenuItem"}
mainWallet_RightClick_AddNewAccount_MenuItem_Placeholder = {"container": statusDesktop_mainWindow, "enabled": True, "objectName": "AccountMenu-AddNewAccountAction-%NAME%", "type": "StatusMenuItem"}
mainWallet_RightClick_AddWatchOnlyAccount_MenuItem_Placeholder = {"container": statusDesktop_mainWindow, "enabled": True, "objectName": "AccountMenu-AddWatchOnlyAccountAction-%NAME%", "type": "StatusMenuItem"}

walletAccounts_StatusListView = {"container": statusDesktop_mainWindow, "objectName": "walletAccountsListView", "type": "StatusListView", "visible": True}
walletAccounts_WalletAccountItem_Placeholder = {"container": walletAccounts_StatusListView, "objectName": "walletAccount-%NAME%", "type": "StatusListItem", "visible": True}

# Assets view:
mainWallet_Assets_View_List = {"container": statusDesktop_mainWindow, "objectName": "assetViewStatusListView", "type": "StatusListView"}

# Network selector popup
mainWallet_Network_Popup_Chain_Repeater_1 = {"container": statusDesktop_mainWindow, "objectName": "networkSelectPopupChainRepeaterLayer1", "type": "Repeater"}

# Send popup:
mainWallet_totalCurrencyBalance = {"container": statusDesktop_mainWindow, "objectName": "walletLeftListAmountValue", "type": "StyledTextEdit"}
mainWallet_Footer_Send_Button = {"container": statusDesktop_mainWindow, "objectName": "walletFooterSendButton", "type": "StatusFlatButton"}
mainWallet_Send_Popup_Main = {"container": statusDesktop_mainWindow, "objectName": "sendModalScroll", "type": "StatusScrollView"}
mainWallet_Send_Popup_Amount_Input = {"container": statusDesktop_mainWindow, "objectName": "amountInput", "type": "TextEdit"}
mainWallet_Send_Popup_My_Accounts_Tab = {"container": statusDesktop_mainWindow, "objectName": "myAccountsTab", "type": "StatusTabButton"}
mainWallet_Send_Popup_My_Accounts_List = {"container": statusDesktop_mainWindow, "objectName": "myAccountsList", "type": "StatusListView"}
mainWallet_Send_Popup_Header_Accounts = {"container": statusDesktop_mainWindow, "objectName": "accountsListFloatingHeader", "type": "Repeater"}
mainWallet_Send_Popup_Networks_List = {"container": statusDesktop_mainWindow, "objectName": "networksList", "type": "Repeater"}
mainWallet_Send_Popup_Send_Button = {"container": statusDesktop_mainWindow, "objectName": "sendModalFooterSendButton", "type": "StatusFlatButton"}
mainWallet_Send_Popup_Asset_Selector = {"container": statusDesktop_mainWindow, "objectName": "assetSelectorButton", "type": "StatusComboBox"}
mainWallet_Send_Popup_Asset_List = {"container": statusDesktop_mainWindow, "objectName": "assetSelectorList", "type": "StatusListView"}
mainWallet_Send_Popup_GasPrice_Input = {"container": statusDesktop_mainWindow, "objectName": "gasPriceSelectorInput", "type": "StyledTextField"}

# Add/Edit account popup:
mainWallet_AddEditAccountPopup_Content = {"container": statusDesktop_mainWindow, "objectName": "AddAccountPopup-Content", "type": "Item", "visible": True}
mainWallet_AddEditAccountPopup_PrimaryButton = {"container": statusDesktop_mainWindow, "objectName": "AddAccountPopup-PrimaryButton", "type": "StatusButton", "visible": True}
mainWallet_AddEditAccountPopup_BackButton = {"container": statusDesktop_mainWindow, "objectName": "AddAccountPopup-BackButton", "type": "StatusBackButton", "visible": True}
mainWallet_AddEditAccountPopup_AccountNameComponent = {"container": mainWallet_AddEditAccountPopup_Content, "objectName": "AddAccountPopup-AccountName", "type": "StatusInput", "visible": True}
mainWallet_AddEditAccountPopup_AccountName = {"container": mainWallet_AddEditAccountPopup_AccountNameComponent, "id": "edit", "type": "TextEdit", "unnamed": 1, "visible": True}
mainWallet_AddEditAccountPopup_AccountColorComponent = {"container": mainWallet_AddEditAccountPopup_Content, "objectName": "AddAccountPopup-AccountColor", "type": "StatusColorSelectorGrid", "visible": True}
mainWallet_AddEditAccountPopup_AccountColorSelector = {"container": mainWallet_AddEditAccountPopup_AccountColorComponent, "type": "Repeater", "objectName": "statusColorRepeater", "visible": True}
mainWallet_AddEditAccountPopup_AccountEmojiPopupButton = {"container": mainWallet_AddEditAccountPopup_Content, "objectName": "AddAccountPopup-AccountEmoji", "type": "StatusFlatRoundButton", "visible": True}
mainWallet_AddEditAccountPopup_AccountEmojiSearchBox = {"container": statusDesktop_mainWindow, "objectName": "StatusEmojiPopup_searchBox", "type": "TextEdit", "visible": True}
mainWallet_AddEditAccountPopup_AccountEmoji = {"container": statusDesktop_mainWindow, "objectName": "statusEmoji_%NAME%", "type": "StatusEmoji", "visible": True}
mainWallet_AddEditAccountPopup_SelectedOrigin = {"container": mainWallet_AddEditAccountPopup_Content, "objectName": "AddAccountPopup-SelectedOrigin", "type": "StatusListItem", "visible": True}
mainWallet_AddEditAccountPopup_OriginOption_Placeholder = {"container": statusDesktop_mainWindow, "objectName": "AddAccountPopup-OriginOption-%NAME%", "type": "StatusListItem", "visible": True}
mainWallet_AddEditAccountPopup_OriginOptionNewMasterKey = {"container": statusDesktop_mainWindow, "objectName": "AddAccountPopup-OriginOption-LABEL-OPTION-ADD-NEW-MASTER-KEY", "type": "StatusListItem", "visible": True}
mainWallet_AddEditAccountPopup_OriginOptionWatchOnlyAcc = {"container": statusDesktop_mainWindow, "objectName": "AddAccountPopup-OriginOption-LABEL-OPTION-ADD-WATCH-ONLY-ACC", "type": "StatusListItem", "visible": True}
mainWallet_AddEditAccountPopup_AccountWatchOnlyAddressComponent = {"container": mainWallet_AddEditAccountPopup_Content, "objectName": "AddAccountPopup-WatchOnlyAddress", "type": "StatusInput", "visible": True}
mainWallet_AddEditAccountPopup_AccountWatchOnlyAddress = {"container": mainWallet_AddEditAccountPopup_AccountWatchOnlyAddressComponent, "id": "edit", "type": "TextEdit", "unnamed": 1, "visible": True}
mainWallet_AddEditAccountPopup_EditDerivationPathButton = {"container": statusDesktop_mainWindow, "objectName": "AddAccountPopup-EditDerivationPath", "type": "StatusButton", "visible": True}
mainWallet_AddEditAccountPopup_ResetDerivationPathButton = {"container": statusDesktop_mainWindow, "objectName": "AddAccountPopup-ResetDerivationPath", "type": "StatusLinkText", "enabled": True, "visible": True}
mainWallet_AddEditAccountPopup_DerivationPathInputComponent = {"container": statusDesktop_mainWindow, "objectName": "AddAccountPopup-DerivationPathInput", "type": "DerivationPathInput", "visible": True}
mainWallet_AddEditAccountPopup_DerivationPathInput = {"container": mainWallet_AddEditAccountPopup_DerivationPathInputComponent, "id": "edit", "type": "TextEdit", "unnamed": 1, "visible": True}
mainWallet_AddEditAccountPopup_PreDefinedDerivationPathsButton = {"container": mainWallet_AddEditAccountPopup_DerivationPathInputComponent, "objectName": "chevron-down-icon", "type": "StatusIcon", "visible": True}
mainWallet_AddEditAccountPopup_PreDefinedPathsOptionTestnetRopsten = {"container": statusDesktop_mainWindow, "objectName": "AddAccountPopup-PreDefinedDerivationPath-Ethereum Testnet (Ropsten)", "type": "StatusListItem", "visible": True}
mainWallet_AddEditAccountPopup_GeneratedAddressComponent = {"container": statusDesktop_mainWindow, "objectName": "AddAccountPopup-GeneratedAddress", "type": "StatusListItem", "visible": True}
mainWallet_AddEditAccountPopup_GeneratedAddress_99 = {"container": statusDesktop_mainWindow, "objectName": "AddAccountPopup-GeneratedAddress-99", "type": "Rectangle", "visible": True}
mainWallet_AddEditAccountPopup_PageIndicatorComponent = {"container": statusDesktop_mainWindow, "objectName": "AddAccountPopup-GeneratedAddressesListPageIndicatior", "occurrence": 5, "type": "Rectangle", "visible": True}
mainWallet_AddEditAccountPopup_PageIndicatorPage_20 = {"container": statusDesktop_mainWindow, "objectName": "Page-20", "type": "StatusBaseButton", "visible": True}
mainWallet_AddEditAccountPopup_NonEthDerivationPathCheckBox = {"checkable": True, "container": statusDesktop_mainWindow, "objectName": "AddAccountPopup-ConfirmAddingNonEthDerivationPath", "type": "StatusCheckBox", "visible": True}
mainWallet_AddEditAccountPopup_MasterKey_ImportPrivateKeyOption = {"container": mainWallet_AddEditAccountPopup_Content, "objectName": "AddAccountPopup-ImportPrivateKey", "type": "StatusListItem", "visible": True}
mainWallet_AddEditAccountPopup_MasterKey_ImportSeedPhraseOption = {"container": mainWallet_AddEditAccountPopup_Content, "objectName": "AddAccountPopup-ImportUsingSeedPhrase", "type": "StatusListItem", "visible": True}
mainWallet_AddEditAccountPopup_MasterKey_GenerateSeedPhraseOption = {"container": mainWallet_AddEditAccountPopup_Content, "objectName": "AddAccountPopup-GenerateNewMasterKey", "type": "StatusListItem", "visible": True}
mainWallet_AddEditAccountPopup_MasterKey_GoToKeycardSettingsOption = {"container": mainWallet_AddEditAccountPopup_Content, "objectName": "AddAccountPopup-GoToKeycardSettings", "type": "StatusButton", "visible": True}
mainWallet_AddEditAccountPopup_PrivateKey = {"container": mainWallet_AddEditAccountPopup_Content, "objectName": "AddAccountPopup-PrivateKeyInput", "type": "StatusPasswordInput", "visible": True}
mainWallet_AddEditAccountPopup_PrivateKeyNameComponent = {"container": mainWallet_AddEditAccountPopup_Content, "objectName": "AddAccountPopup-PrivateKeyName", "type": "StatusInput", "visible": True}
mainWallet_AddEditAccountPopup_PrivateKeyName = {"container": mainWallet_AddEditAccountPopup_PrivateKeyNameComponent, "id": "edit", "type": "TextEdit", "unnamed": 1, "visible": True}
mainWallet_AddEditAccountPopup_ImportedSeedPhraseKeyNameComponent = {"container": mainWallet_AddEditAccountPopup_Content, "objectName": "AddAccountPopup-ImportedSeedPhraseKeyName", "type": "StatusInput", "visible": True}
mainWallet_AddEditAccountPopup_ImportedSeedPhraseKeyName = {"container": mainWallet_AddEditAccountPopup_ImportedSeedPhraseKeyNameComponent, "id": "edit", "type": "TextEdit", "unnamed": 1, "visible": True}
mainWallet_AddEditAccountPopup_GeneratedSeedPhraseKeyNameComponent = {"container": mainWallet_AddEditAccountPopup_Content, "objectName": "AddAccountPopup-GeneratedSeedPhraseKeyName", "type": "StatusInput", "visible": True}
mainWallet_AddEditAccountPopup_GeneratedSeedPhraseKeyName = {"container": mainWallet_AddEditAccountPopup_GeneratedSeedPhraseKeyNameComponent, "id": "edit", "type": "TextEdit", "unnamed": 1, "visible": True}
mainWallet_AddEditAccountPopup_HavePenAndPaperCheckBox = {"checkable": True, "container": mainWallet_AddEditAccountPopup_Content, "objectName": "AddAccountPopup-HavePenAndPaper", "type": "StatusCheckBox", "visible": True}
mainWallet_AddEditAccountPopup_SeedPhraseWrittenCheckBox = {"checkable": True, "container": mainWallet_AddEditAccountPopup_Content, "objectName": "AddAccountPopup-SeedPhraseWritten", "type": "StatusCheckBox", "visible": True}
mainWallet_AddEditAccountPopup_StoringSeedPhraseConfirmedCheckBox = {"checkable": True, "container": mainWallet_AddEditAccountPopup_Content, "objectName": "AddAccountPopup-StoringSeedPhraseConfirmed", "type": "StatusCheckBox", "visible": True}
mainWallet_AddEditAccountPopup_SeedBackupAknowledgeCheckBox = {"checkable": True, "container": mainWallet_AddEditAccountPopup_Content, "objectName": "AddAccountPopup-SeedBackupAknowledge", "type": "StatusCheckBox", "visible": True}
mainWallet_AddEditAccountPopup_RevealSeedPhraseButton = {"container": mainWallet_AddEditAccountPopup_Content, "objectName": "AddAccountPopup-RevealSeedPhrase", "type": "StatusButton", "visible": True}
mainWallet_AddEditAccountPopup_SeedPhraseWordAtIndex_Placeholder = {"container": mainWallet_AddEditAccountPopup_Content, "objectName": "SeedPhraseWordAtIndex-%WORD-INDEX%", "type": "StatusSeedPhraseInput", "visible": True}
mainWallet_AddEditAccountPopup_EnterSeedPhraseWordComponent = {"container": mainWallet_AddEditAccountPopup_Content, "objectName": "AddAccountPopup-EnterSeedPhraseWord", "type": "StatusInput", "visible": True}
mainWallet_AddEditAccountPopup_EnterSeedPhraseWord = {"container": mainWallet_AddEditAccountPopup_EnterSeedPhraseWordComponent, "id": "edit", "type": "TextEdit", "unnamed": 1, "visible": True}

mainWallet_AddEditAccountPopup_12WordsButton = {"container": mainWallet_AddEditAccountPopup_Content, "objectName": "12SeedButton", "type": "StatusSwitchTabButton"}
mainWallet_AddEditAccountPopup_18WordsButton = {"container": mainWallet_AddEditAccountPopup_Content, "objectName": "18SeedButton", "type": "StatusSwitchTabButton"}
mainWallet_AddEditAccountPopup_24WordsButton = {"container": mainWallet_AddEditAccountPopup_Content, "objectName": "24SeedButton", "type": "StatusSwitchTabButton"}
mainWallet_AddEditAccountPopup_SPWord_1 = {"container": mainWallet_AddEditAccountPopup_Content, "type": "TextEdit", "objectName": "statusSeedPhraseInputField1"}
mainWallet_AddEditAccountPopup_SPWord_2 = {"container": mainWallet_AddEditAccountPopup_Content, "type": "TextEdit", "objectName": "statusSeedPhraseInputField2"}
mainWallet_AddEditAccountPopup_SPWord_3 = {"container": mainWallet_AddEditAccountPopup_Content, "type": "TextEdit", "objectName": "statusSeedPhraseInputField3"}
mainWallet_AddEditAccountPopup_SPWord_4 = {"container": mainWallet_AddEditAccountPopup_Content, "type": "TextEdit", "objectName": "statusSeedPhraseInputField4"}
mainWallet_AddEditAccountPopup_SPWord_5 = {"container": mainWallet_AddEditAccountPopup_Content, "type": "TextEdit", "objectName": "statusSeedPhraseInputField5"}
mainWallet_AddEditAccountPopup_SPWord_6 = {"container": mainWallet_AddEditAccountPopup_Content, "type": "TextEdit", "objectName": "statusSeedPhraseInputField6"}
mainWallet_AddEditAccountPopup_SPWord_7 = {"container": mainWallet_AddEditAccountPopup_Content, "type": "TextEdit", "objectName": "statusSeedPhraseInputField7"}
mainWallet_AddEditAccountPopup_SPWord_8 = {"container": mainWallet_AddEditAccountPopup_Content, "type": "TextEdit", "objectName": "statusSeedPhraseInputField8"}
mainWallet_AddEditAccountPopup_SPWord_9 = {"container": mainWallet_AddEditAccountPopup_Content, "type": "TextEdit", "objectName": "statusSeedPhraseInputField9"}
mainWallet_AddEditAccountPopup_SPWord_10 = {"container": mainWallet_AddEditAccountPopup_Content, "type": "TextEdit", "objectName": "statusSeedPhraseInputField10"}
mainWallet_AddEditAccountPopup_SPWord_11 = {"container": mainWallet_AddEditAccountPopup_Content, "type": "TextEdit", "objectName": "statusSeedPhraseInputField11"}
mainWallet_AddEditAccountPopup_SPWord_12 = {"container": mainWallet_AddEditAccountPopup_Content, "type": "TextEdit", "objectName": "statusSeedPhraseInputField12"}
mainWallet_AddEditAccountPopup_SPWord_13 = {"container": mainWallet_AddEditAccountPopup_Content, "type": "TextEdit", "objectName": "statusSeedPhraseInputField13"}
mainWallet_AddEditAccountPopup_SPWord_14 = {"container": mainWallet_AddEditAccountPopup_Content, "type": "TextEdit", "objectName": "statusSeedPhraseInputField14"}
mainWallet_AddEditAccountPopup_SPWord_15 = {"container": mainWallet_AddEditAccountPopup_Content, "type": "TextEdit", "objectName": "statusSeedPhraseInputField15"}
mainWallet_AddEditAccountPopup_SPWord_16 = {"container": mainWallet_AddEditAccountPopup_Content, "type": "TextEdit", "objectName": "statusSeedPhraseInputField16"}
mainWallet_AddEditAccountPopup_SPWord_17 = {"container": mainWallet_AddEditAccountPopup_Content, "type": "TextEdit", "objectName": "statusSeedPhraseInputField17"}
mainWallet_AddEditAccountPopup_SPWord_18 = {"container": mainWallet_AddEditAccountPopup_Content, "type": "TextEdit", "objectName": "statusSeedPhraseInputField18"}
mainWallet_AddEditAccountPopup_SPWord_19 = {"container": mainWallet_AddEditAccountPopup_Content, "type": "TextEdit", "objectName": "statusSeedPhraseInputField19"}
mainWallet_AddEditAccountPopup_SPWord_20 = {"container": mainWallet_AddEditAccountPopup_Content, "type": "TextEdit", "objectName": "statusSeedPhraseInputField20"}
mainWallet_AddEditAccountPopup_SPWord_21 = {"container": mainWallet_AddEditAccountPopup_Content, "type": "TextEdit", "objectName": "statusSeedPhraseInputField21"}
mainWallet_AddEditAccountPopup_SPWord_22 = {"container": mainWallet_AddEditAccountPopup_Content, "type": "TextEdit", "objectName": "statusSeedPhraseInputField22"}
mainWallet_AddEditAccountPopup_SPWord_23 = {"container": mainWallet_AddEditAccountPopup_Content, "type": "TextEdit", "objectName": "statusSeedPhraseInputField23"}
mainWallet_AddEditAccountPopup_SPWord_24 = {"container": mainWallet_AddEditAccountPopup_Content, "type": "TextEdit", "objectName": "statusSeedPhraseInputField24"}

# Remove account popup:
mainWallet_Remove_Account_Popup_Account_Notification = {"container": statusDesktop_mainWindow, "objectName": "RemoveAccountPopup-Notification", "type": "StatusBaseText", "visible": True}
mainWallet_Remove_Account_Popup_Account_Path_Component = {"container": statusDesktop_mainWindow, "objectName": "RemoveAccountPopup-DerivationPath", "type": "StatusInput", "visible": True}
mainWallet_Remove_Account_Popup_Account_Path = {"container": mainWallet_Remove_Account_Popup_Account_Path_Component, "id": "edit", "type": "TextEdit", "unnamed": 1, "visible": True}
mainWallet_Remove_Account_Popup_HavePenPaperCheckBox = {"checkable": True, "container": statusDesktop_mainWindow, "objectName": "RemoveAccountPopup-HavePenPaper", "type": "StatusCheckBox", "visible": True}
mainWallet_Remove_Account_Popup_ConfirmButton = {"container": statusDesktop_mainWindow, "objectName": "RemoveAccountPopup-ConfirmButton", "type": "StatusButton", "visible": True}
mainWallet_Remove_Account_Popup_CancelButton = {"container": statusDesktop_mainWindow, "objectName": "RemoveAccountPopup-CancelButton", "type": "StatusFlatButton", "visible": True}

# saved address view
mainWallet_Saved_Addreses_Add_Buttton = {"container": statusDesktop_mainWindow, "objectName": "addNewAddressBtn", "type": "StatusButton"}
mainWallet_Saved_Addreses_List = {"container": statusDesktop_mainWindow, "objectName": "SavedAddressesView_savedAddresses", "type": "StatusListView"}
mainWallet_Saved_Addreses_More_Edit = {"container": statusDesktop_mainWindow, "objectName": "editroot", "type": "StatusMenuItem"}
mainWallet_Saved_Addreses_More_Delete = {"container": statusDesktop_mainWindow, "objectName": "deleteSavedAddress", "type": "StatusMenuItem"}
mainWallet_Saved_Addreses_More_Confirm_Delete = {"container": statusDesktop_mainWindow, "objectName": "confirmDeleteSavedAddress", "type": "StatusButton"}

# saved address add popup
mainWallet_Saved_Addreses_Popup_Name_Input = {"container": statusDesktop_mainWindow, "objectName": "savedAddressNameInput", "type": "TextEdit"}
mainWallet_Saved_Addreses_Popup_Address_Input = {"container": statusDesktop_mainWindow, "objectName": "savedAddressAddressInput", "type": "StatusInput"}
mainWallet_Saved_Addreses_Popup_Address_Input_Edit = {"container": statusDesktop_mainWindow, "objectName": "savedAddressAddressInputEdit", "type": "TextEdit"}
mainWallet_Saved_Addreses_Popup_Address_Add_Button = {"container": statusDesktop_mainWindow, "objectName": "addSavedAddress", "type": "StatusButton"}

# Collectibles view
mainWallet_Collections_Repeater = {"container": statusDesktop_mainWindow, "objectName": "collectionsRepeater", "type": "Repeater"}
mainWallet_Collectibles_Repeater = {"container": statusDesktop_mainWindow, "objectName": "collectiblesRepeater", "type": "Repeater"}

# Shared Popup
sharedPopup_Popup_Content = {"container": statusDesktop_mainWindow, "objectName": "KeycardSharedPopupContent", "type": "Item"}
sharedPopup_Password_Input = {"container": sharedPopup_Popup_Content, "objectName": "keycardPasswordInput", "type": "TextField"}
sharedPopup_Primary_Button = {"container": statusDesktop_mainWindow, "objectName": "PrimaryButton", "type": "StatusButton"}

# Transactions view
mainWallet_Transactions_List = {"container": statusDesktop_mainWindow, "objectName": "walletAccountTransactionList", "type": "StatusListView"}
mainWallet_Transactions_Detail_View_Header = {"container": statusDesktop_mainWindow, "objectName": "transactionDetailHeader", "type": "TransactionDelegate"}
