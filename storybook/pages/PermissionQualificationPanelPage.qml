import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.14

import Storybook 1.0

import AppLayouts.Chat.panels.communities 1.0

SplitView {
    orientation: Qt.Vertical

    Item {
        SplitView.fillWidth: true
        SplitView.fillHeight: true

        Item {
            id: container

            width: widthSlider.value
            height: qualificationPanel.implicitHeight

            anchors.centerIn: parent

            PermissionQualificationPanel {
                id: qualificationPanel

                anchors.left: parent.left
                anchors.right: parent.right

                qualifyingAddresses: qualifyingAddressesSlider.value
                knownAddresses: knownAddressesSlider.value
                unknownAddresses: unknownAddressesSlider.value
            }
        }
    }

    LogsAndControlsPanel {
        SplitView.minimumHeight: 100
        SplitView.preferredHeight: 250

        ColumnLayout {
            Row {
                Label {
                    anchors.verticalCenter: parent.verticalCenter
                    text: "width:"
                }

                Slider {
                    id: widthSlider
                    value: 400
                    from: 200
                    to: 600
                }
            }

            Row {
                Label {
                    anchors.verticalCenter: parent.verticalCenter
                    text: "number of qualifying addresses:"
                }

                Slider {
                    id: qualifyingAddressesSlider
                    value: 200234
                    from: 0
                    to: 500000
                }
            }

            Row {
                Label {
                    anchors.verticalCenter: parent.verticalCenter
                    text: "number of known addresses:"
                }

                Slider {
                    id: knownAddressesSlider
                    value: 663026
                    from: 1
                    to: 1000000
                }
            }

            Row {
                Label {
                    anchors.verticalCenter: parent.verticalCenter
                    text: "number of unknown addresses:"
                }

                Slider {
                    id: unknownAddressesSlider
                    value: 396720
                    from: 1
                    to: 1000000
                }
            }
        }
    }
}
