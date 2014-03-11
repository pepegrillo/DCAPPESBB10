import bb.cascades 1.0
import bb.system 1.0
import "../data.js" as Data

Page {
    id: configuracionLista
    property variant hashkey
    property variant vuser
    property variant idlista
    
    Container {
        //Todo: fill me with QML
        id: containerBg
        layout: DockLayout {
        
        }
        // The background image
        ImageView {
            id: bgNoData
            horizontalAlignment: HorizontalAlignment.Fill
            verticalAlignment: VerticalAlignment.Fill
            imageSource: "asset:///images/siData.png"
        }
        Container {
            id: containerScroll
            horizontalAlignment: HorizontalAlignment.Fill
            verticalAlignment: VerticalAlignment.Fill
            //bottomPadding: 47
            
            Container {
                bottomPadding: 40
                horizontalAlignment: HorizontalAlignment.Fill
                
                background: Color.create("#ea7529")
                Container {
                    topPadding: 30
                    horizontalAlignment: HorizontalAlignment.Center
                    verticalAlignment: VerticalAlignment.Center
                    Label {
                        // Localized text with the dynamic translation and locale updates support
                        text: qsTr("Configuración de lista") + Retranslate.onLocaleOrLanguageChanged
                        textStyle.base: SystemDefaults.TextStyles.BigText
                        horizontalAlignment: HorizontalAlignment.Center
                        textStyle.color: Color.create("#ffffff")
                    }
                }
            }
            Container {
                bottomPadding: 30
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
                        topPadding: 25
                        leftPadding: 70
                        rightPadding: leftPadding
                        horizontalAlignment: HorizontalAlignment.Center

                        Label {
                        	id: txtRuta
                        	text: ""
                            visible: false
                        }
                        ImageButton {
                            defaultImageSource: "asset:///images/btnRutaCompras.png"
                            pressedImageSource: "asset:///images/btnRutaCompras1.png"
                            
                            onClicked: {
                                var rutacompras  = rutacompras_page.createObject();
                                rutacompras.idLista = idlista;
                                rutacompras.hashkey = hashkey;
                                rutacompras.nextParameter();
                                nPMenuDC.push(rutacompras);
                            }
                        }
                	}
                    Container {
                        topPadding: 25
                        leftPadding: 70
                        rightPadding: leftPadding
                        horizontalAlignment: HorizontalAlignment.Center
                        Label {
                            id: txtProductos
                            text: ""
                            visible: false
                        }
                        ImageButton {
                            defaultImageSource: "asset:///images/btnProductos.png"
                            pressedImageSource: "asset:///images/btnProductos1.png"
                            
                            onClicked: {
                                if (txtRuta.text == "1") {
                                    var productocompras  = productocompras_page.createObject();
                                    productocompras.idLista = idlista;
                                    productocompras.hashkey = hashkey;
                                    productocompras.nextParameter();
                                    nPMenuDC.push(productocompras);
                                } else {
                                    sdProductos.show();
                                }
                                
                            }
                        }
                    }
                    Container {
                        topPadding: 25
                        leftPadding: 70
                        rightPadding: leftPadding
                        horizontalAlignment: HorizontalAlignment.Center
                        Label {
                            id: txtAlertas
                            text: ""
                            visible: false
                        }
                        ImageButton {
                            defaultImageSource: "asset:///images/btnAlertas.png"
                            pressedImageSource: "asset:///images/btnAlertas1.png"
                            
                            onClicked: {
                                if (txtProductos.text == "1") {
                                    var alertacompras  = alertacompras_page.createObject();
                                    alertacompras.idlistaN = idlista;
                                    alertacompras.hashkeyN = hashkey;
                                    alertacompras.nextParameter(hashkey,idlista);
                                    nPMenuDC.push(alertacompras);
                                } else {
                                    sdAlertas.show();
                                }
                                
                            }
                        }
                    }
            
            	}
        
        	}
    
    	}
    }
    
    paneProperties: NavigationPaneProperties {
        backButton: ActionItem {
            title: "Atrás"
            //imageSource: "asset:///images/customBackButtonImage.png"
            
            onTriggered: {
                nextParameter();
                
                nPMenuDC.navigateTo(pageListaCompras);                
            }
        }
    }
    
	attachedObjects: [
	    // Create the ComponentDefinition that represents the custom
	    // component my pages *.qml
	    
	    // System dialog displayed when the feed can not be shown.
	    ComponentDefinition {
            id: rutacompras_page
	        source: "RutaCompras.qml"
	    },
        ComponentDefinition {
            id: productocompras_page
            source: "ProductoCompras.qml"
        },
        ComponentDefinition {
            id: alertacompras_page
            source: "Alertas/AlertasCompras.qml"
        },
        SystemDialog {
            id: sdProductos
            title: "Ajustes de Lista de Compras"
            body: "Antes de agregar productos a la lista debes agregar un establecimiento en Ruta de Compra."
            
        },
        SystemDialog {
            id: sdAlertas
            title: "Ajustes de Lista de Compras"
            body: "Antes de configurar una alerta a la lista debes agregar productos."
        
        }
	
	]
	
    function nextLoadValidator(hashkey, idlista){
        onCreationCompleted: {
            Data.validarAjustesLista(hashkey, idlista);
        
        }
    }
	
}

