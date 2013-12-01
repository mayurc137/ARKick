import bb.cascades 1.0
import wt.architect 1.0
import my.lib 1.0

NavigationPane { id: nav
backButtonsVisible: true;
Menu.definition: MenuDefinition {
    
    // Specify the actions that should be included in the menu
    actions: [
        ActionItem {
            title: "Help"
            imageSource: "asset:///icons/help.png"            
            onTriggered: {
                nav.push(help.createObject());
            }
        },
        ActionItem {
            title: "Settings"
            onTriggered: {
                app.loadingHtml("asset://settings.html");
            
            }},
        ActionItem {
            title: "Contact Us"
            imageSource: "asset:///icons/email.png"
            onTriggered: {
                invoke_email.trigger("bb.action.SENDEMAIL")
            }
            attachedObjects: [
                Invocation {
                    id: invoke_email
                    query {
                        mimeType: ""
                        invokeTargetId: "sys.pim.uib.email.hybridcomposer"
                        uri: "mailto:shashwat@refocuslabs.com?subject=ARKick Query"
                        invokerIncluded: true
                        onQueryChanged: invq.updateQuery()
                    }
                }
            ]

        }
        
    ] // end of actions list
} // end of MenuDefinition
Page {
    
    Container {
        	
    	ArchitectView {
        id: archView
        objectName: "archView"
    }
    
    	}
    actions: [
            
            ActionItem {
                title: "Browser Mode"
                imageSource: "asset:///icons/browser.png"
                ActionBar.placement: ActionBarPlacement.OnBar
                
                onTriggered: {
                    app.loadingHtml("asset://selcat.html");
                    updatedialog.open();
                
                }
                attachedObjects: [
                    Dialog {
                        id: updatedialog
                        onCreationCompleted: {
                            /*indicator.start();
                             indicator.running = true;*/
                        }
                        onOpened: {
                            timer.start();
                            indicator.start();
                            indicator.running = true;
                        }
                        onClosed: {
                            indicator.stop();
                            indicator.running = false;
                        }
                        Container {
                            horizontalAlignment: HorizontalAlignment.Fill
                            verticalAlignment: VerticalAlignment.Fill
                            background: Color.create(0.0, 0.0, 0.0, 0.0)
                            layout: DockLayout {
                            }
                            Container {
                                onCreationCompleted: {
                                    //_MaxSecureAntiVirus.stopUpdate.connect(updateSuccessful);
                                }
                                maxHeight: 397
                                horizontalAlignment: HorizontalAlignment.Center
                                verticalAlignment: VerticalAlignment.Center
                                layout: DockLayout {
                                }
                                
                                Container {
                                    id: data
                                    topPadding: 5
                                    bottomPadding: 23
                                    layout: StackLayout {
                                        orientation: LayoutOrientation.LeftToRight
                                    }
                                    layoutProperties: StackLayoutProperties {
                                        spaceQuota: 1.0
                                    }
                                    horizontalAlignment: HorizontalAlignment.Fill
                                    verticalAlignment: VerticalAlignment.Fill
                                    ActivityIndicator {
                                        id: indicator
                                        horizontalAlignment: HorizontalAlignment.Left
                                        //leftPadding: 5
                                        preferredHeight: 190
                                        preferredWidth: 190
                                    }
                                    Label {
                                        id: updating
                                        //leftPadding: 10
                                        horizontalAlignment: HorizontalAlignment.Center
                                        verticalAlignment: VerticalAlignment.Center
                                        //text: "Checking for Updates"
                                        textStyle.color: Color.Black
                                        textStyle.base: SystemDefaults.TextStyles.BodyText
                                    }
                                }
                            }
                        }
                        function updateSuccessful() {
                            updatedialog.close();
                            /*_MaxSecureAntiVirus.showCurrentVersion();
                             * currentVersionDB.text="Current Version:" + _MaxSecureAntiVirus.currentVersion*/
                        }
                    },
                    QTimer {
                        id:timer
                        singleShot: true 
                        interval: 7000
                        onTimeout:{
                            timer.stop();
                            updatedialog.close();
                        }}
                        	 ]
                    },
        ActionItem {
            title: "Sidekick Mode"
            imageSource: "asset:///icons/sidekick2.png"
            ActionBar.placement: ActionBarPlacement.OnBar
            
            onTriggered: {
                app.loadingHtml("asset://sidekick.html");
                updatedialog.open();

            }
            attachedObjects: [
                Dialog {
                    id: updatedialog1
                    onCreationCompleted: {
                        /*indicator.start();
                         indicator.running = true;*/
                    }
                    onOpened: {
                        timer1.start();
                        indicator1.start();
                        indicator1.running = true;
                    }
                    onClosed: {
                        indicator1.stop();
                        indicator1.running = false;
                    }
                    Container {
                        horizontalAlignment: HorizontalAlignment.Fill
                        verticalAlignment: VerticalAlignment.Fill
                        background: Color.create(0.0, 0.0, 0.0, 0.0)
                        layout: DockLayout {
                        }
                        Container {
                            onCreationCompleted: {
                                //_MaxSecureAntiVirus.stopUpdate.connect(updateSuccessful);
                            }
                            maxHeight: 397
                            horizontalAlignment: HorizontalAlignment.Center
                            verticalAlignment: VerticalAlignment.Center
                            layout: DockLayout {
                            }
                            
                            Container {
                                id: data1
                                topPadding: 5
                                bottomPadding: 23
                                layout: StackLayout {
                                    orientation: LayoutOrientation.LeftToRight
                                }
                                layoutProperties: StackLayoutProperties {
                                    spaceQuota: 1.0
                                }
                                horizontalAlignment: HorizontalAlignment.Fill
                                verticalAlignment: VerticalAlignment.Fill
                                ActivityIndicator {
                                    id: indicator1
                                    horizontalAlignment: HorizontalAlignment.Left
                                    //leftPadding: 5
                                    preferredHeight: 190
                                    preferredWidth: 190
                                }
                                Label {
                                    id: updating1
                                    //leftPadding: 10
                                    horizontalAlignment: HorizontalAlignment.Center
                                    verticalAlignment: VerticalAlignment.Center
                                    //text: "Checking for Updates"
                                    textStyle.color: Color.Black
                                    textStyle.base: SystemDefaults.TextStyles.BodyText
                                }
                            }
                        }
                    }
                    function updateSuccessful() {
                        updatedialog1.close();
                        /*_MaxSecureAntiVirus.showCurrentVersion();
                         * currentVersionDB.text="Current Version:" + _MaxSecureAntiVirus.currentVersion*/
                    }
                },
                QTimer {
                    id:timer1
                    singleShot: true 
                    interval: 2500
                    onTimeout:{
                        timer1.stop();
                        updatedialog1.close();
                    }
                    
                }

            ]
        },
        ActionItem {
            title: "Social Integration"
            imageSource: "asset:///icons/social.png"
            ActionBar.placement: ActionBarPlacement.InOverflow
            
            onTriggered: {
                nav.push(social.createObject());
            }
        },
    ActionItem {
        title: "Community"
        imageSource: "asset:///icons/sidekick1.png"
        ActionBar.placement: ActionBarPlacement.InOverflow
        
        onTriggered: {
            nav.push(community.createObject());
        }
    },
        ActionItem {
            title: "Website"
            imageSource: "asset:///icons/site.png"
            attachedObjects: [
                Invocation {
                    id: invokeAppUpdate
                    query {
                       mimeType: "utl"
                        uri: "http://arkick.com"
                    }
                }
            ]
            onTriggered: {
                invokeAppUpdate.trigger("bb.action.OPEN")
            }
        },
        ActionItem {
            title: "Share"
            imageSource: "asset:///icons/share.png"
            onTriggered: {
                app.share();   
            }
        }             
    ]
    attachedObjects: [
        ComponentDefinition {
            id: activeFrame
            source: "ActiveFrame.qml"
        },
        ComponentDefinition {
            id: help
            source: "help.qml"
        },
        ComponentDefinition {
            id: social
            source: "social.qml"
        },
        ComponentDefinition {
            id: community
            source: "community.qml"
        },
        ComponentDefinition {
            id: web1
            source: "webview1.qml";
        }
    ]

}
}
