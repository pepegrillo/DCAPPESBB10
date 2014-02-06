/*
 * Copyright (c) 2011-2013 BlackBerry Limited.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import bb.cascades 1.0
import bb.data 1.0

import "data.js" as Data
import bb.system 1.0

NavigationPane {
    id: nPMenuDC
    objectName: "nPMenuDC"
    backButtonsVisible: true
    
    
	Page {
	    id: rootPage
	    
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
             	
                             	
                ScrollView {
                    verticalAlignment: VerticalAlignment.Fill
                    horizontalAlignment: HorizontalAlignment.Fill
                    scrollViewProperties.initialScalingMethod:ScalingMethod.Fill
                    scrollViewProperties.scrollMode: ScrollMode.Vertical
                    
                    
                    Container {
                        horizontalAlignment: HorizontalAlignment.Center
                        
                        Container {
                            bottomPadding: 50
                            horizontalAlignment: HorizontalAlignment.Center
                            
                            ImageView {
                                imageSource: "asset:///images/imgObservatorioLogo.png"
                                loadEffect: ImageViewLoadEffect.FadeZoom
                                horizontalAlignment: HorizontalAlignment.Right
                            
                            
                            }
                        }
                        
                        Container {
                            leftPadding: 70
                            rightPadding: leftPadding
                            horizontalAlignment: HorizontalAlignment.Center
                            Label {
                                // Localized text with the dynamic translation and locale updates support
                                text: qsTr("Correo Electrónico") + Retranslate.onLocaleOrLanguageChanged
                                textStyle.base: SystemDefaults.TextStyles.TitleText
                                horizontalAlignment: HorizontalAlignment.Left
                                textStyle.color: Color.create("#aac768")
                            }
                            TextField {
                                id: user
                                horizontalAlignment: HorizontalAlignment.Center
                                text: "blackberry6@blackberry.com"
                                hintText: qsTr("usuario@correo.com")
                                inputMode: TextFieldInputMode.EmailAddress
                                input.submitKey: SubmitKey.Next
                                textStyle.color: Color.create("#2e559c")
                                bottomMargin: 30
                            }
                            
                            Label {
                                id: label_pw
                                // Localized text with the dynamic translation and locale updates support
                                //text: qsTr("Contraseña") + Retranslate.onLocaleOrLanguageChanged
                                text: qsTr("Contraseña") + Retranslate.onLocaleOrLanguageChanged
                                textStyle.base: SystemDefaults.TextStyles.TitleText
                                horizontalAlignment: HorizontalAlignment.Left
                                textStyle.color: Color.create("#aac768")
                            }
                            TextField {
                                id: pw
                                horizontalAlignment: HorizontalAlignment.Center
                                text: "blackberry6"
                                hintText: qsTr("Micontraseña*1")
                                inputMode: TextFieldInputMode.Password
                                input.submitKey: SubmitKey.Submit
                                textStyle.color: Color.create("#2e559c")
                            
                            }
                            
                        }
                        
                        Container {
                            id: login
                            topPadding: 50
                            leftPadding: 70
                            rightPadding: leftPadding
                            horizontalAlignment: HorizontalAlignment.Center

                            layout: StackLayout {
                                orientation: LayoutOrientation.LeftToRight

                            }
                            ImageButton {
                                defaultImageSource: "asset:///images/btnLogin.png"
                                pressedImageSource: "asset:///images/btnLogin1.png"
                                
                                onClicked: {
                                    var User = user.text
                                    var Pw	 = pw.text
                                    var PwSha = Data.SHA1(Pw);
                                    console.log("PwSha "+PwSha);
                                    
                                    Data.getDataUser(User,PwSha);
                                }
                            }
                            ImageButton {
                                defaultImageSource: "asset:///images/btnRegistro.png"
                                pressedImageSource: "asset:///images/btnRegistro1.png"
                                
                                onClicked: {
                                    var Registro = registro_page.createObject();
                                    nPMenuDC.push(Registro);
                                }
                            }
                            
                            
                        }
                        
                        Container {
                            topPadding: 20
                            leftPadding: 70
                            rightPadding: leftPadding
                            horizontalAlignment: HorizontalAlignment.Right
                            
                            layout: StackLayout {
                                orientation: LayoutOrientation.LeftToRight
                            
                            }
                            ImageButton {
                                defaultImageSource: "asset:///images/btnSaltar.png"
                                pressedImageSource: "asset:///images/btnSaltar1.png"
                                
                                onClicked: {
                                    var menuprincipalout = menuPrincipalOut_page.createObject();
                                    menuprincipalout.validaruser = "1";
                                    menuprincipalout.validarUserPage("1");
                                    nPMenuDC.push(menuprincipalout);
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
                id: myQmlToast
                body: "Usuario y/o contaseña incorrecta."
                /*onFinished: {
                    Application.quit();
                }*/
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
            id: registro_page
            source: "Registro/registro.qml"
        },
        ComponentDefinition {
            id: menuPrincipal_page
            source: "MenuPrincipal.qml"
        },
        ComponentDefinition {
            id: menuPrincipalOut_page
            source: "MenuPrincipal.qml"
        },
        ComponentDefinition {
            id: loginPage_page
            source: "MenuPrincipal.qml"
        }
    ]
    
    onCreationCompleted: {
        //serviceDataSource.load();
        //_timeline.requestUserLogin("blackberry6@blackberry.com","blackberry6");
    }
    onPopTransitionEnded: {
        page.destroy();
    }
    peekEnabled: false
    /*paneProperties: NavigationPaneProperties {
        backButton: ActionItem {
            title: "First page"
            onTriggered: {
                nPMenuDC.pop();
            }
        }

    }*/
    
    
    
    

}