import bb.cascades 1.0

Page {
    property variant idCategoriaNM
    property variant categoriaNM
    property variant idProductoN
    
    onCreationCompleted: {
        //_timeline.requestProducto(idCategoriaN);
        _timeline.modelMunicipio.clear();
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
                        text: qsTr(categoriaN) + Retranslate.onLocaleOrLanguageChanged
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
	                dataModel: _timeline.modelMunicipio
	                listItemComponents: [
	                    ListItemComponent {
	                        type: "item"
	                        
	                        DetalleProductoItemM {
	                        
	                        }
	                    
	                    }
	                
	                
	                ]
	                
	                onTriggered: {
	                    // When an item is selected, we push the recipe Page in the chosenItem file attribute.
	                    var chosenItem = dataModel.data(indexPath);
	                    
	                    // Set the correct file source on the ComponentDefinition, create the Page, and set its title.
	                    //tiendasCat_page.source = chosenItem.file;
                        var detalle  = detalle_page.createObject();
                        detalle.idCategoriaNMFS = idCategoriaNM;
                        detalle.idMunicipioN    = chosenItem.idMunicipio
                        detalle.idProductoNM    = idProductoN;
                        detalle.getDataEstablecimiento(idCategoriaNM)
                        detalle.getDataPresentacion(idCategoriaNM)
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
                _timeline.modelProducto.clear();
                //_timeline.model.clear();
                _timeline.requestProducto(idCategoriaNM);
                nPMenuDC.pop();
            }
        }
    }
    
    attachedObjects: [
        // Create the ComponentDefinition that represents the custom
        // component my pages *.qml
        ComponentDefinition {
            id: detalle_page
            source: "FiltroDetalle.qml"
        },
        ComponentDefinition {
            id: dropdown_page
            source: "DropDown.qml"
        }
    ]

}
