import bb.cascades 1.0
import bb.data 1.0
import bb.system 1.0

Page {
    property variant idCategoriaN
    property variant categoriaN
    property variant uri
    property variant validaruser
    property variant hashkeyN
    
    
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
        ActivityIndicator {
            id: dataLoadIndicator
            preferredWidth: 400
            preferredHeight: 400
            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Center
        }
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
                                //_timeline.requestSearchProducto(idCategoriaN,txtSearch);
                                var searchproducto  = searchProducto_page.createObject();
                                searchproducto.idCategoriaSearchN = idCategoriaN;
                                searchproducto.categoriaSearchN   = categoriaN;
                                searchproducto.nombreSearch 	  = txtSearch;
                                searchproducto.vuser			  = validaruser;
                                searchproducto.hashkey			  = hashkeyN;
                                searchproducto.nextParameter();
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
                    id: lblerror
                    // Localized text with the dynamic translation and locale updates support
                    text: qsTr() + Retranslate.onLocaleOrLanguageChanged
                    textStyle.base: SystemDefaults.TextStyles.BigText
                    horizontalAlignment: HorizontalAlignment.Center
                    textStyle.color: Color.create("#000000")
                    multiline: true
                    verticalAlignment: VerticalAlignment.Center
                }
                ListView {
                    topPadding: 10
                    bottomPadding: 20
                    dataModel: dataModel
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
                        municipio.vuser			= validaruser;
                        municipio.hashkey		= hashkeyN;
                        //_timeline.requestMunicipio(idCategoriaN);
                        municipio.nextParameter();
	                    // Push the new Page.
                        nPMenuDC.push(municipio);
	                }
	            
	            }
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
        },
        GroupDataModel {
            id: dataModel
            grouping: ItemGrouping.None
            sortedAscending: true
            sortingKeys: [ "nombre" ]
        },
        DataSource {
            id: dataSource
            remote: true
            source: "http://observatoriodeprecios.defensoria.gob.sv/ApiREST.php/v1/getListaDeProductosPorCategoria/"+idCategoriaN;
            type: DataSourceType.Json
            onDataLoaded: {
                dataModel.clear();
                dataModel.insertList(data.response.msg);
                dataLoadIndicator.stop();
                console.log("Dirección URL "+dataSource.source);
                var errorCode = String(data.response.errorCode);
                console.log("Dirección DATA "+errorCode);
                if (errorCode == "1"){
                    bgNoData.imageSource = "asset:///images/noData1.png"
                
                } else {
                    bgNoData.imageSource = "asset:///images/siData.png"
                }
            }
            onError: {
                dataLoadIndicator.stop();
                myQmlDialog.show();
            }
        },
        // System dialog displayed when the feed can not be shown.
        SystemDialog {
            id: myQmlDialog
            title: "¡Algo malo ha pasado!"
            body: "Se ha producido un error desafortunado con la descarga de los datos, es probable que no posea conexión a Internet."
        }
    ]
    
    function nextParameter(){
	    onCreationCompleted: {
	            dataLoadIndicator.start();
	            dataSource.load();
	            
	    }
    }
    
    
}
