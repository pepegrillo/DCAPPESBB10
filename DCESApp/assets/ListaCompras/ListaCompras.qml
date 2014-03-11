import bb.cascades 1.0
import bb.system 1.0
import bb.data 1.0

import "../data.js" as Data

Page {
    id: pageListaCompras
    property variant vuser
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
        //background: Color.White
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
                        text: qsTr("Lista de Compras") + Retranslate.onLocaleOrLanguageChanged
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
	                        
                            DetalleListaComprasItem {
                                id: detallelista
                                contextActions: [
                                    
                                    // Add a set of four actions to the context menu for
                                    // a list item
                                    ActionSet {
                                        id: asListaCompras
                                        title: "Lista de Compras"
                                        ActionItem {
                                            title: "Ver Lista"
                                            imageSource: "asset:///images/ic_open.png"
                                            ActionBar.placement: ActionBarPlacement.InOverflow
                                            onTriggered: {
                                                detallelista.ListItem.view.pushOpenLista(ListItemData.idLista,ListItemData.nombreLista);
                                            }
                                        }
                                        ActionItem {
                                            title: "Eliminar Lista"
                                            imageSource: "asset:///images/ic_delete.png"
                                            ActionBar.placement: ActionBarPlacement.InOverflow
                                            onTriggered: {
                                                detallelista.ListItem.view.previewDeleteListaCompras(ListItemData.idLista);
                                            }
                                        }
                                    
                                    } // end of ActionSet
                                ]
	                        }
	                        
	                    }
	                ]
                    // ListView functions
                    function pushOpenLista(id, nombre) {
                        var openlistacompras  = openlistacompras_page.createObject();
                        openlistacompras.idLista	 = id;
                        openlistacompras.nombreLista = nombre;
                        openlistacompras.vuserN 	 = vuser;
                        openlistacompras.hashkeyN 	 = hashkey;
                        console.log("PASANDO ID "+id+nombre+vuser+hashkey);
                        nPMenuDC.push(openlistacompras);
                    }
                    function previewDeleteListaCompras(idlista){
                        Data.deleteListaCompras(hashkey,idlista);
                        console.log("Aqui queriendo borrar");
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
    
    actions: [
        ActionItem {
            id: aiFavorito
            title: "Crear Lista"
            ActionBar.placement: ActionBarPlacement.OnBar
            imageSource: "asset:///images/ic_add.png"
            
            onTriggered: {
                var crearlista  = crearlista_page.createObject();
                crearlista.hashkeyN = hashkey;
                crearlista.vuserN	= vuser;
                nPMenuDC.push(crearlista);
            }
            
        }
    ]
    
    attachedObjects: [
        // Create the ComponentDefinition that represents the custom
        // component my pages *.qml
        ComponentDefinition {
            id: crearlista_page
            source: "CrearListaCompras.qml"
        },
        ComponentDefinition {
            id: openlistacompras_page
            source: "VerListaCompras.qml"
        },
        ComponentDefinition {
            id: menuMain_page
            source: "../MenuPrincipal.qml"
        },
        GroupDataModel {
            id: dataModel
            grouping: ItemGrouping.None
            sortedAscending: true
            sortingKeys: [ "nombreLista" ]
        },
        DataSource {
            id: dataSource
            remote: true
            source: "http://observatoriodeprecios.defensoria.gob.sv/ApiREST.php/v1/getListaDeCompra/"+hashkey;
            type: DataSourceType.Json
            onDataLoaded: {
                dataModel.clear();
                dataModel.insertList(data.response.msg);
                dataLoadIndicator.stop();
                console.log("Dirección URL "+dataSource.source);
                var errorCode = String(data.response.errorCode);
                console.log("Dirección DATA "+errorCode);
                if (errorCode == "1"){
                    bgNoData.imageSource = "asset:///images/noData.png"
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
            body: "Tu lista de compras se ha eliminado satisfactoriamente."
        
        },
        SystemToast {
            id: error
            body: "Tu lista de compras no se ha podido eliminar. Intenta más tarde."
        
        }
    ]
    
    function nextParameter(){
        onCreationCompleted: {
            dataLoadIndicator.start();
            dataSource.load();
        
        }
    }
    
    
    

}
