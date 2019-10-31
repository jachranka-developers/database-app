import QtQuick 2.0
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3

import qmldispatcher 1.0

Item {
    id: element

    width: 600
    height: 600


    Rectangle {
        id: rectangle
        width: parent.width
        height: parent.height



        border.color: "#000000"
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#6978c0"
            }

            GradientStop {
                position: 0.363
                color: "#6978c0"
            }

            GradientStop {
                position: 0.978
                color: "#a68f6a"
            }



        }

        GridLayout {
            id: gridLayout
            x: 15
            y: 0
            flow: GridLayout.LeftToRight
            layoutDirection: Qt.LeftToRight
            anchors.rightMargin: 15
            anchors.leftMargin: 15
            rows: 10
            columns: 2
            anchors.fill: parent

            Text {
                id: title
                text: qsTr("Dodaj nowe połączenie")
                horizontalAlignment: Text.AlignHCenter
                Layout.columnSpan: 2
                Layout.rowSpan: 1
                Layout.fillWidth: true
                Layout.bottomMargin: 30
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 24
            }

            Text {
                id: driver_txt
                width: 150
                text: qsTr("Sterowniki")
                Layout.fillHeight: false
                fontSizeMode: Text.FixedSize
                Layout.fillWidth: true
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 18
            }

            ComboBox {
                id: comboBox
                Layout.fillWidth: true


                model: ListModel
                {
                id: cbItems
                ListElement { text: "QPSQL";}
                ListElement { text: "QMYSQL"; }
                ListElement { text: "QSQLITE"; }
                ListElement { text: "QOCI"; }
                }
            }

            Text {
                id: connection_name_txt
                width: 150
                text: qsTr("Nazwa połączenia")
                Layout.fillHeight: false
                fontSizeMode: Text.FixedSize
                Layout.fillWidth: true
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 18
            }

            TextField {
                id: connection_name
                Layout.fillWidth: true
            }

            Text {
                id: host_txt
                width: 150
                text: qsTr("Host")
                horizontalAlignment: Text.AlignRight
                Layout.fillWidth: true
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 18
            }

            TextField {
                id: host
                Layout.fillWidth: true
            }

            Text {
                id: user_name_txt
                text: qsTr("Nazwa użytkownika")
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
                Layout.fillWidth: true
                font.pixelSize: 18
            }

            TextField {
                id: user_name
                Layout.fillWidth: true
            }

            Text {
                id: password_txt
                text: qsTr("Hasło")
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
                Layout.fillWidth: true
                font.pixelSize: 18
            }

            TextField {
                id: password
                Layout.fillWidth: true
            }

            Text {
                id: database_name_txt
                text: qsTr("Nazwa bazy danych")
                horizontalAlignment: Text.AlignRight
                Layout.fillWidth: true
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 18
            }

            TextField {
                id: database_name
                Layout.fillWidth: true
            }

            Text {
                id: port_txt
                text: qsTr("Port")
                horizontalAlignment: Text.AlignRight
                Layout.fillWidth: true
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 18
            }

            TextField {
                id: port
                Layout.fillWidth: true
            }

            RowLayout {
                id: rowLayout
                width: 100
                height: 100
                Layout.topMargin: 20
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Layout.rowSpan: 1
                Layout.columnSpan: 2
                Layout.fillWidth: true

                Button {
                    id: button_test_connection
                    width: 95
                    text: qsTr("Test połączenia")
                    onClicked: {
                        contextAPI.testConnection(connection_name.text,host.text,port.text,database_name.text,user_name.text,password.text,comboBox.currentText,"SCHEMA")
                    }

                    background: Rectangle{
                        width: parent.width
                        height: parent.height
                    }
                }

                Button {
                    id: save
                    text: qsTr("Zapisz")

                    background: Rectangle{
                        width: parent.width
                        height: parent.height
                    }
                }

                Button {
                    id: canel
                    text: qsTr("Anuluj")

                    background: Rectangle{
                        width: parent.width
                        height: parent.height
                    }

                }
            }
        }
    }

    Connections{
        target: contextAPI
        onResultStatusChanged:{
            if(contextAPI.resultStatus)
            {
                button_test_connection.background.color = "green"
            }
            else
            {
                button_test_connection.color = "red"
            }
        }
    }

}

/*##^##
Designer {
    D{i:6;anchors_height:100;anchors_width:100}D{i:1;anchors_height:200;anchors_width:200}
}
##^##*/
