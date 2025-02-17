import QtQuick 2.13
import SortFilterProxyModel 0.2

import utils 1.0
import shared.status 1.0
import shared.panels 1.0
import StatusQ.Core.Theme 0.1
import StatusQ.Core 0.1
import StatusQ.Components 0.1

import "../../stores"
import "../../controls"
import "../../popups"

Column {
    id: root

    property WalletStore walletStore

    signal goToNetworksView()
    signal goToAccountView(var account)
    signal goToDappPermissionsView()

    Component.onCompleted: {
        // TODO remove this call and handle it from the backend
        //   once the profile is refactored and the navigation is driven from the backend
        root.walletStore.loadDapps()
    }

    Separator {
        height: 17
    }

    StatusListItem {
        title: qsTr("DApp Permissions")
        height: 64
        width: parent.width
        onClicked: goToDappPermissionsView()
        label: qsTr("%n DApp(s) connected", "", root.walletStore.dappList.count)
        components: [
            StatusIcon {
                icon: "next"
                color: Theme.palette.baseColor1
            }
        ]
    }

    Separator {
        height: 17
    }

    StatusListItem {
        objectName: "networksItem"
        title: qsTr("Networks")
        height: 64
        width: parent.width
        onClicked: goToNetworksView()
        components: [
            StatusIcon {
                icon: "next"
                color: Theme.palette.baseColor1
            }
        ]
    }

    Separator {
        height: 17
    }

    StatusDescriptionListItem {
        height: 64
        subTitle: qsTr("Accounts")
    }

    StatusSectionHeadline {
        text: qsTr("Generated from Your Seed Phrase")
        leftPadding: Style.current.padding
        topPadding: Style.current.halfPadding
        bottomPadding: Style.current.halfPadding/2
    }

    ListView {
        width: parent.width
        height: childrenRect.height
        objectName: "generatedAccounts"
        model: SortFilterProxyModel {
            sourceModel: walletStore.accounts
            filters: ExpressionFilter {
                expression: {
                    return model.walletType === "generated" || model.walletType === ""
                }
            }
        }
        delegate: WalletAccountDelegate {
            width: ListView.view.width
            account: model
            onGoToAccountView: {
                root.goToAccountView(model)
            }
        }
    }

    SortFilterProxyModel {
        id: importedAccounts
        sourceModel: walletStore.accounts
        filters: ExpressionFilter {
            expression: {
                return model.walletType !== "generated" && model.walletType !== "watch" && model.walletType !== ""
            }
        }
    }

    StatusSectionHeadline {
        text: qsTr("Imported")
        leftPadding: Style.current.padding
        topPadding: Style.current.halfPadding
        bottomPadding: Style.current.halfPadding/2
        visible: importedAccounts.count > 0
    }

    Repeater {
        width: parent.width
        model: importedAccounts
        delegate: WalletAccountDelegate {
            width: parent.width
            account: model
            onGoToAccountView: {
                root.goToAccountView(model)
            }
        }
    }

    SortFilterProxyModel {
        id: watchOnlyAccounts
        sourceModel: walletStore.accounts
        filters: ValueFilter {
            roleName: "walletType"
            value: "watch"
        }
    }

    StatusSectionHeadline {
        text: qsTr("Watch-Only")
        leftPadding: Style.current.padding
        topPadding: Style.current.halfPadding
        bottomPadding: Style.current.halfPadding/2
        visible: watchOnlyAccounts.count > 0
    }

    Repeater {
        width: parent.width
        model: watchOnlyAccounts
        delegate: WalletAccountDelegate {
            width: parent.width
            account: model
            onGoToAccountView: {
                root.goToAccountView(model)
            }
        }
    }

    // Adding padding to the end so that when the view is scrolled to the end there is some gap left
    Item {
        height: Style.current.bigPadding
        width: parent.width
    }
}
