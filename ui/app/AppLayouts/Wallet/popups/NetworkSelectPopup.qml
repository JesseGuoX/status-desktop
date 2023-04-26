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

import "../stores/NetworkSelectPopup"
import "../controls"

StatusDialog {
    id: root

    modal: false
    standardButtons: Dialog.NoButton

    anchors.centerIn: undefined

    padding: 4
    width: 360
    implicitHeight: Math.min(432, scrollView.contentHeight + root.padding * 2)

    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside

    required property var layer1Networks
    required property var layer2Networks
    property var testNetworks: null

    /// Grouped properties for single selection state. \c singleSelection.enabled is \c false by default
    /// \see SingleSelectionInfo
    property alias singleSelection: d.singleSelection

    property bool useEnabledRole: true

    /// \c network is a network.model.nim entry. \c model and \c index for the current selection
    /// It is called for every toggled network if \c singleSelection.enabled is \c false
    /// If \c singleSelection.enabled is \c true, it is called only for the selected network when the selection changes
    /// \see SingleSelectionInfo
    signal toggleNetwork(var network, var model, int index)

    QtObject {
        id: d

        property SingleSelectionInfo singleSelection: SingleSelectionInfo {}
    }


    background: Rectangle {
        radius: Style.current.radius
        color: Style.current.background
        border.color: Style.current.border
        layer.enabled: true
        layer.effect: DropShadow{
            verticalOffset: 3
            radius: 8
            samples: 15
            fast: true
            cached: true
            color: "#22000000"
        }
    }

    contentItem: StatusScrollView {
        id: scrollView

        width: root.width
        height: root.height
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
                    networkModel: chainRepeater1.model
                    useEnabledRole: root.useEnabledRole
                    singleSelection: d.singleSelection
                    onToggleNetwork: root.toggleNetwork(network, model, index)
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
                    networkModel: chainRepeater2.model
                    useEnabledRole: root.useEnabledRole
                    singleSelection: d.singleSelection
                    onToggleNetwork: root.toggleNetwork(network, model, index)
                }
            }

            Repeater {
                id: chainRepeater3
                model: root.testNetworks
                delegate: NetworkSelectItemDelegate {
                    networkModel: chainRepeater3.model
                    useEnabledRole: root.useEnabledRole
                    singleSelection: d.singleSelection
                    onToggleNetwork: root.toggleNetwork(network, model, index)
                }
            }
        }
    }
}
