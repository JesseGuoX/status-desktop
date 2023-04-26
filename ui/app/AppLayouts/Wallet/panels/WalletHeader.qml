import QtQuick 2.13
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.13

import StatusQ.Core 0.1
import StatusQ.Controls 0.1
import StatusQ.Components 0.1
import StatusQ.Core.Theme 0.1
import StatusQ.Core.Utils 0.1 as StatusQUtils

import utils 1.0

import shared 1.0
import shared.panels 1.0
import shared.status 1.0
import "../controls"
import "../stores"

Item {
    id: root

    property var networkConnectionStore
    property var overview
    property var store
    property var walletStore

    implicitHeight: 88

    GridLayout {
        width: parent.width
        columns: 3
        rowSpacing: 0

        // account + balance
        RowLayout {
            Layout.preferredHeight: 56
            spacing: Style.current.halfPadding
            StatusBaseText {
                objectName: "accountName"
                Layout.alignment: Qt.AlignVCenter
                font.pixelSize: 28
                font.bold: true
                text: overview.name
                color: overview.color
                lineHeightMode: Text.FixedHeight
                lineHeight: 38
            }
            StatusEmoji {
                Layout.alignment: Qt.AlignVCenter
                Layout.preferredWidth: 28
                Layout.preferredHeight: 28
                emojiId: StatusQUtils.Emoji.iconId(overview.emoji ?? "", StatusQUtils.Emoji.size.big) || ""
            }
        }

        StatusButton {
            Layout.alignment: Qt.AlignTrailing
            Layout.rightMargin: -60
            Layout.preferredHeight: 38

            borderColor: Theme.palette.baseColor2
            normalColor: Theme.palette.transparent
            hoverColor: Theme.palette.baseColor2
            font.weight: Font.Normal
            icon.name: "download"
            textColor: hovered ? Theme.palette.directColor1 : Theme.palette.baseColor1
            text: walletStore.getAllNetworksSupportedString(hovered) + (overview.ens ||  StatusQUtils.Utils.elideText(overview.mixedcaseAddress, 6, 4))
        }

        // network filter
        NetworkFilterNew {
            id: networkFilter

            Layout.alignment: Qt.AlignTrailing
//            Layout.rowSpan: 2

            allNetworks: walletStore.allNetworks
            layer1Networks: walletStore.layer1Networks
            layer2Networks: walletStore.layer2Networks
            testNetworks: walletStore.testNetworks
            enabledNetworks: walletStore.enabledNetworks

            onToggleNetwork: (network) => {
                walletStore.toggleNetwork(network.chainId)
            }
        }

        RowLayout {
            spacing: 4
            visible: !networkConnectionStore.accountBalanceNotAvailable
            StatusTextWithLoadingState {
                font.pixelSize: 28
                font.bold: true
                customColor: Theme.palette.directColor1
                text: loading ? Constants.dummyText : LocaleUtils.currencyAmountToLocaleString(root.overview.currencyBalance, {noSymbol: true})
                loading: root.overview.balanceLoading
                lineHeightMode: Text.FixedHeight
                lineHeight: 38
            }
            StatusTextWithLoadingState {
                Layout.alignment: Qt.AlignBottom
                font.pixelSize: 15
                font.bold: true
                customColor: Theme.palette.directColor1
                text: loading ? Constants.dummyText : root.overview.currencyBalance.symbol //LocaleUtils.currencyAmountToLocaleString(root.overview.currencyBalance)
                loading: root.overview.balanceLoading
                lineHeightMode: Text.FixedHeight
                lineHeight: 25
            }
        }
    }
}
