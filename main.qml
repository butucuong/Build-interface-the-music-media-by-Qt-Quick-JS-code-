import QtQuick 2.6
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.3
import QtQuick.Window 2.2
ApplicationWindow {
    id: backgroundId
    visible: true
    width: 1920
    height: 1080
    visibility: "FullScreen"
    title: qsTr("Media Player")
    //Backgroud of Application
    Image {


        anchors.fill:parent
        source: "qrc:/Image/background.png"
    }
    //Header
    Rectangle
    {
        id: headerId
        width: backgroundId.width
        height: 75
        Image {
            id: headImageId
            anchors.fill:parent
            source: "qrc:/Image/title.png"
        }
        border.color: "black"
        Text {
            anchors.centerIn: parent
            text: "Media Player"
            font.pixelSize: 30
            color: "white"
        }
    }

    //Playlist
    Rectangle{
        id: playListId

        anchors.top: headerId.bottom
        width: backgroundId.width/4
        height: backgroundId.height/9
        Image {
            id: playListImageId
            anchors.fill:parent
            source: "qrc:/Image/playlist_item.png"
        }
        Text{
            x:10

            anchors.verticalCenter: parent.verticalCenter


            text: "Playlist Item"
            font.pixelSize: 22

        }
    }

    //Media Info
    Rectangle{
        id: mediaInfoId

        width: backgroundId.width-playListId.width
        height: backgroundId.height-playListId.height
        anchors.top: headerId.bottom
        anchors.left: playListId.right

        Image{
            //id: backGroundImage1Id
            anchors.fill: parent
            source: "qrc:/Image/background.png"
        }

        Text{
            id:titleID
            color:"white"
            x:10
            y:10
            font.pixelSize: 22
            text: "Music title"


        }
        Text{
            id:singerId
            color:"white"
            font.pixelSize: 20
            x:10
            y:35
            text:"Singer"
        }
        Image {
            id: musicSymbolId
            y:  10
            x: parent.width-width-40
            width: 20
            height: 20

            source: "qrc:/Image/music.png"
        }
        Text {
            id: quantityId
            anchors.left: musicSymbolId.right

            y:5
            text: " 3"
            font.pixelSize: 20
            color: "white"


        }
        //AlbumArt



        RowLayout{
            id:albumArtId

            spacing: 15
            y: playListId.height
            x: 30



            Image {
                id: image1Id
                source: "qrc:/Image/Bui-Anh-Tuan.png"
            }
            Image{
                id:image2Id
                source:"qrc:/Image/Hongkong1.png"
            }
            Image{
                id: image3Id
                source: "qrc:/Image/Ha-Anh-Tuan.png"
            }
        }


        //ProgressBar
        Image {
            id: progressBarBGId
            anchors.horizontalCenter: parent.horizontalCenter
            y:albumArtId.height + playListId.height+50
            source: "qrc:/Image/progress_bar_bg.png"

        }
        Image {
            id: pointId
            anchors.centerIn: centerPointId
            source: "qrc:/Image/point.png"
        }
        Image {
            id: centerPointId
            x:progressBarBGId.x
            y:albumArtId.height + playListId.height+45
            source: "qrc:/Image/center_point.png"

            MouseArea{
                anchors.fill:parent
                drag.target: centerPointId
                drag.axis: Drag.XAxis
                drag.minimumX: progressBarBGId.x
                drag.maximumX: progressBarBGId.width + progressBarBGId.x

            }
        }
        Image {
            id: progressBarId

            x: progressBarBGId.x
            width: centerPointId.x - progressBarBGId.x
            y:albumArtId.height + playListId.height+50
            source: "qrc:/Image/progress_bar.png"


        }

        //Media control
        ButtonControl{
            id: playButtonId
            y:progressBarBGId.y+30
            anchors.horizontalCenter: progressBarBGId.horizontalCenter
            icon_default: "qrc:/Image/play.png"
            icon_pressed: "qrc:/Image/hold-pause.png"
            icon_released: "qrc:/Image/play.png"
        }
        ButtonControl{
            id:previousButtonId
            x:playButtonId.x-width
            anchors.verticalCenter: playButtonId.verticalCenter
            icon_default: "qrc:/Image/prev.png"
            icon_pressed: "qrc:/Image/hold-prev.png"
            icon_released: "qrc:/Image/prev.png"
        }
        ButtonControl{
            id:nextButtonId
            x:playButtonId.x+playButtonId.width
            anchors.verticalCenter: playButtonId.verticalCenter
            icon_default: "qrc:/Image/next.png"
            icon_pressed: "qrc:/Image/hold-next.png"
            icon_released: "qrc:/Image/next.png"
        }
        Text {
            id: beginId
            x:progressBarBGId.x-beginId.width-10
            anchors.verticalCenter: progressBarBGId.verticalCenter
            text: qsTr("00:00")
            color:"white"
            font.pixelSize: 15
        }
        Text{
            id:endId
            x:progressBarBGId.x+progressBarBGId.width +10
            anchors.verticalCenter: progressBarBGId.verticalCenter
            text:"00:00"
            color: "white"
            font.pixelSize:15
        }
        SwitchButton{
            id:shuffleButtonId
            x:beginId.x
            anchors.verticalCenter: playButtonId.verticalCenter
            icon_off: "qrc:/Image/shuffle.png"
            icon_on:  "qrc:/Image/shuffle-1.png"
        }
        SwitchButton{
            id:repeatButtonId
            x:endId.x-repeatButtonId.width+endId.width
            anchors.verticalCenter: playButtonId.verticalCenter
            icon_off: "qrc:/Image/repeat.png"
            icon_on:  "qrc:/Image/repeat1_hold.png"
        }
    }






}
