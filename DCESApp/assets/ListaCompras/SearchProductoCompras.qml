import bb.cascades 1.0
import bb.system 1.0

import "../data.js" as Data

Page {
    
    property variant hashkeyN
    property variant idlistaN
    
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
                        text: qsTr("Búsqueda de productos") + Retranslate.onLocaleOrLanguageChanged
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
            
            ScrollView {
                verticalAlignment: VerticalAlignment.Fill
                horizontalAlignment: HorizontalAlignment.Fill
                scrollViewProperties.initialScalingMethod:ScalingMethod.Fill
                scrollViewProperties.scrollMode: ScrollMode.Vertical
                
                
                Container {
                    horizontalAlignment: HorizontalAlignment.Center
                    
                    
                    Container {
                        topPadding: 30
                        leftPadding: 70
                        rightPadding: leftPadding
                        horizontalAlignment: HorizontalAlignment.Center
                                                
                        Label {
                            // Localized text with the dynamic translation and locale updates support
                            text: qsTr("Buscar producto:") + Retranslate.onLocaleOrLanguageChanged
                            textStyle.base: SystemDefaults.TextStyles.TitleText
                            horizontalAlignment: HorizontalAlignment.Left
                            textStyle.color: Color.create("#aac768")
                        }
                        TextField {
                            id: txtbusqueda
                            horizontalAlignment: HorizontalAlignment.Center
                            hintText: qsTr("jamón ")
                            inputMode: TextFieldInputMode.Default
                            input.submitKey: SubmitKey.Submit
                            textStyle.color: Color.create("#2e559c")
                            validator: Validator {
                                id: lcValidar
                                mode: ValidationMode.Immediate
                                errorMessage: "¡El texto de búsqueda es muy corto!"
                                
                                onValidate: {
                                    if (txtbusqueda.text.length >= 1)
                                        state = ValidationState.Valid;
                                    else
                                        state = ValidationState.Invalid;
                                }
                                validationRequested: true
                                state: ValidationState.InProgress
                            }
                        
                        }
                        
                    
                    }
                    
                    Container {
                        topPadding: 50
                        bottomPadding: 20
                        leftPadding: 70
                        rightPadding: leftPadding
                        horizontalAlignment: HorizontalAlignment.Center
                        
                        layout: StackLayout {
                            orientation: LayoutOrientation.LeftToRight
                        
                        }
                        ImageButton {
                            defaultImageSource: "asset:///images/btnAceptar.png"
                            pressedImageSource: "asset:///images/btnAceptar1.png"
                            
                            onClicked: {
                                if ((lcValidar.valid == true)) {
	                                var searchProductoCompras = searchProductoCompras_page.createObject();
	                                searchProductoCompras.hashkey = hashkeyN;
	                                searchProductoCompras.idlista = idlistaN;
	                                searchProductoCompras.nombreT = txtbusqueda.text;
	                                searchProductoCompras.nextParameter();
	                                nPMenuDC.push(searchProductoCompras);
                                } else {
                                    clave.show();
                                }   
                            }
                        }
                    
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
                nextParameter();
                nPMenuDC.navigateTo(pageProductoCompras);
            }
        }
    }
    
    attachedObjects: [
        
        ComponentDefinition {
            id: searchProductoCompras_page
            source: "ProductoComprasSearch.qml"
        
        },
        SystemToast {
            id: waitSearch
            body: "Buscando..."
            
        },
        SystemToast {
            id: clave
            body: "El campo de búsqueda está vacío."
        
        }
    ]
    
}
