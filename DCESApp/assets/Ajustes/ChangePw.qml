import bb.cascades 1.0
import bb.system 1.0

import "../data.js" as Data

Page {
    
    property variant hashkeyN
    
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
                        text: qsTr("Cambiar Contraseña") + Retranslate.onLocaleOrLanguageChanged
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
                            text: qsTr("Contraseña Nueva") + Retranslate.onLocaleOrLanguageChanged
                            textStyle.base: SystemDefaults.TextStyles.TitleText
                            horizontalAlignment: HorizontalAlignment.Left
                            textStyle.color: Color.create("#aac768")
                        }
                        TextField {
                            id: txtpw
                            horizontalAlignment: HorizontalAlignment.Center
                            hintText: qsTr("Micontraseña*1")
                            inputMode: TextFieldInputMode.Password
                            input.submitKey: SubmitKey.Next
                            textStyle.color: Color.create("#2e559c")
                            validator: Validator {
                                id: pwValidar
                                mode: ValidationMode.Immediate
                                errorMessage: "¡El nivel de seguridad de su contraseña es muy bajo!"
                                
                                onValidate: {
                                    if (txtpw.text.length >= 6)
                                        state = ValidationState.Valid;
                                    else
                                        state = ValidationState.Invalid;
                                }
                                validationRequested: true
                                state: ValidationState.InProgress
                            }
                        
                        }
                        
                        Label {
                            // Localized text with the dynamic translation and locale updates support
                            text: qsTr("Confirmar Contraseña") + Retranslate.onLocaleOrLanguageChanged
                            textStyle.base: SystemDefaults.TextStyles.TitleText
                            horizontalAlignment: HorizontalAlignment.Left
                            textStyle.color: Color.create("#aac768")
                        }
                        TextField {
                            id: txtrepw
                            horizontalAlignment: HorizontalAlignment.Center
                            hintText: qsTr("Micontraseña*1")
                            inputMode: TextFieldInputMode.Password
                            input.submitKey: SubmitKey.Submit
                            textStyle.color: Color.create("#2e559c")
                            validator: Validator {
                                id: repwValidar
                                mode: ValidationMode.Immediate
                                errorMessage: "¡La contraseña no coincide!"
                                
                                onValidate: {
                                    if (txtrepw.text == txtpw.text)
                                        state = ValidationState.Valid;
                                    else
                                        state = ValidationState.Invalid;
                                }
                                validationRequested: true
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
                                if ((pwValidar.valid == true) && (repwValidar.valid == true )) {
                                    
                                    var Pw 	  = txtpw.text;
                                    var PwSha = Data.SHA1(Pw);
                                    
                                    var JSONString = '{"hashKey":"'+hashkeyN+'","clave":"'+PwSha+'"}';
                                    console.log(JSONString);  
                                    Data.submitPutClave(JSONString);
                                    
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
    
    attachedObjects: [
        ComponentDefinition {
            id: startPage_page
            source: "../main.qml"
        
        },
        SystemToast {
            id: waitClave
            body: "Modificando..."
            
        },
        SystemToast {
            id: mClave
            body: "Tu contraseña se ha modificado satisfactoriamente."
            
        },
        SystemToast {
            id: errorClave
            body: "Hubo un error al modificar la contraseña."
            
        }
    ]
    
}
