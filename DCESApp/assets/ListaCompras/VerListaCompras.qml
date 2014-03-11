import bb.cascades 1.0
import bb.system 1.0

import "../data.js" as Data

Page {
    property variant vuserN
    property variant hashkeyN
    property variant idLista
    property variant nombreLista
    
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
                        text: qsTr("Lista de compras") + Retranslate.onLocaleOrLanguageChanged
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
                
            }
            
            ScrollView {
                verticalAlignment: VerticalAlignment.Fill
                horizontalAlignment: HorizontalAlignment.Fill
                scrollViewProperties.initialScalingMethod:ScalingMethod.Fill
                scrollViewProperties.scrollMode: ScrollMode.Vertical
                
                
                Container {
                    horizontalAlignment: HorizontalAlignment.Center
                    
                    
                    Container {
                        topPadding: 30
                        leftPadding: 70
                        rightPadding: leftPadding
                        horizontalAlignment: HorizontalAlignment.Center
                                                
                        Label {
                            // Localized text with the dynamic translation and locale updates support
                            text: qsTr("Lista seleccionada:") + Retranslate.onLocaleOrLanguageChanged
                            textStyle.base: SystemDefaults.TextStyles.BigText
                            horizontalAlignment: HorizontalAlignment.Center
                            textStyle.color: Color.create("#ea7529")
                        }
                        Label {
                            // Localized text with the dynamic translation and locale updates support
                            text: qsTr(""+nombreLista) + Retranslate.onLocaleOrLanguageChanged
                            textStyle.base: SystemDefaults.TextStyles.TitleText
                            horizontalAlignment: HorizontalAlignment.Center
                            textStyle.color: Color.create("#ea7529")
                        }
                        
                    
                    }
                    
                    Container {
                        topPadding: 50
                        bottomPadding: 20
                        leftPadding: 70
                        rightPadding: leftPadding
                        horizontalAlignment: HorizontalAlignment.Center
                        
                        layout: StackLayout {
                            orientation: LayoutOrientation.LeftToRight
                        
                        }
                        ImageButton {
                            defaultImageSource: "asset:///images/btnConsultaListaCompras.png"
                            pressedImageSource: "asset:///images/btnConsultaListaCompras1.png"
                            
                            onClicked: {
                                var cotizarlista  = cotizarlista_page.createObject();
                                cotizarlista.hashkey = hashkeyN;
                                cotizarlista.idlista = idLista;
                                cotizarlista.nextParameter();
                                nPMenuDC.push(cotizarlista);
                            }
                        }
                    
                    }
                    Container {
                        topPadding: 50
                        bottomPadding: 20
                        leftPadding: 70
                        rightPadding: leftPadding
                        horizontalAlignment: HorizontalAlignment.Center
                        
                        layout: StackLayout {
                            orientation: LayoutOrientation.LeftToRight
                        
                        }
                        ImageButton {
                            id: btnAjustes
                            defaultImageSource: "asset:///images/btnAjustes.png"
                            pressedImageSource: "asset:///images/btnAjustes1.png"
                            
                            onClicked: {
                                var configurarlista  = configurarlista_page.createObject();
                                configurarlista.hashkey = hashkeyN;
                                configurarlista.vuser 	= vuserN;
                                configurarlista.idlista = idLista;
                                configurarlista.nextLoadValidator(hashkeyN, idLista);
                                console.log("PASANDO ID PARA AJUSTES BOTON "+hashkeyN+vuserN+idLista)
                                nPMenuDC.push(configurarlista);
                                
                            }
                        }
                    
                    }
                
                }
            
            
            
            }
            
        }
        
    }
    
    attachedObjects: [
        ComponentDefinition {
            id: configurarlista_page
            source: "ConfigurarListaCompras.qml"
        
        },
        ComponentDefinition {
            id: cotizarlista_page
            source: "Cotizar/CotizarLista.qml"
        
        },
        SystemToast {
            id: waitListaCrear
            body: "Creando..."
            
        },
        SystemToast {
            id: mListaCrear
            body: "Tu lista de compras se ha creado satisfactoriamente."
            
        },
        SystemToast {
            id: errorListaCrear
            body: "Hubo un error al crear la lista de compras."
            
        },
        SystemToast {
            id: clave
            body: "Ha ocurrido algo inesperado revisa tu conexión a internet e intenta de nuevo."
        
        }
    ]
    
}
