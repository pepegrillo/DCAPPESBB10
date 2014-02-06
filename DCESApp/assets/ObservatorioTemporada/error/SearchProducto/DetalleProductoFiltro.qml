import bb.cascades 1.0

Page {
    
    //property variant idSondeo
    //property variant idArt
    
    onCreationCompleted: {
        //_timeline.requestProducto(idCategoriaN);
        _timeline.modelProductoFiltro.clear();
    }
    
    Container {
        //Todo: fill me with QML
        id: containerBg
        layout: DockLayout {
        
        }
        background: Color.White
        
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
                        text: qsTr("Productos filtrados") + Retranslate.onLocaleOrLanguageChanged
                        textStyle.base: SystemDefaults.TextStyles.BigText
                        horizontalAlignment: HorizontalAlignment.Center
                        textStyle.color: Color.create("#ffffff")
                    }
                }
            }
            Container {
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
            Container {                
                layout: DockLayout {
                
                }
                Label {
                    // Localized text with the dynamic translation and locale updates support
                    text: qsTr(MensajeInfo.mensaje) + Retranslate.onLocaleOrLanguageChanged
                    textStyle.base: SystemDefaults.TextStyles.BigText
                    horizontalAlignment: HorizontalAlignment.Center
                    textStyle.color: Color.create("#000000")
                    multiline: true
                    verticalAlignment: VerticalAlignment.Center
                }
	            ListView {
	                topPadding: 10
	                bottomPadding: 20
	                dataModel: _timeline.modelProductoFiltro
	                listItemComponents: [
	                    ListItemComponent {
	                        type: "item"
	                        
	                        DetalleProductoFiltroItem {
	                        
	                        }
	                    
	                    }
	                
	                
	                ]
	                
	                onTriggered: {
	                    // When an item is selected, we push the recipe Page in the chosenItem file attribute.
	                    var chosenItem = dataModel.data(indexPath);
	                    
	                    // Set the correct file source on the ComponentDefinition, create the Page, and set its title.
	                    //tiendasCat_page.source = chosenItem.file;
	                    var detalle  = detalle_page.createObject();
	                    detalle.productoN 		= chosenItem.producto;
	                    detalle.marcaN	  		= chosenItem.marca;
	                    detalle.presentacionN 	= chosenItem.presentacion;
	                    detalle.precioProductoN = chosenItem.precioProducto;
	                    detalle.precioPromN 	= chosenItem.precioProm;
	                    detalle.nombreN			= chosenItem.nombre;
	                    detalle.latitudN		= chosenItem.altitud;
	                    detalle.longitudN		= chosenItem.longitud;
	                    detalle.fechadeSondeoN	= chosenItem.fechadeSondeo; 
	                    // Push the new Page.
	                    nPMenuDC.push(detalle);
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
                _timeline.modelProductoFiltro.clear();
                //_timeline.modelMunicipio.clear();
                nPMenuDC.pop();
            }
        }
    }

    attachedObjects: [
        // Create the ComponentDefinition that represents the custom
        // component my pages *.qml
        ComponentDefinition {
            id: detalle_page
            source: "PerfilProducto.qml"
        }
    ]

}
