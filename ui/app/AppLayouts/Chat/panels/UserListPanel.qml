import QtQuick 2.13
import QtQuick.Controls 2.13

import StatusQ.Core 0.1
import StatusQ.Core.Theme 0.1
import StatusQ.Components 0.1

import shared 1.0
import shared.panels 1.0
import shared.status 1.0
import utils 1.0

import SortFilterProxyModel 0.2

Item {
    id: root
    anchors.fill: parent

    property var usersModel
    property var messageContextMenu
    property string label

    StatusBaseText {
        id: titleText
        anchors.top: parent.top
        anchors.topMargin: Style.current.padding
        anchors.left: parent.left
        anchors.leftMargin: Style.current.padding
        opacity: (root.width > 58) ? 1.0 : 0.0
        visible: (opacity > 0.1)
        font.pixelSize: Style.current.primaryTextFontSize
        font.weight: Font.Medium
        color: Theme.palette.directColor1
        text: root.label
    }

    Item {
        anchors {
            top: titleText.bottom
            topMargin: Style.current.padding
            left: parent.left
            leftMargin: Style.current.halfPadding
            right: parent.right
            rightMargin: Style.current.halfPadding
            bottom: parent.bottom
        }

        clip: true

        StatusListView {
            id: userListView
            objectName: "userListPanel"

            clip: false

            anchors.fill: parent
            anchors.bottomMargin: Style.current.bigPadding
            displayMarginEnd: anchors.bottomMargin

            model: SortFilterProxyModel {
                sourceModel: root.usersModel

                proxyRoles: ExpressionRole {
                    function displayNameProxy(nickname, ensName, displayName, aliasName) {
                        return ProfileUtils.displayName(nickname, ensName, displayName, aliasName)
                    }
                    name: "preferredDisplayName"
                    expression: displayNameProxy(model.localNickname, model.ensName, model.displayName, model.alias)
                }

                sorters: [
                    RoleSorter {
                        roleName: "onlineStatus"
                        sortOrder: Qt.DescendingOrder
                    },
                    StringSorter {
                        roleName: "preferredDisplayName"
                        caseSensitivity: Qt.CaseInsensitive
                    }
                ]
            }
            section.property: "onlineStatus"
            section.delegate: (root.width > 58) ? sectionDelegateComponent : null
            delegate: StatusMemberListItem {
                width: ListView.view.width
                nickName: model.localNickname
                userName: ProfileUtils.displayName("", model.ensName, model.displayName, model.alias)
                pubKey: model.isEnsVerified ? "" : Utils.getCompressedPk(model.pubKey)
                isContact: model.isContact
                isVerified: model.isVerified
                isUntrustworthy: model.isUntrustworthy
                isAdmin: model.isAdmin
                asset.name: model.icon
                asset.isImage: (asset.name !== "")
                asset.isLetterIdenticon: (asset.name === "")
                asset.color: Utils.colorForColorId(model.colorId)
                status: model.onlineStatus
                ringSettings.ringSpecModel: model.colorHash
                onClicked: {
                    if (mouse.button === Qt.RightButton) {
                        // Set parent, X & Y positions for the messageContextMenu
                        messageContextMenu.parent = this
                        messageContextMenu.isProfile = true
                        messageContextMenu.myPublicKey = userProfile.pubKey
                        messageContextMenu.selectedUserPublicKey = model.pubKey
                        messageContextMenu.selectedUserDisplayName = title
                        messageContextMenu.selectedUserIcon = model.icon
                        messageContextMenu.popup(4, 4)
                    } else if (mouse.button === Qt.LeftButton && !!messageContextMenu) {
                        Global.openProfilePopup(model.pubKey);
                    }
                }
            }
        }
    }

    Component {
        id: sectionDelegateComponent
        Item {
            width: ListView.view.width
            height: 24
            StatusBaseText {
                anchors.fill: parent
                anchors.leftMargin: Style.current.padding
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: Style.current.additionalTextSize
                color: Theme.palette.baseColor1
                text: {
                    switch(parseInt(section)) {
                        case Constants.onlineStatus.online:
                            return qsTr("Online")
                        default:
                            return qsTr("Inactive")
                    }
                }
            }
        }
    }
}
