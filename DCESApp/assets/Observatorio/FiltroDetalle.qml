import bb.cascades 1.0

Page {
    
    //property alias idCategoriaNMF: idCategorianombre.text
    property string idCategoriaNMFS
    property variant idMunicipioN
    property variant idProductoNM
    property variant validaruser
    property variant hashkeyN
    
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
                        id: idCategorianombre
                        // Localized text with the dynamic translation and locale updates support
                        text: qsTr("Filtro de búsqueda") + Retranslate.onLocaleOrLanguageChanged
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
            
            Container {
                topPadding: 70
                horizontalAlignment: HorizontalAlignment.Center
                
                
                
                // Create a DropDown with two options
                DropDown {
                    
                    id: dropDown
                    /*Option {
                        text: "Elegir"
                        selected: true

                    }*/
                    
                    onSelectedValueChanged: {
                        // Use an if statement to enable or disable
                        // a ToggleButton based on the value of the 
                        // current selection
                        /*if (selectedValue == 1) {
                         myToggleButton.enabled = true
                         } else {
                         myToggleButton.enabled = false
                         }*/
                    }
                    title: qsTr("Establecimiento") + Retranslate.onLocaleOrLanguageChanged
                }
            
            
            }
            Divider {
            
            }
            Container {
                topPadding: 40
                horizontalAlignment: HorizontalAlignment.Center
                // Create a DropDown with two options
                DropDown {
                    
                    id: dropDown2
                    
                    onSelectedOptionChanged: {
                        /*if (selectedOption != "Elegir") {
                            myToggleButton.checked = true
                            console.log("CHUCHITOS VOS")
                        }
                        if(selectedOption == "Elegir"){
                            myToggleButton.checked = false
                            console.log("CHUCHITOS VOS AGAIN OTRA VEZ")
                        }*/
                    }
                    onSelectedValueChanged: {
                        // Use an if statement to enable or disable
                        // a ToggleButton based on the value of the 
                        // current selection
                        /*if (selectedValue != "Elegir") {
                            myToggleButton.enabled = true
                        } else {
                            myToggleButton.enabled = false
                        }*/
                        
                    }
                    title: qsTr("Presentación ") + Retranslate.onLocaleOrLanguageChanged
                }

            }
            
            Container {
                horizontalAlignment: HorizontalAlignment.Center
                topPadding: 70
                ImageButton {
                    defaultImageSource: "asset:///images/btnConsultar.png"
                    pressedImageSource: "asset:///images/btnConsultar1.png"
                    
                    onClicked: {
                        var filtroDetalle = filtroDetalle_page.createObject();
                        filtroDetalle.idMunicipioNM 	= idMunicipioN;
                        filtroDetalle.idProductoNMS 	= idProductoNM;
                        filtroDetalle.idEstablecimiento	= dropDown.selectedOption.value;
                        filtroDetalle.idPresentacion    = dropDown2.selectedOption.value;
                        filtroDetalle.vuser				= validaruser;
                        filtroDetalle.hashkey			= hashkeyN;
                        filtroDetalle.nextParameter();
                        //_timeline.requestProductoFiltro(idMunicipioN, idProductoNM, idSondeo, idArt);
                        nPMenuDC.push(filtroDetalle);
                        
                        
                    }
                }

            }
            
        }
    
    }
    onCreationCompleted: {
        
        
    }
    
    attachedObjects: [
        // Create the ComponentDefinition that represents the custom
        // component my pages *.qml
        ComponentDefinition {
            id: filtroDetalle_page
            source: "DetalleProductoFiltro.qml"
        },
        ComponentDefinition {
            id: optionControlDefinition
            Option {
            }
        },
        ComponentDefinition {
            id: optionControlDefinition2
            Option {
            }
        }
    ]
    
    function getDataEstablecimiento(reciboE) {
        
        var request = new XMLHttpRequest()
        request.onreadystatechange = function() {
            if (request.readyState == 4) {
                var resp = request.responseText
                resp = JSON.parse(resp)
                var resp2 = resp.response.msg.tiposSondeos
                console.log(JSON.stringify(resp2))
                //resp2 = JSON.parse(resp2)
                // var addressComponents = resp2.msg[0]
                for (var i = 0; i < resp2.length; i ++) {
                    var option = optionControlDefinition.createObject();
                    option.text = resp2[i].tipoSondeo
                    option.value = resp2[i].idTipoSondeo
                    dropDown.add(option)
                    
                }
            }
        }
        
        // I have used goole's web service url, you can replace with your url
        //request.open("GET", "http://maps.googleapis.com/maps/api/geocode/json?address=" + "Ahmedabad" + "&sensor=false", true)
        request.open("GET", "http://observatoriodeprecios.defensoria.gob.sv/ApiREST.php/v1/getFiltrosBusqueda/"+reciboE+"/", true)
        console.log("http://observatoriodeprecios.defensoria.gob.sv/ApiREST.php/v1/getFiltrosBusqueda/"+reciboE+"/");
        request.send()
    }
    
    function getDataPresentacion(reciboP) {
        var request = new XMLHttpRequest()
        request.onreadystatechange = function() {
            if (request.readyState == 4) {
                var resp = request.responseText
                resp = JSON.parse(resp)
                var resp2 = resp.response.msg.presentacion
                console.log(JSON.stringify(resp2))
                //resp2 = JSON.parse(resp2)
                // var addressComponents = resp2.msg[0]
                for (var i = 0; i < resp2.length; i ++) {
                    var option = optionControlDefinition2.createObject();
                    option.text = resp2[i].presentacion
                    option.value = resp2[i].idArticulo
                    dropDown2.add(option)
                }
            }
        }
        
        // I have used goole's web service url, you can replace with your url
        //request.open("GET", "http://maps.googleapis.com/maps/api/geocode/json?address=" + "Ahmedabad" + "&sensor=false", true)
        request.open("GET", "http://observatoriodeprecios.defensoria.gob.sv/ApiREST.php/v1/getFiltrosBusqueda/"+reciboP+"/", true)
        request.send()
    }

}
