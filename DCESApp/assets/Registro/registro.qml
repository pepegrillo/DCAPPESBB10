import bb.cascades 1.0
import bb.system 1.0

import "../data.js" as Data

Page {
    Container {
        //Todo: fill me with QML
        id: containerBg
        layout: DockLayout {
        
        }
        ImageView {
            imageSource: "asset:///images/bgBarra.png"
            horizontalAlignment: HorizontalAlignment.Fill
            verticalAlignment: VerticalAlignment.Top
        }
        ImageView {
            imageSource: "asset:///images/bgBarra.png"
            horizontalAlignment: HorizontalAlignment.Fill
            verticalAlignment: VerticalAlignment.Bottom
        }
        
        Container {
            id: containerScroll
            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Fill
            topPadding: 48.3
            bottomPadding: 47
            
            Container {
                bottomPadding: 40
                horizontalAlignment: HorizontalAlignment.Fill
                              
                background: back.imagePaint
                attachedObjects: [
                    ImagePaintDefinition {
                        id: back
                        imageSource: "asset:///images/imgHeader.png"
                        repeatPattern: RepeatPattern.X
                    }
                ]
                Container {
                    topPadding: 30
                    horizontalAlignment: HorizontalAlignment.Center
                    verticalAlignment: VerticalAlignment.Center
                    Label {
                        // Localized text with the dynamic translation and locale updates support
                        text: qsTr("Registro") + Retranslate.onLocaleOrLanguageChanged
                        textStyle.base: SystemDefaults.TextStyles.BigText
                        horizontalAlignment: HorizontalAlignment.Center
                        textStyle.color: Color.create("#ffffff")
                    }
                }
                
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
                            text: qsTr("Nombre") + Retranslate.onLocaleOrLanguageChanged
                            textStyle.base: SystemDefaults.TextStyles.TitleText
                            horizontalAlignment: HorizontalAlignment.Left
                            textStyle.color: Color.create("#aac768")
                        }
                        TextField {
                            id: txtnombre
                            horizontalAlignment: HorizontalAlignment.Center
                            hintText: qsTr("Pedro")
                            inputMode: TextFieldInputMode.Default
                            input.submitKey: SubmitKey.Next
                            textStyle.color: Color.create("#2e559c")
                            bottomMargin: 30
                            validator: Validator {
                                id: nombreValidar
                                mode: ValidationMode.Immediate
                                errorMessage: "Su nombre es demasiado corto."
                                
                                onValidate: {
                                    if (txtnombre.text.length >= 3)
                                        state = ValidationState.Valid;
                                    else
                                        state = ValidationState.Invalid;
                                }
                                validationRequested: true
                            }
                        }
                        
                        Label {
                            // Localized text with the dynamic translation and locale updates support
                            text: qsTr("Apellido") + Retranslate.onLocaleOrLanguageChanged
                            textStyle.base: SystemDefaults.TextStyles.TitleText
                            horizontalAlignment: HorizontalAlignment.Left
                            textStyle.color: Color.create("#aac768")
                        }
                        TextField {
                            id: txtapellido
                            horizontalAlignment: HorizontalAlignment.Center
                            hintText: qsTr("Pérez")
                            inputMode: TextFieldInputMode.Default
                            input.submitKey: SubmitKey.Next
                            textStyle.color: Color.create("#2e559c")
                            bottomMargin: 30
                            validator: Validator {
                                id: apellidoValidar
                                mode: ValidationMode.Immediate
                                errorMessage: "Su apellido es demasiado corto."
                                
                                onValidate: {
                                    if (txtapellido.text.length >= 3)
                                        state = ValidationState.Valid;
                                    else
                                        state = ValidationState.Invalid;
                                }
                                validationRequested: true
                            }
                        }
                        
                        Container {
                            layout: StackLayout {
                                orientation: LayoutOrientation.LeftToRight

                            }
                            Label {
                                id: status
                                // Localized text with the dynamic translation and locale updates support
                                text: qsTr("Género        ") + Retranslate.onLocaleOrLanguageChanged
                                //text: imagetogglebutton.checked ? "M" : "F"
                                textStyle.base: SystemDefaults.TextStyles.TitleText
                                horizontalAlignment: HorizontalAlignment.Left
                                textStyle.color: Color.create("#aac768")
                                textStyle.textAlign: TextAlign.Left
                                translationY: 17.0
                            }
                            ImageToggleButton {
                                id: tbtngenero
                                imageSourceDefault: "asset:///images/btnFemenino.png"
                                imageSourceChecked: "asset:///images/btnMasculino.png"
                                //femenino cambiando a masculino
                                imageSourcePressedUnchecked: "asset:///images/btnFemenino1.png"
                                //masculino cambiando a femenino
                                imageSourcePressedChecked: "asset:///images/btnMasculino1.png"
                                onCheckedChanged: checked ? "M" : "F"
                            }
                            Label {
                                id: txtgenero
                                text: tbtngenero.checked ? "M" : "F"
                                visible: false
                            }
                        }
                        
                        
                        Label {
                            // Localized text with the dynamic translation and locale updates support
                            text: qsTr("Correo Electrónico") + Retranslate.onLocaleOrLanguageChanged
                            textStyle.base: SystemDefaults.TextStyles.TitleText
                            horizontalAlignment: HorizontalAlignment.Left
                            textStyle.color: Color.create("#aac768")
                        }
                        TextField {
                            id: txtcorreo
                            horizontalAlignment: HorizontalAlignment.Center
                            hintText: qsTr("usuario@correo.com")
                            inputMode: TextFieldInputMode.EmailAddress
                            input.submitKey: SubmitKey.Next
                            textStyle.color: Color.create("#2e559c")
                            validator: Validator {
                                id: correoValidar
                                mode: ValidationMode.Immediate
                                errorMessage: "Su correo es incorrecto."
                                
                                onValidate: {
                                    if (txtcorreo.text.length >= 10)
                                        state = ValidationState.Valid;
                                    else
                                        state = ValidationState.Invalid;
                                }
                                validationRequested: true
                            }
                        }
                        
                        Label {
                            // Localized text with the dynamic translation and locale updates support
                            text: qsTr("Contraseña") + Retranslate.onLocaleOrLanguageChanged
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
                        id: enviarForm
                        topPadding: 50
                        bottomPadding: 20
                        leftPadding: 70
                        rightPadding: leftPadding
                        horizontalAlignment: HorizontalAlignment.Center
                        
                        layout: StackLayout {
                            orientation: LayoutOrientation.LeftToRight
                        
                        }
                        ImageButton {
                            id: btnAceptar
                            defaultImageSource: "asset:///images/btnAceptar.png"
                            pressedImageSource: "asset:///images/btnAceptar1.png"
                            
                            onClicked: {
                                if ( (nombreValidar.valid == true) && (apellidoValidar.valid == true) && (correoValidar.valid == true) && (pwValidar.valid == true) && (repwValidar.valid == true) ){
                                    
                                    var Pw	 = txtpw.text
                                    var PwSha = Data.SHA1(Pw);
                                                                      
                                    var JSONString = '{"nombre":"'+txtnombre.text+'","apellido":"'+txtapellido.text+'","sexo":"'+txtgenero.text+'","correo":"'+txtcorreo.text+'","clave":"'+PwSha+'"}';
                                    console.log(JSONString);  
                                    Data.submitPostRegister(JSONString);
                                    
                                } else {
                                    registro.show();
                                }
                                
                            }
                        }
                        
                    
                    }
                
                }
            
            
            
            }
        
        }
    
    
    }
    attachedObjects: [
        // Create the ComponentDefinition that represents the custom
        // component my pages *.qml
        SystemToast {
            id: registro
            body: "Todos los campos son obligatorios."
            /*onFinished: {
             	Application.quit();
            }*/
        },
        SystemToast {
            id: myQmlToast
            body: "Usuario y/o contaseña incorrecta."
            /*onFinished: {
             Application.quit();
             }*/
        },
        SystemToast {
            id: registerToast
            body: "Registrando..."
        },
        SystemToast {
            id: loginToast
            body: "Iniciando Sesión..."
        },
        SystemToast {
            id: bienvenidoToast
            body: "¡Bienvenido!"
        },
        ComponentDefinition {
            id: menuPrincipal_page
            source: "../MenuPrincipal.qml"
            
        }
       
    ]
}
