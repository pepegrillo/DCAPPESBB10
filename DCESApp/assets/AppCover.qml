import bb.cascades 1.0

Container {
    Container {
        layout: DockLayout {
        }
        background: Color.Black

        ImageView {
            imageSource: "asset:///images/applicationcoverimage.png"
            scalingMethod: ScalingMethod.AspectFit
        }

        Container {
            bottomPadding: 45
            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Bottom

            Container {
                preferredWidth: 320
                preferredHeight: 42
                background: Color.create("#ffc34e")
                layout: DockLayout {
                }

                opacity: 0.7
                Label {
                    objectName: "TheLabel"
                    horizontalAlignment: HorizontalAlignment.Center
                    verticalAlignment: VerticalAlignment.Center
                    text: "Defensoria del Consumidor"
                    textStyle.color: Color.create("#b74901")
                    textStyle.fontSize: FontSize.PointValue
                    textStyle.fontSizeValue: 6
                    textStyle.fontStyle: FontStyle.Italic
                    opacity: 2.0

                }
            }
        }
    }
}