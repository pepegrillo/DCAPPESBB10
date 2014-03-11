import bb.cascades 1.0
import bb.system 1.0
import bb.data 1.0

import "../data.js" as Data

Page {
    id: pageProductoCompras
    property variant idlista
    property variant hashkey
    property variant nombreT
    property variant idarticulo
    
        
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
                        text: qsTr("Agregar productos") + Retranslate.onLocaleOrLanguageChanged
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
                    
                    dataModel: dataModel
	                listItemComponents: [
	                    ListItemComponent {
                            id: listacompras
	                        type: "item"
	                        
                            DetalleProductoSearch {
                                
	                        }
	                        
	                    }
	                ]
                    onTriggered: {
                        var chosenItem = dataModel.data(indexPath);
                        dialog.body = chosenItem.nombre;
                        idarticulo = chosenItem.idArticulo;
                        dialog.show()
                    
                    }
                    
	            }
	        }
        }
    
    }
    /*paneProperties: NavigationPaneProperties {
        backButton: ActionItem {
            title: "Atrás"
            //imageSource: "asset:///images/customBackButtonImage.png"
            
            onTriggered: {
                var menuMain  = menuMain_page.createObject();
                menuMain.hashkeyN = hashkey;
                menuMain.validaruser = vuser;
                menuMain.validarUserPage("0");
                nPMenuDC.push(menuMain);
                nPMenuDC.navigateTo(menuprincipal);
            }
        }
    }*/
    
    
    
    attachedObjects: [
        // Create the ComponentDefinition that represents the custom
        // component my pages *.qml
        ComponentDefinition {
            id: searchproducto_page
            source: "SearchProductoCompras.qml"
        },
        GroupDataModel {
            id: dataModel
            grouping: ItemGrouping.None
            sortedAscending: true
            sortingKeys: [ "Articulo" ]
        },
        DataSource {
            id: dataSource
            remote: true
            source: "http://observatoriodeprecios.defensoria.gob.sv/ApiREST.php/v1/getProductosPorRutaParaListaPorNombre/"+hashkey+"/"+idlista+"/"+nombreT;
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
        },
        SystemToast {
            id: waitAdd
            body: "Agregando..."
        
        },
        SystemToast {
            id: okSuccess
            body: "Tu producto se ha agregado satisfactoriamente."
        
        },
        SystemToast {
            id: error
            body: "Tu producto no se ha podido agregar. Intenta más tarde."
        
        },
        SystemToast {
            id: errorRepite
            body: "Este producto ya lo has agregado anteriormente."
        
        },
        SystemDialog {
            
            id: dialog
            title: qsTr("Agregar Producto")
            body: qsTr("")
            confirmButton.label: qsTr("Agregar")
            confirmButton.enabled: true
            cancelButton.label: qsTr("Cancelar")
            cancelButton.enabled: true
            
            onFinished: {
                var x = result;
                console.log("SALSA"+dialog.error);
                
                if (x == SystemUiResult.ConfirmButtonSelection) {
                    var JSONString = '{"idLista":"'+idlista+'","idArticulo":"'+idarticulo+'","hashKey":"'+hashkeyN+'"}';
                    console.log(JSONString);
                    Data.submitPostAgregarPro(JSONString);
                } else if (x == SystemUiResult.CancelButtonSelection) {
                    console.log("cancel");
                } else if (x == SystemUiResult.ButtonSelection) {
                    console.log("button");
                } else if (x == SystemUiResult.None) {
                    console.log("none");
                } else if (x == SystemUiResult.Error) {
                    console.log("error");
                } else if (x == SystemUiResult.TimeOut) {
                    console.log("timeout");
                } else {
                    console.log(x);
                }
            
            }
        
        }
    ]
    
    function nextParameter(){
        onCreationCompleted: {
            dataLoadIndicator.start();
            dataSource.load();
        
        }
    }
    
    
    

}
