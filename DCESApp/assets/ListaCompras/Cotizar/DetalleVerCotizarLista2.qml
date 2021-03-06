/* Copyright (c) 2012 Research In Motion Limited.
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

// Item component for the item list presenting available recipes
Container {
    
    id: recipeItem
    
    layout: DockLayout {
    }
    
    Container {
        horizontalAlignment: HorizontalAlignment.Center
        
        layout: DockLayout {
        }
        
        
        // The Item content an image and a text
        
        Container {
            horizontalAlignment: HorizontalAlignment.Fill
            topPadding: 20
            rightPadding: 30
            leftPadding: rightPadding
            
            layout: DockLayout {
            
            }
            
            Container{
                
                background: red.imagePaint
                attachedObjects: [
                    ImagePaintDefinition {
                        id: red
                        //imageSource: "asset:///images/imgNoExiste.png"
                        imageSource: {
                            if (ListItemData.estadoExistencia == "0"){
	                            red.imageSource = "asset:///images/imgNoExiste.png"
                            }else if(ListItemData.estadoExistencia == 1){
	                            red.imageSource 				= "asset:///images/imgExiste.png"
                                nombre.textStyle.color 			= Color.create("#ea7529")
                                segundo.textStyle.color 		= Color.create("#ea7529")
                                presentacion.textStyle.color 	= Color.create("#ea7529")
                                marca.textStyle.color 			= Color.create("#ea7529")
                                fecha.textStyle.color 			= Color.create("#ea7529")
	                        }
	                    }
                        repeatPattern: RepeatPattern.X
                    }
                ]
                horizontalAlignment: HorizontalAlignment.Fill
                
                layout: DockLayout {
                
                }
                
                Container {
                    id: highlightContainer
                    background: Color.create("#75b5d3")
                    opacity: 0.0
                    preferredWidth: 760
                    preferredHeight: 150
                    horizontalAlignment: HorizontalAlignment.Center
                }
                
                Container {
                    layout: StackLayout {
                    
                    }
                    horizontalAlignment: HorizontalAlignment.Left
                    topPadding: 0
                    leftPadding: 20
                    
                    Label {
                        id: nombre
                        text: qsTr(""+ListItemData.nombre) + Retranslate.onLocaleOrLanguageChanged
                        horizontalAlignment: HorizontalAlignment.Left
                        textStyle.color: Color.create("#ffffff")
                        textStyle.fontSize: FontSize.XLarge
                        
                    
                    }
                    
                
                }
                Container {
                    layout: StackLayout {
                        orientation: LayoutOrientation.LeftToRight

                    }
                    horizontalAlignment: HorizontalAlignment.Left
                    
                    topPadding: 80
                    leftPadding: 20
                    
                    Label {
                        id: segundo
                        text: qsTr(hola()) + Retranslate.onLocaleOrLanguageChanged
                        //text: qsTr("$ 4.45") + Retranslate.onLocaleOrLanguageChanged
                        horizontalAlignment: HorizontalAlignment.Left
                        textStyle.color: Color.create("#ffffff")
                        textStyle.fontSize: FontSize.Large
                        preferredWidth: 225.0
                        function hola(){
                            var precio = String(ListItemData.precio);
                            if(precio == "undefined"){
                                segundo.text = "$ 00.00";
                            }else if(precio == ""){
                                segundo.text = "$ 00.00";
                            }else{
                                segundo.text = "$ "+String(ListItemData.precio);
                            }
                        }
                    
                    }
                    
                    Label {
                        id: presentacion
                        text: qsTr(""+ListItemData.presentacion) + Retranslate.onLocaleOrLanguageChanged
                        horizontalAlignment: HorizontalAlignment.Left
                        textStyle.color: Color.create("#ffffff")
                        textStyle.fontSize: FontSize.Large
                    
                    
                    }
                
                
                }
                Container {
                    topPadding: 140
                    leftPadding: 20
                    Label {
                        id: marca
                        text: qsTr("Marca: "+ListItemData.marca) + Retranslate.onLocaleOrLanguageChanged
                        horizontalAlignment: HorizontalAlignment.Left
                        textStyle.color: Color.create("#ffffff")
                        textStyle.fontSize: FontSize.Large
                    
                    
                    }
                }
                Container {
                    topPadding: 200
                    leftPadding: 20
                    Label {
                        id: fecha
                        text: qsTr("Fecha de sondeo: "+ListItemData.fechaSondeo) + Retranslate.onLocaleOrLanguageChanged
                        horizontalAlignment: HorizontalAlignment.Left
                        textStyle.color: Color.create("#ffffff")
                        textStyle.fontSize: FontSize.Large
                    
                    
                    }
                }
            
            }
        
        }
        
        
        
        
    } // Container
    
    
    
    // Highlight function for the highlight Container
    function setHighlight(highlighted) {
        if(highlighted) {
            highlightContainer.opacity = 0.9;
        } else {
            highlightContainer.opacity = 0.0;
        }    
    }
    
    // Connect the onActivedChanged signal to the highlight function
    ListItem.onActivationChanged : {        
        setHighlight(ListItem.active);
    } 
    
    // Connect the onSelectedChanged signal to the highlight function
    ListItem.onSelectionChanged : {
        setHighlight(ListItem.selected);
    }
}
