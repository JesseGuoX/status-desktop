import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0

import StatusQ.Core 0.1
import StatusQ.Core.Theme 0.1
import StatusQ.Components 0.1
import StatusQ.Controls 0.1
import StatusQ.Popups.Dialog 0.1

import utils 1.0

import SortFilterProxyModel 0.2

import "../controls"

StatusScrollView {
    id: root

    required property var layer1Networks
    required property var layer2Networks
    property var testNetworks: null
    property var singleSelection
    property bool useEnabledRole: true

    signal toggleNetwork(var network, var model, int index)

    /// Mirrors Nim's UxEnabledState enum from networks/item.nim
    enum UxEnabledState {
        Enabled,
        AllEnabled,
        Disabled
    }

    contentHeight: content.height
    contentWidth: availableWidth
    padding: 0

    ScrollBar.horizontal.policy: ScrollBar.AlwaysOff

    Column {
        id: content
        width: childrenRect.width
        spacing: 4

        Repeater {
            id: chainRepeater1

            width: parent.width
            height: parent.height

            objectName: "networkSelectPopupChainRepeaterLayer1"
            model: root.layer1Networks

            delegate: NetworkSelectItemDelegate {
                height: 48
                width: root.width
                singleSelection: root.singleSelection
                networkModel: chainRepeater1.model
                onToggleNetwork:  root.toggleNetwork(network, model, index)
            }
        }

        StatusBaseText {
            font.pixelSize: Style.current.primaryTextFontSize
            color: Theme.palette.baseColor1
            text: qsTr("Layer 2")
            height: 40
            leftPadding: 16
            topPadding: 10
            verticalAlignment: Text.AlignVCenter

            visible: chainRepeater2.count > 0
        }

        Repeater {
            id: chainRepeater2

            model: root.layer2Networks
            delegate: NetworkSelectItemDelegate {
                height: 48
                width: root.width
                singleSelection: root.singleSelection
                networkModel: chainRepeater2.model
                onToggleNetwork:  root.toggleNetwork(network, model, index)
            }
        }

        Repeater {
            id: chainRepeater3
            model: root.testNetworks
            delegate: NetworkSelectItemDelegate {
                height: 48
                width: root.width
                singleSelection: root.singleSelection
                networkModel: chainRepeater3.model
                onToggleNetwork:  root.toggleNetwork(network, model, index)
            }
        }
    }

    ButtonGroup {
        id: radioBtnGroup
    }
}
