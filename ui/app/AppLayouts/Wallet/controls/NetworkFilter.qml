import QtQuick 2.15
import QtQuick.Layouts 1.13

import StatusQ.Core 0.1
import StatusQ.Core.Theme 0.1
import StatusQ.Core.Utils 0.1
import StatusQ.Components 0.1
import StatusQ.Controls 0.1

import utils 1.0

import "../views"

StatusComboBox {
    id: root

    required property var allNetworks
    required property var layer1Networks
    required property var layer2Networks
    required property var testNetworks
    required property var enabledNetworks
    property bool multiSelection: true

    /// \c network is a network.model.nim entry
    /// It is called for every toggled network if \c multiSelection is \c true
    /// If \c multiSelection is \c false, it is called only for the selected network when the selection changes
    signal toggleNetwork(var network)

    QtObject {
        id: d

        property string selectedChainName: ""
        property string selectedIconUrl: ""
        property bool allSelected: root.enabledNetworks.count === root.allNetworks.count

        // Persist selection between selectPopupLoader reloads
        property var currentModel: layer1Networks
        property int currentIndex: 0
    }

    Component.onCompleted: {
        if (!multiSelection && d.currentModel.count > 0) {
            d.selectedChainName = d.currentModel.rowData(d.currentIndex, "chainName")
            d.selectedIconUrl = d.currentModel.rowData(d.currentIndex, "iconUrl")
            root.toggleNetwork(ModelUtils.get(d.currentModel, d.currentIndex))
        }
    }

    control.padding: 12
    control.spacing: 0
    control.rightPadding: 36
    control.topPadding: 7
    control.popup.width: 430

    size: StatusComboBox.Size.Small

    control.background: Rectangle {
        height: 38
        radius: 8
        color: root.control.hovered ? Theme.palette.baseColor2 : "transparent"
        border.color: Theme.palette.directColor7
    }

    contentItem: RowLayout {
        spacing: 16
        StatusSmartIdenticon {
            Layout.alignment: Qt.AlignVCenter
            asset.height: 24
            asset.width: 24
            asset.isImage: !root.multiSelection
            asset.name: !root.multiSelection ? Style.svg(d.selectedIconUrl) : ""
            active: !root.multiSelection
            visible: active
        }
        StatusBaseText {
            Layout.alignment: Qt.AlignVCenter
            Layout.fillWidth: true
            font.pixelSize: 13
            font.weight: Font.Medium
            elide: Text.ElideRight
            lineHeight: 24
            lineHeightMode: Text.FixedHeight
            verticalAlignment: Text.AlignVCenter
            text: root.multiSelection ? (d.allSelected ? qsTr("All networks") : "") : d.selectedChainName
            color: Theme.palette.baseColor1
            visible: !!text
        }
        Row {
            spacing: -4
            visible: !d.allSelected && chainRepeater.count > 0
            Repeater {
                id: chainRepeater
                model: root.enabledNetworks
                delegate: StatusRoundedImage {
                    width: 24
                    height: 24
                    visible: image.source !== ""
                    border.width: index === 0 ? 0 : 1
                    border.color: Theme.palette.white
                    image.source: Style.svg("tiny/" + model.iconUrl)
                    z: index + 1
                }
            }
        }
    }

    control.popup.contentItem: NetworkSelectionView {
        layer1Networks: root.layer1Networks
        layer2Networks: root.layer2Networks
        testNetworks: root.testNetworks

        implicitWidth: contentWidth
        implicitHeight: contentHeight

        singleSelection {
            enabled: !root.multiSelection
            currentModel: d.currentModel
            currentIndex: d.currentIndex
        }

        useEnabledRole: false

        onToggleNetwork: (network, networkModel, index) => {
                             d.selectedChainName = network.chainName
                             d.selectedIconUrl = network.iconUrl
                             d.currentModel = networkModel
                             d.currentIndex = index
                             root.toggleNetwork(network)
                             if(singleSelection.enabled)
                                control.popup.close()
                         }
    }
}
