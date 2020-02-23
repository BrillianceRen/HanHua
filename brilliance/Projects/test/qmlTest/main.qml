import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.VirtualKeyboard 2.4
import QtQuick.Controls 2.12
import QtQuick.Dialogs 1.2
import renyl.ExchangeHelper 1.0
Window {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
    InputPanel {
        id: inputPanel
        z: 99
        x: 0
        y: window.height
        width: window.width

        states: State {
            name: "visible"
            when: inputPanel.active
            PropertyChanges {
                target: inputPanel
                y: window.height - inputPanel.height
            }
        }
        transitions: Transition {
            from: ""
            to: "visible"
            reversible: true
            ParallelAnimation {
                NumberAnimation {
                    properties: "y"
                    duration: 250
                    easing.type: Easing.InOutQuad
                }
            }
        }
    }
    ExchangeHelper {
        id: exchangeHelper;
        onFUrlChanged: {
            msgDlg.text = exchangeHelper.fUrl;
            msgDlg.open();
        }
    }
    Button {
        id: button
        x: 50
        y: 33
        width: 147
        height: 46
        text: qsTr("Open FileDialog")
        onClicked: {
            fileDlg.open();
        }
    }
    FileDialog {
        id: fileDlg;
        selectFolder: true;
        onAccepted: {
            exchangeHelper.fUrl = fileDlg.folder;
        }
    }
    MessageDialog {
        id: msgDlg;
    }
}
