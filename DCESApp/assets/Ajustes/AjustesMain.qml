import bb.cascades 1.0
import bb.system 1.0

Page {
    
    property variant hashkey
    
    Container {
        
        //Todo: fill me with QML
        id: containerBg
        layout: DockLayout {
        
        }
        background: Color.White
        
        Container {
            layout: StackLayout {

            }
            id: containerScroll
            horizontalAlignment: HorizontalAlignment.Fill
            verticalAlignment: VerticalAlignment.Fill
            //bottomPadding: 47
            
            Container {
                layout: StackLayout {
                
                }
                bottomPadding: 40
                horizontalAlignment: HorizontalAlignment.Fill
                
                background: Color.create("#ea7529")
                Container {
                    topPadding: 30
                    horizontalAlignment: HorizontalAlignment.Center
                    verticalAlignment: VerticalAlignment.Center
                    Label {
                        // Localized text with the dynamic translation and locale updates support
                        text: qsTr("Ajustes") + Retranslate.onLocaleOrLanguageChanged
                        textStyle.base: SystemDefaults.TextStyles.BigText
                        horizontalAlignment: HorizontalAlignment.Center
                        textStyle.color: Color.create("#ffffff")
                    }
                }
            }
            Container {
                layout: StackLayout {
                
                }
                bottomPadding: 20
                horizontalAlignment: HorizontalAlignment.Fill
                
                background: banda.imagePaint
                attachedObjects: [
                    ImagePaintDefinition {
                        id: banda
                        imageSource: "asset:///images/banda_header.png"
                        repeatPattern: RepeatPattern.X
                    }
                ]
                Container {
                    horizontalAlignment: HorizontalAlignment.Right
                    verticalAlignment: VerticalAlignment.Center
                    topPadding: 5
                    bottomPadding: -15
                    leftPadding: 20
                    rightPadding: 20
                    ImageButton {
                        defaultImageSource: "asset:///images/btnLogout.png"
                        pressedImageSource: "asset:///images/btnLogout1.png"
                        
                        onClicked: {
                            logout.show();
                        }
                    }
                
                }
            }
            Container {
                layout: StackLayout {

                }

                horizontalAlignment: HorizontalAlignment.Center
                topMargin: 50.0
                ImageButton {
                    defaultImageSource: "asset:///images/btnChangePoints.png"
                    pressedImageSource: "asset:///images/btnChangePoints1.png"
                    
                    onClicked: {
                        //var MenuPrincipalOut = menuPrincipalOut_page.createObject();
                        //nPMenuDC.push(MenuPrincipalOut);
                    }
                }
                
                ImageButton {
                    defaultImageSource: "asset:///images/btnChangePw.png"
                    pressedImageSource: "asset:///images/btnChangePw1.png"
                    
                    onClicked: {
                        var changePw = changePw_page.createObject();
                        changePw.hashkeyN = hashkey;
                        nPMenuDC.push(changePw);
                    }
                    topMargin: 50.0
                }
                
            }
            
        }
        
    }
    
    attachedObjects: [
        // Create the ComponentDefinition that represents the custom
        // component my pages *.qml
        ComponentDefinition {
            id: changePw_page
            source: "ChangePw.qml"
        },
        SystemDialog {
            id: logout
            title: "Cerrar Sesión"
            body: "¿Realmente quieres cerrar sesión?"
            onFinished: {
                if (logout.confirmButton) {
                    nPMenuDC.navigateTo(rootPage);
                }
            }
        }
    ]    
    
}
