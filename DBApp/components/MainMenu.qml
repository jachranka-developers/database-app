import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Extras 1.4
import QtQuick.Dialogs.qml 1.0
import QtQuick.Controls 2.3


Item {

    function newItem() {

        var newContent = Qt.createComponent("Button.qml")
        if(newContent.status === Component.Ready)
            newContent.createObject(stackLayout, {x:100, y:100});

        stackLayout.currentIndex =  stackLayout.count

        console.log(stackLayout.count+" "+stackLayout.currentIndex)
    }

    Rectangle {
        id: rectangle
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#ffffff"
            }

            GradientStop {
                position: 1
                color: "#000000"
            }
        }
        anchors.fill: parent

        Column {
            id: column
            anchors.fill: parent
            spacing: 20

            RowLayout {
                id: rowLayout
                anchors.fill: parent

                ListView {
                    id: listView
                    width: 110
                    height: 160
                    model: ListModel {
                        ListElement {
                            name: "Grey"
                            colorCode: "grey"
                        }

                        ListElement {
                            name: "Red"
                            colorCode: "red"
                        }

                        ListElement {
                            name: "Blue"
                            colorCode: "blue"
                        }

                        ListElement {
                            name: "Green"
                            colorCode: "green"
                        }
                    }

                    delegate: Item {
                        x: 5
                        width: 80
                        height: 40
                        Row {
                            id: row1
                            Rectangle {
                                width: 40
                                height: 40
                                color: colorCode
                            }

                            Text {
                                text: name
                                font.bold: true
                                anchors.verticalCenter: parent.verticalCenter
                            }
                            spacing: 10
                        }
                    }
                }

                TabWidget {
                    id: tabWidget
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    current: 1


                    Rectangle {
                        property string title: "Red"
                        anchors.fill: parent
                        color: "#e3e3e3"

                        Rectangle {
                            anchors.fill: parent; anchors.margins: 20
                            color: "#ff7f7f"
                            Text {
                                width: parent.width - 20
                                anchors.centerIn: parent; horizontalAlignment: Qt.AlignHCenter
                                text: "Roses are red"
                                font.pixelSize: 20
                                wrapMode: Text.WordWrap
                            }
                        }
                    }

                    Rectangle {
                        property string title: "Green"
                        anchors.fill: parent
                        color: "#e3e3e3"

                        Rectangle {
                            anchors.fill: parent; anchors.margins: 20
                            color: "#7fff7f"
                            Text {
                                width: parent.width - 20
                                anchors.centerIn: parent; horizontalAlignment: Qt.AlignHCenter
                                text: "Flower stems are green"
                                font.pixelSize: 20
                                wrapMode: Text.WordWrap
                            }
                        }
                    }

                    Rectangle {
                        property string title: "Blue"
                        anchors.fill: parent; color: "#e3e3e3"

                        Rectangle {
                            anchors.fill: parent; anchors.margins: 20
                            color: "#7f7fff"
                            Text {
                                width: parent.width - 20
                                anchors.centerIn: parent; horizontalAlignment: Qt.AlignHCenter
                                text: "Violets are blue"
                                font.pixelSize: 20
                                wrapMode: Text.WordWrap
                            }
                        }
                    }
                }
            }

        }
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
