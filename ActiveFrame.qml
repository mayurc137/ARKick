import bb.cascades 1.0

Container {
    Container {        
        layout: DockLayout {}
        background: Color.create("#2A2A2A")
        Container {
            topPadding: 30
            bottomPadding: 30
            rightPadding: 50
            leftPadding: 50
        ImageView {
            imageSource: "asset:///img/arkick.png"
            scalingMethod: ScalingMethod.AspectFit
        }
    }
        Container {
            bottomPadding: 0
            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Bottom
            /*
            Container {
                preferredWidth: 300
                preferredHeight: 42
                background: Color.create("#121212")
                layout: DockLayout {}
                
                Label {
                    objectName: "TheLabel"
                    horizontalAlignment: HorizontalAlignment.Center
                    verticalAlignment: VerticalAlignment.Center
                    text: "Sidekick Engine Online"
                    textStyle.color: Color.create("#ebebeb")
                    textStyle.fontSize: FontSize.PointValue
                    textStyle.fontSizeValue: 6
                } 
            } */
        }
    }
}
