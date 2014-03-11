import bb.cascades 1.0
import bb.data 1.0
import bb.system 1.0

Page {
    property variant idCategoriaNM
    property variant categoriaNM
    property variant idProductoN
    property  variant vuser
    property variant hashkey
    
        
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
                        text: qsTr("Filtro Municipio") + Retranslate.onLocaleOrLanguageChanged
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
                        detalle.validaruser		= vuser;
                        detalle.hashkeyN		= hashkey;
                        detalle.getDataEstablecimiento(idCategoriaNM)
                        detalle.getDataPresentacion(idCategoriaNM)
	                    // Push the new Page.
	                    nPMenuDC.push(detalle);
	                }
	            
	            }
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
        GroupDataModel {
            id: dataModel
            grouping: ItemGrouping.None
            sortedAscending: true
            sortingKeys: [ "municipio" ]
        },
        DataSource {
            id: dataSource
            remote: true
            source: "http://observatoriodeprecios.defensoria.gob.sv/v1/getFiltroMunicipios/"+idCategoriaNM;
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
