import bb.cascades 1.0

Page {
    actionBarVisibility: ChromeVisibility.Hidden
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
                            defaultImageSource: "asset:///images/menu/btnObservatorio.png"
                            pressedImageSource: "asset:///images/menu/btnObservatorio1.png"
                            disabledImageSource: "asset:///images/menu/btnObservatorio.png"
                            
                            onClicked: {
                                //_timeline.requestRestaurantes();
                                var observatorio = observatorio_page.createObject();
                                nPMenuDC.push(observatorio);
                            }
                        }

                    }
                    Container {
                        bottomPadding: 10
                        horizontalAlignment: HorizontalAlignment.Center
                        
                        ImageButton {
                            defaultImageSource: "asset:///images/menu/btnLista.png"
                            pressedImageSource: "asset:///images/menu/btnLista1.png"
                            disabledImageSource: "asset:///images/menu/btnLista.png"
                        
                        }
                    
                    }
                    Container {
                        bottomPadding: 10
                        horizontalAlignment: HorizontalAlignment.Center
                        
                        ImageButton {
                            defaultImageSource: "asset:///images/menu/btnTemporada.png"
                            pressedImageSource: "asset:///images/menu/btnTemporada1.png"
                            disabledImageSource: "asset:///images/menu/btnTemporada.png"
                        
                        }
                    
                    }
                    Container {
                        bottomPadding: 10
                        horizontalAlignment: HorizontalAlignment.Center
                        
                        ImageButton {
                            defaultImageSource: "asset:///images/menu/btnFavoritos.png"
                            pressedImageSource: "asset:///images/menu/btnFavoritos1.png"
                            disabledImageSource: "asset:///images/menu/btnFavoritos.png"
                        
                        }
                    
                    }
                    Container {
                        bottomPadding: 10
                        horizontalAlignment: HorizontalAlignment.Center
                        
                        ImageButton {
                            defaultImageSource: "asset:///images/menu/btnAjustes.png"
                            pressedImageSource: "asset:///images/menu/btnAjustes1.png"
                            disabledImageSource: "asset:///images/menu/btnAjustes.png"
                        
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
        }
    ]
}
	