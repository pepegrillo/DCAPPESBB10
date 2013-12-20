import bb.cascades 1.0

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
                            horizontalAlignment: HorizontalAlignment.Center
                            hintText: qsTr("Pedro")
                            inputMode: TextFieldInputMode.Default
                            input.submitKey: SubmitKey.Next
                            textStyle.color: Color.create("#2e559c")
                            bottomMargin: 30
                        }
                        
                        Label {
                            // Localized text with the dynamic translation and locale updates support
                            text: qsTr("Correo Electrónico") + Retranslate.onLocaleOrLanguageChanged
                            textStyle.base: SystemDefaults.TextStyles.TitleText
                            horizontalAlignment: HorizontalAlignment.Left
                            textStyle.color: Color.create("#aac768")
                        }
                        TextField {
                            horizontalAlignment: HorizontalAlignment.Center
                            hintText: qsTr("usuario@correo.com")
                            inputMode: TextFieldInputMode.EmailAddress
                            input.submitKey: SubmitKey.Next
                            textStyle.color: Color.create("#2e559c")
                        
                        }
                        
                        Label {
                            // Localized text with the dynamic translation and locale updates support
                            text: qsTr("Contraseña") + Retranslate.onLocaleOrLanguageChanged
                            textStyle.base: SystemDefaults.TextStyles.TitleText
                            horizontalAlignment: HorizontalAlignment.Left
                            textStyle.color: Color.create("#aac768")
                        }
                        TextField {
                            horizontalAlignment: HorizontalAlignment.Center
                            hintText: qsTr("Micontraseña*1")
                            inputMode: TextFieldInputMode.Password
                            input.submitKey: SubmitKey.Next
                            textStyle.color: Color.create("#2e559c")
                        
                        }
                        
                        Label {
                            // Localized text with the dynamic translation and locale updates support
                            text: qsTr("Confirmar Contraseña") + Retranslate.onLocaleOrLanguageChanged
                            textStyle.base: SystemDefaults.TextStyles.TitleText
                            horizontalAlignment: HorizontalAlignment.Left
                            textStyle.color: Color.create("#aac768")
                        }
                        TextField {
                            horizontalAlignment: HorizontalAlignment.Center
                            hintText: qsTr("Micontraseña*1")
                            inputMode: TextFieldInputMode.Password
                            input.submitKey: SubmitKey.Submit
                            textStyle.color: Color.create("#2e559c")
                        
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
                                var MenuPrincipal = menuPrincipal_page.createObject();
                                nPMenuDC.push(MenuPrincipal);
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
        ComponentDefinition {
            id: menuPrincipal_page
            source: "../MenuPrincipal.qml"
            
        }
       
    ]
}
