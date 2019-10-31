import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.3

import "components"
import QtQuick.Layouts 1.3


Window {
    visible: true
    id: root
    width: 640
    height: 680
    //visibility: "FullScreen"
    title: qsTr("Hello World")

    ColumnLayout {
        id: columnLayout
        anchors.fill: parent

        Row {
            id: row
            width: 200
            height: 400

            Button {
                id: button
                text: qsTr("Button")
            }

            Button {
                id: button1
                text: qsTr("Button")
            }

            Button {
                id: button2
                text: qsTr("Button")
            }
        }

        SwipeView {
            id: swipeView
            width: 600
            height: 600
            currentIndex: 1
            Layout.fillWidth: true

            Item {
                NewConnectionForm{
                    id: ncf
                    height: swipeView.height
                    width: swipeView.width
                }
            }

            Item {
                MainMenu {
                    id: mainMenu
                    anchors.fill: parent
                }

            }

            Item {
                TabWidget {
                    id: tabWidget
                }
            }
        }


    }

    Connections {
        target: button
        onClicked:
        {
            console.log(swipeView.currentIndex)
            if(swipeView.currentIndex == 1)
            {
                swipeView.setCurrentIndex(0);
            }
            else
            {
                swipeView.setCurrentIndex(1);
            }
        }
    }

    Connections {
        target: button1
        onClicked:
        {
            mainMenu.newItem()
        }
    }


}

/*##^##
Designer {
    D{i:5;anchors_height:200;anchors_width:200}D{i:2;anchors_height:400;anchors_width:200}
D{i:7;anchors_height:200;anchors_width:200}D{i:9;anchors_height:100;anchors_width:100}
D{i:6;anchors_height:160;anchors_width:110;anchors_x:0;anchors_y:275}D{i:1;anchors_height:400;anchors_width:200}
}
##^##*/
