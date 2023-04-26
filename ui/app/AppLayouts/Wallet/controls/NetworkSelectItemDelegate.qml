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

StatusListItem {
    id: root

    property var networkModel: null
    property bool useEnabledRole: true

    property var singleSelection

    /// \c network is a network.model.nim entry. \c model and \c index for the current selection
    /// It is called for every toggled network if \c singleSelection.enabled is \c false
    /// If \c singleSelection.enabled is \c true, it is called only for the selected network when the selection changes
    /// \see SingleSelectionInfo
    signal toggleNetwork(var network, var model, int index)

    /// Mirrors Nim's UxEnabledState enum from networks/item.nim
    enum UxEnabledState {
        Enabled,
        AllEnabled,
        Disabled
    }

    QtObject {
        id: d
        property SingleSelectionInfo tmpObject: SingleSelectionInfo { enabled: true }
    }

    objectName: model.chainName
    title: model.chainName
    asset.height: 24
    asset.width: 24
    asset.isImage: true
    asset.name: Style.svg(model.iconUrl)
    onClicked: {
        if(!root.singleSelection.enabled) {
            checkBox.nextCheckState()
        } else if(!radioButton.checked) {   // Don't allow uncheck
            radioButton.toggle()
        }
    }

    components: [
        StatusCheckBox {
            id: checkBox
            tristate: true
            visible: !root.singleSelection.enabled

            checkState: {
                if(root.useEnabledRole) {
                    return model.isEnabled ? Qt.Checked : Qt.Unchecked
                } else if(model.enabledState === NetworkSelectItemDelegate.Enabled) {
                    return Qt.Checked
                } else {
                    if( model.enabledState === NetworkSelectItemDelegate.AllEnabled) {
                        return Qt.PartiallyChecked
                    } else {
                        return Qt.Unchecked
                    }
                }
            }

            nextCheckState: () => {
                                Qt.callLater(root.toggleNetwork, model, root.networkModel, model.index)
                                return Qt.PartiallyChecked
                            }
        },
        StatusRadioButton {
            id: radioButton
            visible: root.singleSelection.enabled
            size: StatusRadioButton.Size.Large
            ButtonGroup.group: radioBtnGroup
            checked: root.singleSelection.currentModel === root.networkModel && root.singleSelection.currentIndex === model.index

            property SingleSelectionInfo exchangeObject: null
            function setNewInfo(networkModel, index) {
                d.tmpObject.currentModel = networkModel
                d.tmpObject.currentIndex = index
                exchangeObject = d.tmpObject
                d.tmpObject = root.singleSelection
                root.singleSelection = exchangeObject
                exchangeObject = null
            }

            onCheckedChanged: {
                if(checked && (root.singleSelection.currentModel !== root.networkModel || root.singleSelection.currentIndex !== model.index)) {
                    setNewInfo(root.networkModel, model.index)
                    root.toggleNetwork(model, root.networkModel, model.index)
                    close()
                }
            }
        }
    ]

    ButtonGroup {
        id: radioBtnGroup
    }
}
