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
                        imageSource: "asset:///images/imgYO.png"
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
                    horizontalAlignment: HorizontalAlignment.Center
                    topPadding: 23
                    
                    Label {
                        text: qsTr(""+ListItemData.establecimiento) + Retranslate.onLocaleOrLanguageChanged
                        horizontalAlignment: HorizontalAlignment.Center
                        textStyle.color: Color.create("#ffffff")
                        textStyle.fontSize: FontSize.XLarge
                        translationY: 7.0
                    
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