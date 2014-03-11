import bb.cascades 1.0

Dialog {
    id: dialog
    
    signal back();
    signal sampleSignal(string text);
    
    attachedObjects: [
        TextStyleDefinition {
            id: titleStyle
            base: SystemDefaults.TextStyles.BigText
            color: Color.create("#60323C")
        },
        TextStyleDefinition {
            id: titleTextStyle
            base: SystemDefaults.TextStyles.TitleText
            color: Color.Black
        }
    ]
    
    Container {
        id: mainContainer
        preferredWidth: 700 
        layout: DockLayout {}
        verticalAlignment: VerticalAlignment.Center;
        horizontalAlignment: HorizontalAlignment.Center;
        
        background: Color.create("#f9f7f2")
        
        Container {
            layout: StackLayout {}
            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Center
            
            Container {
                layout: DockLayout {}
                background: Color.create("#F4E9E1");
                horizontalAlignment: HorizontalAlignment.Fill;
                preferredHeight: 120
                rightPadding: 10
                leftPadding: 10
                
                Label {
                    text: "Members" ;              
                    verticalAlignment: VerticalAlignment.Center;
                    textStyle{
                        base: titleStyle.style
                    }
                }
                
                ImageView {            
                    verticalAlignment: VerticalAlignment.Center;
                    horizontalAlignment: HorizontalAlignment.Right;
                    imageSource: "asset:///images/ic_delete.png"
                    onTouch: {
                        back();
                        dialog.close();
                    }
                }   
            }
            Container {
                layout: StackLayout {}
                topPadding: 20
                bottomPadding: 20
                rightPadding: 10
                leftPadding: 10
                
                TextField {
                    id: name
                    hintText: "Add email address"     
                    input {
                        submitKey: SubmitKey.Submit;
                        onSubmitted: {
                            //cppObj.onEmailDoneClicked(name.text, "");
                        }
                    }         
                }
                
                Divider {}             
                
                ImageButton {
                    id: doneButton
                    defaultImageSource: "asset:///images/btnAceptar.png"
                    horizontalAlignment: HorizontalAlignment.Center;
                    onClicked: {
                        //cppObj.onEmailDoneClicked(name.text, "");
                        doneButton.textAdded();
                    }
                    
                    function textAdded() {
                        dialog.sampleSignal(name.text);
                        dialog.close();
                    }
                }
            }
        }
    }
}
