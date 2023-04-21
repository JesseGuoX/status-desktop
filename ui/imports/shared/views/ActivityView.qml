import QtQuick 2.15
import QtQml 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

import StatusQ.Core 0.1
import StatusQ.Components 0.1
import StatusQ.Controls 0.1
import StatusQ.Core.Theme 0.1

import SortFilterProxyModel 0.2

import utils 1.0

import "../panels"
import "../popups"
import "../stores"
import "../controls"

Item {
    id: root

    property var controller

    // TODO: DEMO filter
    // const start = Math.floor((new Date() - startDaysAgo).getTime() / 1000);

    Component.onCompleted: {
        console.debug(`@dd CALL controller.updateFilter`)
        controller.updateFilter(0, 0);
        console.debug(`@dd END CALL controller.updateFilter; count ${listView.count}`)
    }

    ListView {
        id: listView
        anchors.fill: parent
        model: controller.model
        delegate: Item {
            width: parent.width
            height: itemLayout.implicitHeight

            readonly property var entry: model.activityEntry

            RowLayout{
                id: itemLayout
                anchors.fill: parent

                Label { text: entry.fromAmount }
                Label {
                    text: "from"

                    Layout.leftMargin: 5
                    Layout.rightMargin: 5
                }
                Label { text: entry.sender }
                Label {
                    text: "to"

                    Layout.leftMargin: 5
                    Layout.rightMargin: 5
                }
                Label { text: entry.recipient }
                Label {
                    text: "got"

                    Layout.leftMargin: 5
                    Layout.rightMargin: 5
                }
                Label {
                    text: entry.toAmount

                    Layout.leftMargin: 5
                    Layout.rightMargin: 5
                }
                Label {
                    text: "when"

                    Layout.leftMargin: 5
                    Layout.rightMargin: 5
                }
                Label { text: (new Date(entry.timestamp * 1000)).toLocaleDateString() }
                RowLayout {}    // Spacer
            }
        }
    }
}
