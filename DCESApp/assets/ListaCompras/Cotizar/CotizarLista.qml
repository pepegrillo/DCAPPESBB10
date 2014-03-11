import bb.cascades 1.0
import bb.system 1.0
import bb.data 1.0

import "../../data.js" as Data

Page {
    id: pageCotizarLista
    property variant idlista
    property variant hashkey
    property string idArticulo
    
        
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
                        text: qsTr("Producto de la lista") + Retranslate.onLocaleOrLanguageChanged
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
                Container{
                    horizontalAlignment: HorizontalAlignment.Center
                    topPadding: 20.0
                    ImageButton {
                        defaultImageSource: "asset:///images/btnCotizar.png"
                        pressedImageSource: "asset:///images/btnCotizar1.png"
                        
                        onClicked: {
                            var cotizarlista  = cotizarlista_page.createObject();
                            cotizarlista.hashkey = hashkey;
                            cotizarlista.idlista = idlista;
                            cotizarlista.nextParameter();
                            nPMenuDC.push(cotizarlista);
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
	                        
                            DetalleCotizarLista {
                                
	                        }
	                        
	                    }
	                ]
                    onTriggered: {
                        var chosenItem = dataModel.data(indexPath);
                        dialog.body = chosenItem.nombre;
                        idArticulo = chosenItem.idArticulo;
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
            id: cotizarlista_page
            source: "VerCotizarLista.qml"
        
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
            source: "http://observatoriodeprecios.defensoria.gob.sv/ApiREST.php/v1/getListaDeComprasProductos/"+hashkey+"/"+idlista;
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
            id: waitEliminar
            body: "Eliminando..."
        
        },
        SystemToast {
            id: okSuccess
            body: "Tu producto se ha eliminado satisfactoriamente."
        
        },
        SystemToast {
            id: error
            body: "Tu producto no se ha podido eliminar. Intenta más tarde."
        
        },
        SystemDialog {
            
            id: dialog
            title: qsTr("Eliminar Producto")
            body: qsTr("")
            confirmButton.label: qsTr("Eliminar")
            confirmButton.enabled: true
            cancelButton.label: qsTr("Cancelar")
            cancelButton.enabled: true
            
            onFinished: {
                var x = result;
                console.log("SALSA"+dialog.error);
                
                if (x == SystemUiResult.ConfirmButtonSelection) {
                    Data.deleteProductoCompras(hashkey,idArticulo,idLista);
                
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
