import bb.cascades 1.0
import bb.system 1.0
import bb.data 1.0

Page {
    property variant idCategoriaSearchN
    property variant categoriaSearchN
    property variant nombreSearch
    property variant vuser
    property variant hashkey
    
        
    Container {
        //Todo: fill me with QML
        id: containerBg
        layout: DockLayout {
        
        }
        background: Color.White
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
                        text: qsTr(""+nombreSearch) + Retranslate.onLocaleOrLanguageChanged
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
                    id: lblerror
                    // Localized text with the dynamic translation and locale updates support
                    text: ""
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
                        municipio.idCategoriaNM = idCategoriaSearchN;
                        municipio.categoriaNM   = categoriaSearchN;
                        municipio.idProductoN   = chosenItem.idProducto;
                        municipio.vuser			= vuser;
                        municipio.hashkey		= hashkey;
                        //municipio.nombreSearchN = nombreSearch;
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
            source: "../DetalleProductoFiltroM.qml"
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
            source: "http://observatoriodeprecios.defensoria.gob.sv/ApiREST.php/v1/getListaDeProductosPorCategoriaPorNombre/"+idCategoriaSearchN+"/"+nombreSearch;
            type: DataSourceType.Json
            onDataLoaded: {
                dataModel.clear();
                dataModel.insertList(data.response.msg);
                dataLoadIndicator.stop();
                console.log("Dirección URL "+dataSource.source);
                var errorCode = String(data.response.errorCode);
                console.log("Dirección DATA "+errorCode);
                if (errorCode == "1"){
                    lblerror.text = "No se encuentran datos disponibles."
                } else {
                    lblerror.text = ""
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
