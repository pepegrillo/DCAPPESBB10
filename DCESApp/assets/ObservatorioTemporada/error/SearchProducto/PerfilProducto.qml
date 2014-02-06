import bb.cascades 1.0

Page {
    
    property variant productoN
    property variant presentacionN
    property variant marcaN
    property variant nombreN
    property variant fechadeSondeoN
    property variant precioProductoN
    property variant precioPromN
    property variant latitudN
    property variant longitudN
    
    
    Container {
        //Todo: fill me with QML
        id: containerBg
        layout: DockLayout {
        
        }
        Container {
            id: containerScroll
            horizontalAlignment: HorizontalAlignment.Fill
            verticalAlignment: VerticalAlignment.Fill
            //bottomPadding: 47
            
            Container {
                bottomPadding: 40
                horizontalAlignment: HorizontalAlignment.Fill
                
                background: Color.create("#ea7529")
                Container {
                    topPadding: 30
                    horizontalAlignment: HorizontalAlignment.Center
                    verticalAlignment: VerticalAlignment.Center
                    Label {
                        // Localized text with the dynamic translation and locale updates support
                        text: qsTr("Peril de producto") + Retranslate.onLocaleOrLanguageChanged
                        textStyle.base: SystemDefaults.TextStyles.BigText
                        horizontalAlignment: HorizontalAlignment.Center
                        textStyle.color: Color.create("#ffffff")
                    }
                }
            }
            Container {
                bottomPadding: 30
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
                            text: qsTr(""+productoN) + Retranslate.onLocaleOrLanguageChanged
                            horizontalAlignment: HorizontalAlignment.Left
                            textStyle.color: Color.create("#ea7529")
                            multiline: true
                            textStyle.fontSize: FontSize.XXLarge
                        }
                        
                        Label {
                            // Localized text with the dynamic translation and locale updates support
                            text: qsTr("Presentación: "+presentacionN) + Retranslate.onLocaleOrLanguageChanged
                            textStyle.base: SystemDefaults.TextStyles.TitleText
                            horizontalAlignment: HorizontalAlignment.Left
                            textStyle.color: Color.create("#ea7529")
                        }
                        
                        Label {
                            // Localized text with the dynamic translation and locale updates support
                            text: qsTr("Marca: "+marcaN) + Retranslate.onLocaleOrLanguageChanged
                            textStyle.base: SystemDefaults.TextStyles.TitleText
                            horizontalAlignment: HorizontalAlignment.Left
                            textStyle.color: Color.create("#ea7529")
                        }
                        
                        Label {
                            // Localized text with the dynamic translation and locale updates support
                            text: qsTr("Establecimiento: "+nombreN) + Retranslate.onLocaleOrLanguageChanged
                            textStyle.base: SystemDefaults.TextStyles.TitleText
                            horizontalAlignment: HorizontalAlignment.Left
                            textStyle.color: Color.create("#ea7529")
                            multiline: true
                        }
                        
                        Label {
                            // Localized text with the dynamic translation and locale updates support
                            text: qsTr("Sondeo: "+fechadeSondeoN) + Retranslate.onLocaleOrLanguageChanged
                            textStyle.base: SystemDefaults.TextStyles.TitleText
                            horizontalAlignment: HorizontalAlignment.Left
                            textStyle.color: Color.create("#ea7529")
                            multiline: true
                        }
                        Divider {

                        }
                        Label {
                            // Localized text with the dynamic translation and locale updates support
                            text: qsTr("Normal $"+precioProductoN) + Retranslate.onLocaleOrLanguageChanged
                            textStyle.base: SystemDefaults.TextStyles.TitleText
                            horizontalAlignment: HorizontalAlignment.Left
                            textStyle.color: Color.create("#aac768")
                            multiline: true
                        }
                        Label {
                            // Localized text with the dynamic translation and locale updates support
                            text: qsTr("Promedio $"+precioPromN) + Retranslate.onLocaleOrLanguageChanged
                            textStyle.base: SystemDefaults.TextStyles.TitleText
                            horizontalAlignment: HorizontalAlignment.Left
                            textStyle.color: Color.create("#aac768")
                            multiline: true
                        }
                        Divider {
                        	bottomPadding: 30
                        }
                        

                    }
                    
                    WebView {
                        // The url that is loaded points to the QML of this recipe on GitHub.
                        id: webViewScrollable
                        url: "http://maps.google.com/maps/api/staticmap?center="+latitudN+","+longitudN+"&zoom=15&size=512x512&ma...%20&markers=color:red|color:red|label:C|"+latitudN+","+longitudN+"&sensor=false"
                        //url: "http://maps.googleapis.com/maps/api/staticmap?center=Brooklyn+Bridge,New+York,NY&zoom=13&size=600x300&maptype=roadmap &markers=color:blue%7Clabel:S%7C40.702147,-74.015794&markers=color:green%7Clabel:G%7C40.711614,-74.012318 &markers=color:red%7Ccolor:red%7Clabel:C%7C40.718217,-73.998284&sensor=false"
                        onLoadProgressChanged: {
                            // Update the ProgressBar while loading.
                            progressIndicator.value = loadProgress / 100.0
                        }
                        onLoadingChanged: {

                            if (loadRequest.status == WebLoadStatus.Started) {
                                // Show the ProgressBar when loading started.
                                progressIndicator.opacity = 1.0
                            } else if (loadRequest.status == WebLoadStatus.Succeeded) {
                                // Hide the ProgressBar when loading is complete.
                                progressIndicator.opacity = 0.0
                            } else if (loadRequest.status == WebLoadStatus.Failed) {
                                // If loading failed, fallback to inline HTML, by setting the HTML property directly.
                                html = "<html><head><title>Fallback HTML on Loading Failed</title><style>* { margin: 0px; padding 0px; }body { font-size: 48px; font-family: monospace; border: 1px solid #444; padding: 4px; }</style> </head> <body>Oh ooh, loading of the URL that was set on this WebView failed. Perhaps you are not connected to the Internet?</body></html>"
                                progressIndicator.opacity = 0.0
                            }
                        }

                        // This is the Navigation-requested signal handler so just print to console to illustrate usage.
                        onNavigationRequested: {
                            console.debug("NavigationRequested: " + request.url + " navigationType=" + request.navigationType)
                        }
                        settings.background: Color.create("#88c1df")
                        settings.cookiesEnabled: false
                        horizontalAlignment: HorizontalAlignment.Center
                        settings.zoomToFitEnabled: true
                        settings.javaScriptEnabled: true
                        settings.activeTextEnabled: true
                        settings.webInspectorEnabled: true
                        settings.credentialAutoFillEnabled: true
                        settings.formAutoFillEnabled: true

                    }
                    Container {
                        bottomPadding: 50
                        horizontalAlignment: HorizontalAlignment.Center
                        verticalAlignment: VerticalAlignment.Bottom
                        layout: AbsoluteLayout {

                        }
                        ProgressIndicator {
                            id: progressIndicator
                            opacity: 0
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
            source: "../../MenuPrincipal.qml"

        }

    ]
}
