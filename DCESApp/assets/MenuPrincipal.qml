import bb.cascades 1.0
import bb.system 1.0

Page {
    id: menuprincipal
    //objectName: menuprincipal
    
    
    property variant idmiembroN
    property variant nombreN
    property variant apellidoN
    property variant sexoN
    property variant correoN
    property variant hashkeyN
    property variant validaruser
    
    Container {
        //Todo: fill me with QML
        id: containerBg
        layout: DockLayout {
        
        }
        background: back.imagePaint
        attachedObjects: [
            ImagePaintDefinition {
                id: back
                imageSource: "asset:///images/bgDCMenu.png"
                repeatPattern: RepeatPattern.Fill
            }
        ]
        ImageView {
            imageSource: "asset:///images/bgBarra.png"
            horizontalAlignment: HorizontalAlignment.Fill
            verticalAlignment: VerticalAlignment.Top
        }
        ImageView {
            imageSource: "asset:///images/bgBarra.png"
            horizontalAlignment: HorizontalAlignment.Fill
            verticalAlignment: VerticalAlignment.Bottom
        }
        
        Container {
	        id: containerScroll
	        horizontalAlignment: HorizontalAlignment.Center
	        verticalAlignment: VerticalAlignment.Fill
	        topPadding: 48.3
	        bottomPadding: 47
        
        
	        ScrollView {
		        verticalAlignment: VerticalAlignment.Fill
		        horizontalAlignment: HorizontalAlignment.Fill
		        scrollViewProperties.initialScalingMethod:ScalingMethod.Fill
		        scrollViewProperties.scrollMode: ScrollMode.Vertical
		        
		        
		        Container {
		        	horizontalAlignment: HorizontalAlignment.Center
		        	topPadding: 55
		        
			        Container {
				        bottomPadding: 10
				        horizontalAlignment: HorizontalAlignment.Center
				        
                        ImageButton {
                            id: btnObservatorio
                            defaultImageSource: "asset:///images/menu/btnObservatorio.png"
                            pressedImageSource: "asset:///images/menu/btnObservatorio1.png"
                            disabledImageSource: "asset:///images/menu/btnObservatorio.png"
                            
                            onClicked: {
                                //_timeline.requestCatProducto();
                                var observatorio = observatorio_page.createObject();
                                observatorio.vuser 	 = validaruser;
                                observatorio.hashkey = hashkeyN;
                                nPMenuDC.push(observatorio);
                            }
                        }

                    }
                    Container {
                        bottomPadding: 10
                        horizontalAlignment: HorizontalAlignment.Center
                        
                        ImageButton {
                            id: btnLista
                            defaultImageSource: "asset:///images/menu/btnLista.png"
                            pressedImageSource: "asset:///images/menu/btnLista1.png"
                            disabledImageSource: "asset:///images/menu/btnLista.png"
                        
                        }
                    
                    }
                    Container {
                        bottomPadding: 10
                        horizontalAlignment: HorizontalAlignment.Center
                        
                        ImageButton {
                            id: btnTemporada
                            defaultImageSource: "asset:///images/menu/btnTemporada.png"
                            pressedImageSource: "asset:///images/menu/btnTemporada1.png"
                            disabledImageSource: "asset:///images/menu/btnTemporada.png"
                            
                            onClicked: {
                                //_timeline.requestTempCatProducto();
                                var observatoriotemporada = observatoriotemporada_page.createObject();
                                nPMenuDC.push(observatoriotemporada);
                            }
                        }
                    
                    }
                    Container {
                        bottomPadding: 10
                        horizontalAlignment: HorizontalAlignment.Center
                        
                        ImageButton {
                            id: btnFavoritos
                            defaultImageSource: "asset:///images/menu/btnFavoritos.png"
                            pressedImageSource: "asset:///images/menu/btnFavoritos1.png"
                            disabledImageSource: "asset:///images/menu/btnFavoritos.png"
                            onClicked: {
                                var favoritos = favoritos_page.createObject();
                                favoritos.vuser 	= validaruser;
                                favoritos.hashkey 	= hashkeyN;
                                favoritos.nextParameter();
                                nPMenuDC.push(favoritos);
                            }
                        }
                    
                    }
                    Container {
                        bottomPadding: 10
                        horizontalAlignment: HorizontalAlignment.Center
                        
                        ImageButton {
                            id: btnAjustes
                            defaultImageSource: "asset:///images/menu/btnAjustes.png"
                            pressedImageSource: "asset:///images/menu/btnAjustes1.png"
                            disabledImageSource: "asset:///images/menu/btnAjustes.png"
                            
                            onClicked: {
                                var ajustes = ajustes_page.createObject();
                                ajustes.hashkey = hashkeyN;
                                nPMenuDC.push(ajustes);
                            }
                        
                        }
                    
                    }
		        }
			}
    	}
        
    }
    attachedObjects: [
        // Create the ComponentDefinition that represents the custom
        // component my pages *.qml
        
        ComponentDefinition {
            id: observatorio_page
            source: "Observatorio/CategoriaProducto.qml"
        },
        ComponentDefinition {
            id: observatoriotemporada_page
            source: "ObservatorioTemporada/CategoriaProducto.qml"
        },
        ComponentDefinition {
            id: favoritos_page
            source: "Favoritos/Favoritos.qml"
        },
        ComponentDefinition {
            id: ajustes_page
            source: "Ajustes/AjustesMain.qml"
        }
    ]
    
    
    
    function validarUserPage(validaruser){
        if (validaruser == "1"){
            menuprincipal.actionBarVisibility = ChromeVisibility.Visible
            btnObservatorio.enabled = true;
            btnLista.enabled 		= false;
            btnTemporada.enabled	= true;
            btnFavoritos.enabled 	= false;
            btnAjustes.enabled 		= false;
        } else if (validaruser == "0"){
            menuprincipal.actionBarVisibility = ChromeVisibility.Hidden
        }
    }
    
}
	