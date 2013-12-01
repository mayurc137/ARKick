import bb.cascades 1.0
import bb.system 1.0


    Page {
        id: socialPage
        titleBar: TitleBar {
            title: "Community"
        }
        actions: [
            ActionItem {
                ActionBar.placement: ActionBarPlacement.OnBar
                title: "Copy PIN"
                imageSource: "asset:///icons/ic_copy.png"
                onTriggered: {
                    app.copytoclipboard();         
                    toast.body = qsTr("PIN Copied to clipboard");
                    toast.show();
                }
            }
        ]
        ScrollView {
            scrollViewProperties {
                scrollMode: ScrollMode.Vertical
            }
            Container {
                layout: DockLayout {
                }
                Container {
                    horizontalAlignment: HorizontalAlignment.Center
                    verticalAlignment: VerticalAlignment.Center
                    leftPadding: 20
                    bottomPadding: 20
                    topPadding: 20
                    Label {

                        //horizontalAlignment: HorizontalAlignment.Center
                        text: "ARKick now has its BBM Channel."
                        multiline: true
                        textStyle {
                            base: SystemDefaults.TextStyles.TitleText
                            fontWeight: FontWeight.Normal
                            textAlign: TextAlign.Center
                        }
                    }
                    Label {
                        topMargin: 20
                        //topPadding: 30
                        bottomMargin: 5
                        //leftPadding: 10
                        //horizontalAlignment: HorizontalAlignment.Center
                        text: "Join the community for latest news, information and offers."
                        multiline: true
                        textStyle {
                            base: SystemDefaults.TextStyles.BodyText
                            fontWeight: FontWeight.Normal
                            textAlign: TextAlign.Center
                        }
                    }
                    Container {
                        topPadding: 30
                        horizontalAlignment: HorizontalAlignment.Center
                    ImageView {
                        topMargin: 30
                        bottomMargin: 20
                        id: img
                        imageSource: "asset:///icons/barcode.png"
                    }}
                    Container {
                        topMargin: 5
                        leftMargin: 15
                        rightMargin: 15
                        horizontalAlignment: HorizontalAlignment.Center
                        layout: StackLayout {
                            orientation: LayoutOrientation.LeftToRight
                        }
                        Label {
                            //topPadding: 30
                            //rightPadding: 30
                            text: "BBM channel pin:"
                            textStyle {
                                base: SystemDefaults.TextStyles.TitleText
                                fontWeight: FontWeight.Normal
                                textAlign: TextAlign.Center
                            }
                        }
                        Label {
                            //topPadding: 30
                            //leftPadding: 40
                            id: pinText
                            text: "C0001CB83"
                            textStyle {
                                base: SystemDefaults.TextStyles.TitleText
                                fontWeight: FontWeight.Normal
                                textAlign: TextAlign.Center
                            }
                        }
                    }
                    Container {
                        topMargin: 30
                        verticalAlignment: VerticalAlignment.Bottom
                        horizontalAlignment: HorizontalAlignment.Center
                        topPadding: 30
                        layout: StackLayout {
                            orientation: LayoutOrientation.TopToBottom
                        }
                        Label {
                            horizontalAlignment: HorizontalAlignment.Center
                            text: "You can also connnect with us on"
                            textStyle {
                                base: SystemDefaults.TextStyles.BodyText
                                fontWeight: FontWeight.Normal
                                textAlign: TextAlign.Center
                            }
                        }
                        Container {
                            leftPadding: 20
                            rightPadding: 20
                            horizontalAlignment: HorizontalAlignment.Center
                            layout: StackLayout {
                                orientation: LayoutOrientation.LeftToRight
                            }
                            ImageButton {
                                //text: "Facebook"
                                leftMargin: 10
                                defaultImageSource: "asset:///icons/Facebook-btn.png"
                                pressedImageSource: "asset:///icons/Facebook-btn.png"
                                disabledImageSource: "asset:///icons/Facebook-btn.png"
                                attachedObjects: [
                                    Invocation {
                                        id: facebook
                                        query {
                                            //invokeTargetId: "sys.browser"
                                            mimeType: "text/html"
                                            uri: "http://www.facebook.com/ReFocusLabs"
                                        }
                                    }
                                ]
                                onClicked: {
                                    facebook.trigger("bb.action.OPEN")
                                }
                            }
                            ImageButton {
                                // text: "Twitter"
                                leftMargin: 10
                                defaultImageSource: "asset:///icons/twitter-btn.png"
                                pressedImageSource: "asset:///icons/twitter-btn.png"
                                disabledImageSource: "asset:///icons/twitter-btn.png"
                                attachedObjects: [
                                    Invocation {
                                        id: twitter
                                        query{
                                            //invokeTargetId: "sys.browser"
                                            mimeType: "text/html"
                                            uri: "https://twitter.com/refocus_labs"
                                        }
                                    }
                                ]
                                onClicked: {
                                    twitter.trigger("bb.action.OPEN")
                                }
                            }
                        }
                    }
                }
            }
        }
        attachedObjects: [
            SystemToast {
                id: toast
                body: qsTr("Java Script Enabled")
                //icon: "asset:///images/backword.png"
            }
        ]
    }

