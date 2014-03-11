import bb.cascades 1.0
//import bb.system 1.0

import "../../data.js" as Data
import bb.system 1.0

Page {
    
    property variant hashkeyN
    property variant idlistaN
    property string contrato: "Deseo recibir notificaciones por correo electrónico sobre ésta lista."
    
    property variant tiponotificacion
    property variant notificacion
    
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
                        text: qsTr("Configuración de alertas") + Retranslate.onLocaleOrLanguageChanged
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
                        leftPadding: 40
                        rightPadding: leftPadding
                        horizontalAlignment: HorizontalAlignment.Center

                        layout: StackLayout {
                            orientation: LayoutOrientation.LeftToRight

                        }
                        CheckBox {
                            id: aceptarTerminos
                            checked: true
                            translationY: 15.0
                            onCheckedChanged: {
                                if (aceptarTerminos.checked == false) {
                                    var JSONString = '{"hashKey":"'+hashkeyN+'","idLista":"'+idlistaN+'","notificacion":"0"}';
                                    console.log(JSONString);
                                    Data.submitPutAlertasDesAc(JSONString);
                                    desactivate2.show();
                                } else if (aceptarTerminos.checked == true) {
                                    var JSONString = '{"hashKey":"'+hashkeyN+'","idLista":"'+idlistaN+'","notificacion":"1"}';
                                    console.log(JSONString);
                                    Data.submitPutAlertasDesAc(JSONString);
                                    desactivate4.show();
                                }
                                
                                
                            }
                        }
                        Label {
                            // Localized text with the dynamic translation and locale updates support
                            text: qsTr(""+contrato) + Retranslate.onLocaleOrLanguageChanged
                            multiline: true
                            textStyle.base: SystemDefaults.TextStyles.TitleText
                            textStyle.color: Color.create("#aac768")
                            textStyle.textAlign: TextAlign.Justify
                            
                        }
                        
                        
                    
                    }
                    
                    Container {
                        topPadding: 50
                        bottomPadding: 20
                        leftPadding: 40
                        rightPadding: leftPadding
                        horizontalAlignment: HorizontalAlignment.Center
                        
                        layout: StackLayout {
                            orientation: LayoutOrientation.TopToBottom

                        }
                        
                        DateTimePicker {
                            id: diario
                            mode: DateTimePickerMode.Time
                            //expanded: true
                            topMargin: 40
                            bottomMargin: topMargin
                            title: "Hora"
                            //value: diario.dateFromTime("20:30:00")
                        
                        }
                        
                        SegmentedControl {
                            Option {
                                id: option1
                                text: qsTr("Diario")
                                selected: true
                                description: qsTr("alerta diaria")
                                value: 1
                            }
                            Option {
                                id: option2
                                text: qsTr("Semanal")
                                description: qsTr("alerta semanal")
                                selected: false
                                value: 2
                            }
                            Option {
                                id: option3
                                text: qsTr("Mensual")
                                description: qsTr("alerta mensual")
                                selected: false
                                value: 3
                                
                            }
                            onSelectedOptionChanged: {
                                
                                // Use an if statement to change the text style of the 
                                // Label based on the selection option
                                if (selectedOption == option1) {
                                    //diario.visible = true;
                                    dm.visible = false
                                    numbers.visible = false
                                    cHora.visible = true
                                    tiponotificacion = option1.value;
                                    notificacion = "0"
                                } else if (selectedOption == option2) {
                                    dm.visible = true
                                    numbers.visible = false
                                    cHora.visible = false
                                    tiponotificacion = option2.value;
                                } else if (selectedOption == option3) {
                                    numbers.visible = true
                                    dm.visible = false
                                    cHora.visible = false
                                    tiponotificacion = option3.value;
                                }
                                
                            }
                        }

                        Container {
                            id: cHora
                            horizontalAlignment: HorizontalAlignment.Center
                            visible: true
                            Label {
                                id: hora
                                textStyle.color: Color.create("#ea7529")
                                textStyle.textAlign: TextAlign.Center
                                multiline: true
                                visible: false
                                text:{
                                    if((diario.value.getHours()<10) && (diario.value.getMinutes()<10)){
                                        "0"+diario.value.getHours() +":"+"0"+ diario.value.getMinutes()
                                    }else if ((diario.value.getHours()>9) && (diario.value.getMinutes()>9)){
                                        diario.value.getHours() +":"+ diario.value.getMinutes()
                                    }else if ((diario.value.getHours()>9) && (diario.value.getMinutes()<10)){
                                        diario.value.getHours() +":"+"0"+ diario.value.getMinutes()
                                    }else if ((diario.value.getHours()<10) && (diario.value.getMinutes()>9)){
                                        "0"+ diario.value.getHours() +":"+ diario.value.getMinutes()
                                    }else {
                                        diario.value.getHours() +":"+ diario.value.getMinutes()
                                    }
                                    
                                }
                            }
                            Label {
                                textStyle.color: Color.create("#ea7529")
                                textStyle.textAlign: TextAlign.Center
                                multiline: true
                                visible: true
                                text:"Seleccionar solamente hora"
                            }
                        }
                        
                        Container {
                            topMargin: 40
                            bottomMargin: topMargin
                            layout: StackLayout {
                                orientation: LayoutOrientation.LeftToRight

                            }
                            
                            DropDown {
                                id: dm
                                title: qsTr("Día")
                                visible: false
                                onSelectedIndexChanged: {
                                    console.log("SelectedIndex was changed to " + selectedIndex);
                                    
                                }
                                
                                Option {
                                    id: lunes
                                    text: "Lunes"
                                    value: "LU"
                                    //selected: true
                                }
                                Option {
                                    id: martes
                                    text: "Martes"
                                    value: "MA"
                                }                   
                                Option {
                                    id: miercoles
                                    text: "Miércoles"
                                    value: "MI"
                                }
                                Option {
                                    id: jueves
                                    text: "Jueves"
                                    value: "JU"
                                }
                                Option {
                                    id: viernes
                                    text: "Viernes"
                                    value: "VI"
                                }                   
                                Option {
                                    id: sabado
                                    text: "Sábado"
                                    value: "SA"
                                }
                                Option {
                                    id: domingo
                                    text: "Domingo"
                                    value: "DO"
                                }
                            }
                            DropDown {
                                id: numbers
                                title: qsTr("Día")
                                visible: false
                                onSelectedIndexChanged: {
                                    console.log("SelectedIndex was changed to " + selectedIndex);
                                }
                                
                                Option {
                                    id: u1
                                    text: "1"
                                    value: "1"
                                    //selected: true
                                }
                                Option {
                                    id: u2
                                    text: "2"
                                    value: "2"
                                }
                                Option {
                                    id: u3
                                    text: "3"
                                    value: "3"
                                }
                                Option {
                                    id: u4
                                    text: "4"
                                    value: "4"
                                }
                                Option {
                                    id: u5
                                    text: "5"
                                    value: "5"
                                }                   
                                Option {
                                    id: u6
                                    text: "6"
                                    value: "6"
                                }
                                Option {
                                    id: u7
                                    text: "7"
                                    value: "7"
                                }
                                Option {
                                    id: u8
                                    text: "8"
                                    value: "8"                                    
                                }
                                Option {
                                    id: u9
                                    text: "9"
                                    value: "9"
                                }                   
                                Option {
                                    id: u10
                                    text: "10"
                                    value: "10"
                                }
                                Option {
                                    id: u11
                                    text: "11"
                                    value: "11"                                    
                                }
                                Option {
                                    id: u12
                                    text: "12"
                                    value: "12"
                                }                   
                                Option {
                                    id: u13
                                    text: "13"
                                    value: "13"
                                }
                                Option {
                                    id: u14
                                    text: "14"
                                    value: "14"
                                }
                                Option {
                                    id: u15
                                    text: "15"
                                    value: "15"                                    
                                }
                                Option {
                                    id: u16
                                    text: "16"
                                    value: "16"
                                }                   
                                Option {
                                    id: u17
                                    text: "17"
                                    value: "17"
                                }
                                Option {
                                    id: u18
                                    text: "18"
                                    value: "18"                                    
                                }
                                Option {
                                    id: u19
                                    text: "19"
                                    value: "19"
                                }
                                Option {
                                    id: u20
                                    text: "20"
                                    value: "20"
                                }
                                Option {
                                    id: u21
                                    text: "21"
                                    value: "21"
                                }
                                Option {
                                    id: u22
                                    text: "22"
                                    value: "22"                                    
                                }
                                Option {
                                    id: u23
                                    text: "23"
                                    value: "23"
                                }                   
                                Option {
                                    id: u24
                                    text: "24"
                                    value: "24"
                                }
                                Option {
                                    id: u25
                                    text: "25"
                                    value: "25"                                    
                                }
                                Option {
                                    id: u26
                                    text: "26"
                                    value: "26"
                                }                   
                                Option {
                                    id: u27
                                    text: "27"
                                    value: "27"
                                }
                                Option {
                                    id: u28
                                    text: "28"
                                    value: "28"
                                }
                                Option {
                                    id: u29
                                    text: "29"
                                    value: "29"
                                }                   
                                Option {
                                    id: u30
                                    text: "30"
                                    value: "30"
                                }
                                Option {
                                    id: u31
                                    text: "31"
                                    value: "31"
                                }
                            }
                            
                            

                        }
                        
                        ImageButton {
                            defaultImageSource: "asset:///images/btnAceptar.png"
                            pressedImageSource: "asset:///images/btnAceptar1.png"
                            
                            onClicked: {
                                
                                if (option1.selected){
                                    tiponotificacion = "1"
                                    notificacion = "0"
                                }else if(option2.selected){
                                    tiponotificacion = "2"
                                    if (dm.selectedIndex == 0){
                                        notificacion = "LU"
                                    }else if (dm.selectedIndex == 1){
                                        notificacion = "MA"
                                    }else if (dm.selectedIndex == 2){
                                        notificacion = "MI"
                                    }else if (dm.selectedIndex == 3){
                                        notificacion = "JU"
                                    }else if (dm.selectedIndex == 4){
                                        notificacion = "VI"
                                    }else if (dm.selectedIndex == 5){
                                        notificacion = "SA"
                                    }else if (dm.selectedIndex == 6){
                                        notificacion = "DO"
                                    }
                                }else if (option3.selected){
                                    tiponotificacion = "3"
                                    notificacion = numbers.selectedIndex + 1
                                    if (notificacion >= 0 && notificacion <= 9) {
                                        notificacion = "0"+notificacion;
                                    }
                                }
                                
                                var JSONString = '{"hashKey":"'+hashkeyN+'","idLista":"'+idlistaN+'","idTipoNotificacion":"'+tiponotificacion+'","notificacion":"'+notificacion+'","hora":"'+hora.text+'"}';
                                console.log(JSONString);
                                Data.validarAlerta(hashkeyN, idlistaN, JSONString);
                                
                            }
                            horizontalAlignment: HorizontalAlignment.Center
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
                nextLoadValidator(hashkeyN, idlistaN);
                nPMenuDC.navigateTo(configuracionLista);
            }
        }
    }
    
    attachedObjects: [
        
        ComponentDefinition {
            id: searchProductoCompras_page
            //source: "ProductoComprasSearch.qml"
        
        },
        SystemToast {
            id: waitAdd
            body: "Creando alerta..."
            
        },
        SystemToast {
            id: okSuccess
            body: "Alerta creada satisfactoriamente."
        
        },
        SystemToast {
            id: okModified
            body: "Alerta modificada satisfactoriamente."
        
        },
        SystemToast {
            id: errorRepite
            body: "Ya existen alertas para esta lista."
        
        },
        SystemToast {
            id: error
            body: "No se ha podido crear la alerta. Inténtelo más tarde."
        
        },
        SystemToast {
            id: desactivate
            body: "Espere..."
        
        },
        SystemToast {
            id: desactivate2
            body: "Alerta desactivada con éxito"
        
        },
        SystemToast {
            id: desactivate3
            body: "No se ha podido desactivar la alerta. Inténtelo más tarde."
        
        },
        SystemToast {
            id: desactivate4
            body: "Alerta activada con éxito"
        
        }
    ]
    
    function nextParameter(hashkey, idlista){
        onCreationCompleted: {
            Data.setAlerta(hashkey,idlista);
        
        }
    }
    
}
