import bb.cascades 1.0

Page {
    titleBar: TitleBar {
        
        title : "Help"
    }
    Container {
        background:
        Color.create ("1F1F1F");
        
        SegmentedControl {
            Option {
                id: option1
                text: "Instructions"
                selected: true
            }
            Option {
                id: option2
                text: "Information"
            }
            Option {
                id: option3
                text: "Help"
            }
            onSelectedOptionChanged: {
                // Use an if statement to change the text style of the 
                // Label based on the selection option
                if (selectedOption == option1) {
                 webster.url="local:///assets//instructions.html";              
					} else if (selectedOption == option2) {
                        webster.url = "local:///assets//informationnative.html";
                } 
                else if(selectedOption == option3) {
                webster.url = "local:///assets//help.html";

                }
            }
        }    
    
    ScrollView {
        id: scrollView
        WebView {
            id: webster
            url: "local:///assets//instructions.html";
        }
    } 
   } 
    }

