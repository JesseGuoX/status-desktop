import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.14

import AppLayouts.Chat.panels.communities 1.0
import StatusQ.Core.Theme 0.1
import StatusQ.Core.Utils 0.1

import Storybook 1.0
import Models 1.0


SplitView {
    orientation: Qt.Vertical
    SplitView.fillWidth: true

    Logs { id: logs }

    QtObject {
        id: permissionsStoreMock

        readonly property ListModel permissionsModel: ListModel {}

        readonly property QtObject _d: QtObject {
            id: d

            property int keyCounter: 0

            function createPermissionEntry(holdings, permissionType, isPrivate,
                                           channels) {
                const permission = {
                    holdingsListModel: holdings,
                    channelsListModel: channels,
                    permissionType,
                    isPrivate
                }

                return permission
            }
        }

        function createPermission(holdings, permissionType, isPrivate, channels) {
            const permissionEntry = d.createPermissionEntry(
                                      holdings, permissionType, isPrivate, channels)

            permissionEntry.key = "" + d.keyCounter++
            permissionsModel.append(permissionEntry)
        }

        function editPermission(key, holdings, permissionType, channels, isPrivate) {
            const permissionEntry = d.createPermissionEntry(
                                      holdings, permissionType, isPrivate, channels)

            const index = ModelUtils.indexOf(permissionsModel, "key", key)
            permissionsModel.set(index, permissionEntry)
        }

        function removePermission(key) {
            const index = ModelUtils.indexOf(permissionsModel, "key", key)
            permissionsModel.remove(index)
        }
    }

    Rectangle {
        SplitView.fillWidth: true
        SplitView.fillHeight: true
        color: Theme.palette.statusAppLayout.rightPanelBackgroundColor

        CommunityPermissionsSettingsPanel {
            id: communityPermissionsSettingsPanel

            anchors.fill: parent
            anchors.topMargin: 50

            permissionsModel: permissionsStoreMock.permissionsModel
            assetsModel: AssetsModel {}
            collectiblesModel: CollectiblesModel {}
            channelsModel: ChannelsModel {}

            isOwner: isOwnerCheckBox.checked

            showWhoHoldsSwitch: true

            onCreatePermissionRequested: {
                permissionsStoreMock.createPermission(holdings, permissionType,
                                                      isPrivate, channels)
            }

            onUpdatePermissionRequested:
                permissionsStoreMock.editPermission(key, holdings, permissionType,
                                                    channels, isPrivate)

            onRemovePermissionRequested:
                permissionsStoreMock.removePermission(key)

            communityDetails: QtObject {
                readonly property string name: "Socks"
                readonly property string image: ModelsData.icons.socks
                readonly property string color: "red"
            }
        }
    }

    LogsAndControlsPanel {
        id: logsAndControlsPanel

        SplitView.minimumHeight: 100
        SplitView.preferredHeight: 150

        logsView.logText: logs.logText

        ColumnLayout {
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right

            CheckBox {
                id: isOwnerCheckBox

                text: "Is owner"
            }

            Label {
                text: "Is dirty: " + communityPermissionsSettingsPanel.dirty
            }
        }
    }
}
