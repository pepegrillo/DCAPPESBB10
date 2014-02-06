import bb.cascades 1.0
import bb.system 1.0
import bb.data 1.0

Page {
    id: pageFavoritos
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
                        text: qsTr("Favoritos") + Retranslate.onLocaleOrLanguageChanged
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
	                        
	                        DetalleFavoritoItem {
	                        
	                        }
	                    
	                    }
	                
	                
	                ]
	                
	                onTriggered: {
	                    // When an item is selected, we push the recipe Page in the chosenItem file attribute.
	                    var chosenItem = dataModel.data(indexPath);	                    
	                    // Set the correct file source on the ComponentDefinition, create the Page, and set its title.
                        var detalleF  = detalleF_page.createObject();
                        detalleF.idarticuloN		= chosenItem.idArticulo;
                        detalleF.productoN 			= chosenItem.producto;
                        detalleF.marcaN	  			= chosenItem.marca;
                        detalleF.presentacionN 		= chosenItem.presentacion;
                        detalleF.establecimientoN	= chosenItem.establecimiento;
                        detalleF.precioProductoN 	= chosenItem.precio;
                        detalleF.precioPromN 		= chosenItem.precioProm;
                        detalleF.latitudN			= chosenItem.altitud;
                        detalleF.longitudN			= chosenItem.longitud;
                        detalleF.fechadeSondeoN		= chosenItem.fechaSondeo;
                        detalleF.validaruser		= vuser;
                        detalleF.hashkeyN			= hashkey;
                        nPMenuDC.push(detalleF);
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
                /*var menuMain  = menuMain_page.createObject();
                menuMain.hashkeyN = hashkey;
                menuMain.validaruser = vuser;
                menuMain.validarUserPage("0");
                nPMenuDC.push(menuMain);*/
                nPMenuDC.navigateTo(menuprincipal);
            }
        }
        
        
    }
    
    
    attachedObjects: [        
        // Create the ComponentDefinition that represents the custom
        // component my pages *.qml
        ComponentDefinition {
            id: detalleF_page
            source: "PerfilFavorito.qml"
        },
        ComponentDefinition {
            id: menuMain_page
            source: "../MenuPrincipal.qml"
        },
        GroupDataModel {
            id: dataModel
            grouping: ItemGrouping.None
            sortedAscending: true
            sortingKeys: [ "establecimiento" ]
        },
        DataSource {
            id: dataSource
            remote: true
            source: "http://observatoriodeprecios.defensoria.gob.sv/ApiREST.php/v1/getElementosFavoritos/"+hashkey;
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
