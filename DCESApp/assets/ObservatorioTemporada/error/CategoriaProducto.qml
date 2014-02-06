import bb.cascades 1.0

Page {
    
    onCreationCompleted: {
        _timeline.requestTempCatProducto();
        //_timeline.modelTemporada.clear();
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
				        text: qsTr("Categoría") + Retranslate.onLocaleOrLanguageChanged
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

            ListView {
                topPadding: 10
                bottomPadding: 20
                /*dataModel: XmlDataModel {
                	source: "../model.xml"
                }*/
                dataModel: _timeline.modelTemporada
                listItemComponents: [
                    ListItemComponent {
                    	type: "item"
                    	
                    	CategoriaProductoItem {
                         
                        }
                    	
                    }
                   

                ]
                
                onTriggered: {
                    // When an item is selected, we push the recipe Page in the chosenItem file attribute.
                    var chosenItem = dataModel.data(indexPath);
                    
                    // Set the correct file source on the ComponentDefinition, create the Page, and set its title.
                    //tiendasCat_page.source = chosenItem.file;
                    var detalle  = detalle_page.createObject();
                    detalle.idCategoriaN = chosenItem.idCategoria;
                    detalle.categoriaN   = chosenItem.categoria;
                    _timeline.requestProducto(chosenItem.idCategoria);
                    // Push the new Page.
                    nPMenuDC.push(detalle);
                }

            }
    	}
        
    }
    
    paneProperties: NavigationPaneProperties {
        backButton: ActionItem {
            title: "Atrás"
            //imageSource: "asset:///images/customBackButtonImage.png"
            
            onTriggered: {
                
                _timeline.modelTemporada.clear();
                nPMenuDC.pop();
            }
        }
    }
    
    attachedObjects: [        
        // Create the ComponentDefinition that represents the custom
        // component my pages *.qml
        ComponentDefinition {
            id: detalle_page
            source: "DetalleProducto.qml"
        }
    ]
    
}
