import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io

PanelWindow {
  id: panel
  readonly property color bg: '#23272e'
  readonly property color fg: '#abb2bf'
  readonly property int borderWidth: 1
  readonly property color borderColor: '#2c313c'
  readonly property int gap: 8
  readonly property string fontFamily: 'BlexMono Nerd Font Medium'
  readonly property int fontSize: 14

  anchors {
    top: true
    left: true
    right: true
  }

  implicitHeight: 32
  color: panel.bg

  RowLayout {
    anchors.fill: parent
    spacing: 0
    anchors.leftMargin: panel.gap
    anchors.rightMargin: panel.gap

    // Esquerda
    RowLayout {
      Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
      Text { text: '󰣇'; color: panel.fg }
      Text {
        text: 'Workspaces'
        font.family: panel.fontFamily
        font.pixelSize: panel.fontSize
        color: panel.fg
      }
    }

    // Espaçador
    Item { Layout.fillWidth: true }

    // Centro
    RowLayout {
      Layout.alignment: Qt.AlignCenter
      TextCustom { // Exemplo de texto customizado
        text: 'Centro'
        color: panel.fg
      }
    }

    // Espaçador
    Item { Layout.fillWidth: true }

    // Direita
    RowLayout {
      Layout.alignment: Qt.AlignRight | Qt.AlignVCenter

      Text {
        id: clock
        color: panel.fg
      }

      Process {
        id: date
        command: ['date', '+%H:%M']
        running: true
        stdout: StdioCollector {
          onStreamFinished: clock.text = this.text.trim()
        }
      }

      Timer {
        interval: 60 * 1000
        running: true
        repeat: true
        onTriggered: date.running = true
      }
    } // RowLayout Direita
  } // RowLayout

  // Border
  Rectangle {
    anchors.bottom: parent.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    height: panel.borderWidth
    color: panel.borderColor
    z: 1 // Garante que a borda fique acima do fundo
  }
}
