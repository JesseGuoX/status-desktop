import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQml.Models 2.15

import utils 1.0

import StatusQ.Core 0.1
import StatusQ.Core.Theme 0.1
import StatusQ.Controls 0.1
import StatusQ.Components 0.1
import StatusQ.Popups.Dialog 0.1

import AppLayouts.Profile.controls 1.0

StatusDialog {
    id: root

    property int linkType: -1
    property string icon

    property string uuid
    property string linkText
    property string linkUrl

    signal updateLinkRequested(string uuid, string linkText, string linkUrl)
    signal removeLinkRequested(string uuid)

    implicitWidth: 480 // design

    title: ProfileUtils.linkTypeToText(linkType) || qsTr("Modify Custom Link")

    footer: StatusDialogFooter {
        leftButtons: ObjectModel {
            StatusButton {
                type: StatusButton.Danger
                text: qsTr("Delete")
                onClicked: {
                    root.removeLinkRequested(root.uuid)
                    root.close()
                }
            }
        }
        rightButtons: ObjectModel {
            StatusButton {
                text: qsTr("Update")
                enabled: {
                    if (!customTitle.visible)
                        return linkTarget.text && linkTarget.text !== linkUrl
                    return linkTarget.text && (linkTarget.text !== linkUrl || (customTitle.text && customTitle.text !== root.linkText))
                }

                onClicked: {
                    root.updateLinkRequested(root.uuid, customTitle.text, ProfileUtils.addSocialLinkPrefix(linkTarget.text, root.linkType))
                    root.close()
                }
            }
        }
    }

    onAboutToShow: {
        if (linkType === Constants.socialLinkType.custom)
            customTitle.input.edit.forceActiveFocus()
        else
            linkTarget.input.edit.forceActiveFocus()
    }

    onClosed: destroy()

    contentItem: ColumnLayout {
        width: root.availableWidth
        spacing: Style.current.halfPadding

        StaticSocialLinkInput {
            id: customTitle
            Layout.fillWidth: true
            visible: root.linkType === Constants.socialLinkType.custom
            placeholderText: ""
            label: qsTr("Change title")
            linkType: Constants.socialLinkType.custom
            icon: "language"
            text: root.linkText
            charLimit: Constants.maxSocialLinkTextLength
            input.tabNavItem: linkTarget.input.edit
        }

        StaticSocialLinkInput {
            id: linkTarget
            Layout.fillWidth: true
            Layout.topMargin: customTitle.visible ? Style.current.padding : 0
            placeholderText: ""
            label: ProfileUtils.linkTypeToDescription(linkType) || qsTr("Modify your link")
            linkType: root.linkType
            icon: root.icon
            text: root.linkUrl
            input.tabNavItem: customTitle.input.edit
        }
    }
}
