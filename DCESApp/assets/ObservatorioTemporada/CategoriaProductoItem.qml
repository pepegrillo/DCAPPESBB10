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
import org.labsquare 1.0

// Item component for the item list presenting available recipes
Container {
    id: recipeItem
    
    layout: DockLayout {
    }
    
    Container {
        horizontalAlignment: HorizontalAlignment.Center
        
        layout: DockLayout {
        }
        
        // Item background image.
        /*ImageView {
            imageSource: "asset:///images/imgGreen.png"
            preferredWidth: 768
            preferredHeight: 173
        }*/
        
        
        
        // The Item content an image and a text
        
        Container {
            horizontalAlignment: HorizontalAlignment.Fill
            topPadding: 20
            rightPadding: 30
            leftPadding: rightPadding
            
            layout: DockLayout {
            
            }
            
            
            
            Container{
                
                ImageView {
                    id: bgNoData
                    horizontalAlignment: HorizontalAlignment.Fill
                    verticalAlignment: VerticalAlignment.Fill
                    imageSource: "asset:///images/imgList"+ListItemData.idCategoria+".png"
                }
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
                        orientation: LayoutOrientation.LeftToRight
                    
                    }
                    topPadding: 23
                    leftPadding: 15
                    Container {
                        preferredWidth: 102.0
                        preferredHeight: 102.0
                        WebImageView {
                            id: img
                            url: ListItemData.imageUrl
                            horizontalAlignment: HorizontalAlignment.Center
                            verticalAlignment: VerticalAlignment.Center
                            visible: (img.loading == 1.0)
                        }
                        ProgressIndicator {
                            value: img.loading
                            verticalAlignment: VerticalAlignment.Center
                            horizontalAlignment: HorizontalAlignment.Center
                            visible: (img.loading < 1.0)
                        }
                        
                    }
                    Label {
                        text: qsTr(ListItemData.categoria) + Retranslate.onLocaleOrLanguageChanged
                        horizontalAlignment: HorizontalAlignment.Center
                        textStyle.color: Color.create("#ffffff")
                        textStyle.fontSize: FontSize.XLarge
                        translationY: 7.0
                        preferredWidth: 490.0
                    
                    }
                    ImageView {
                        imageSource: "asset:///images/arrow.png"
                        translationY: 14.0
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