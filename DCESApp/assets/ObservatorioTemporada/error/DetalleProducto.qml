import bb.cascades 1.0

Page {
    property variant idCategoriaN
    property variant categoriaN
    
    onCreationCompleted: {
        //_timeline.requestProducto(idCategoriaN);
        _timeline.modelProducto.clear();
    }
    
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
                        text: qsTr(""+categoriaN) + Retranslate.onLocaleOrLanguageChanged
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
                    horizontalAlignment: HorizontalAlignment.Center
                    verticalAlignment: VerticalAlignment.Center
                    topPadding: 20
                    leftPadding: 20
                    rightPadding: 20
                    TextField {
                        id: searchProducto
                        horizontalAlignment: HorizontalAlignment.Center
                        hintText: qsTr("Búsqueda de productos...")
                        inputMode: TextFieldInputMode.Default
                        input.submitKey: SubmitKey.Search
                        textStyle.color: Color.create("#2e559c")
                        
                        input {
                            onSubmitted: {
                                var txtSearch = searchProducto.text
                                _timeline.requestSearchProducto(idCategoriaN,txtSearch);
                                var searchproducto  = searchProducto_page.createObject();
                                searchproducto.idCategoriaSearchN = idCategoriaN;
                                searchproducto.categoriaSearchN = categoriaN;
                                searchproducto.nombreSearch = txtSearch;
                                // Push the new Page.
                                nPMenuDC.push(searchproducto);
                            }
                        }
                    
                    }

                }
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
	                dataModel: _timeline.modelProducto
	                listItemComponents: [
	                    ListItemComponent {
	                        type: "item"
	                        
	                        DetalleProductoItem {
	                        
	                        }
	                    
	                    }
	                
	                
	                ]
	                
	                onTriggered: {
	                    // When an item is selected, we push the recipe Page in the chosenItem file attribute.
	                    var chosenItem = dataModel.data(indexPath);
	                    
	                    // Set the correct file source on the ComponentDefinition, create the Page, and set its title.
	                    //tiendasCat_page.source = chosenItem.file;
                        var municipio  = municipio_page.createObject();
                        municipio.idCategoriaNM = idCategoriaN;
                        municipio.categoriaNM   = categoriaN;
                        municipio.idProductoN   = chosenItem.idProducto;
                        _timeline.requestMunicipio(idCategoriaN);
	                    
	                    // Push the new Page.
                        nPMenuDC.push(municipio);
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
                _timeline.modelProducto.clear();
                _timeline.modelTemporada.clear();
                _timeline.requestTempCatProducto();
                nPMenuDC.pop();
            }
        }
    }
    
    attachedObjects: [        
        // Create the ComponentDefinition that represents the custom
        // component my pages *.qml
        ComponentDefinition {
            id: municipio_page
            source: "DetalleProductoFiltroM.qml"
        },
        ComponentDefinition {
            id: searchProducto_page
            source: "SearchProducto/SearchProducto.qml"
        }
    ]

}
