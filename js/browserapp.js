    
                //user current locations
                var currLat = 1;
                var currLon = 1;
                var currAlt = 1 ;
                var currAcc = 1;
                var startflag = 1;
                var selcat = 3;
                var selsubcat = 0;
                var selsubsubcat =-1;
                var radius = 2000;
                // Create new images, which will be loaded right away
                var markerimg = new AR.ImageResource("http://decodingtech.com/arkick/img/marker.png", {onError: errorLoadingImage});
                var clientId = '3JLCFT4CFRGATLFWPOTOCKA41HPLBZWCNBZF21MP5Q4E3AY2';
                var clientSec = 'HT50OBCWT5D2HURLEFR0EROAX0DCCICFPJ0FVB4H0I5RPXHT';

              
                var selectedObject = null;
                var ARKicKBrowser = new Array();
           

                
                AR.context.onLocationChanged = function(lat, lon, alt, acc) {
                   currLat = lat;
                   currLon = lon;
                   currAlt = alt;
                   currAcc = acc;
             
                   if(startflag){
                        startflag =0;
               
                        createPOI();

                   }
                }

                //function that gets called when the displayed poi bubble is clicked
                //sends the id of the selected poi to the native app
                function generateOnPoiBubbleClickFunc(id)
                {
                    return function()
                    {
                        //document.location = "architectsdk://opendetailpage?id="+id;       
                    }
                }
                
                
                // creates a property animation
                function createOnClickAnimation(imageDrawable)
                {
                    var anim = new AR.PropertyAnimation( imageDrawable, 'scaling', 1.0, 1.2, 750, new AR.EasingCurve(AR.CONST.EASING_CURVE_TYPE.EASE_OUT_ELASTIC, {amplitude : 2.0}) );
                    return anim;
                }
                
                
                // creates a function for assigning to label's and imageDrawable's onClickTrigger
                function createClickTrigger(id) 
                {
                    return function() 
                    {
                        // hide the bubble
                        //document.getElementById("footer").style.display = 'block';
                        //document.getElementById("poiName").innerHTML=jsonObject[id].name;
                        //document.getElementById("poiDesc").innerHTML=jsonObject[id].description.substring(0,25);
                        //document.getElementById("footer").onclick= generateOnPoiBubbleClickFunc(id);
                        
                        // reset the previous selected poi
                        if(selectedObject != null)
                        {
                            // reset the property animation
                            selectedObject.animation.stop();
                            
                            selectedObject.arLabel.style.backgroundColor = '#FFFFFF80';
                            selectedObject.img.scaling = 1.0;
                            selectedObject.poiObj.renderingOrder = 0;
                        }
                        
                        // set a new select status for the current selected poi
                        selectedObject = jsonObject[id];
                        selectedObject.arLabel.style.backgroundColor = '#FFFFFFFF';
                        selectedObject.poiObj.renderingOrder = 1;
                        
                        // start the assigned animation
                        selectedObject.animation.start();
                        
                        return true;
                    }
                }
                
                //function called from the native app fia callJavascript method
                //receives json-data as string and processes the contained information
                function createPOI(){
                    document.getElementById("statusElement").innerHTML="Starting POI";  
                var url ='https://api.foursquare.com/v2/venues/search?ll=18.5566,73.9372&categoryId=4bf58dd8d48988d116941735&radius=2000&intent=browse&client_id=3JLCFT4CFRGATLFWPOTOCKA41HPLBZWCNBZF21MP5Q4E3AY2&client_secret=HT50OBCWT5D2HURLEFR0EROAX0DCCICFPJ0FVB4H0I5RPXHT&v=21030621';    
                jQuery.get(url,function(r){
                       
                     document.getElementById("statusElement").innerHTML="Stilling";
                   for(var i = 0; i < r.response.venues.length; i++)
                    {
                        var obj = new Object(); 
                        var poidrawables = new Array();
                        document.getElementById("statusElement").innerHTML=r.response.venues[i].name;
                        var label = new AR.Label(r.response.venues[i].name,1.0, {offsetY : -1.5,
                                                 triggers: { 
                                                 onClick:
                                                 test()},
                                                 style : {textColor : '#FFC100',backgroundColor : '#FFFFFF80'}});
                        
                        //ARKicKBrowser[i].arLabel = label;
                        document.getElementById("statusElement").innerHTML="Still Good";
                        var poiImage;
                        
                        poiImage = markerimg;
                     
                        
                        
                        var img = new AR.ImageDrawable(poiImage, 2.0,
                                                       {triggers: { 
                                                       onClick:
                                                       test()}}
                                                       );
                        
                        //ARKicKBrowser[i].animation = test();
                        //ARKicKBrowser[i].img = img;
                        
                        poidrawables.push(label);
                        poidrawables.push(img);
                         document.getElementById("statusElement").innerHTML="Still Good";
                        geoLoc = new AR.GeoLocation(r.response.venues[i].location.lat,r.response.venues[i].location.lon);
                        obj.poiObj = new AR.GeoObject(geoLoc, {drawables: {cam: poidrawables}});
                        
                        obj.name = r.response.venues[i].name;
                        obj.id = r.response.venues[i].id;
                        
                        ARKicKBrowser[i]=obj;
                    }
                    
          
                },"jsonp");
                    
                }
                
                // Called if loading of the image fails.
                function errorLoadingImage() {
                    // set error message on HUD
                    document.getElementById("statusElement").innerHTML = "Unable to load image!";
                }
                
                
                // hide bubble and reset the selected poi if nothing was hit by a display click
                AR.context.onScreenClick = function()
                {
                    // hide the bubble
                    document.getElementById("footer").style.display = 'none';
                    
                    // and reset the current selected poi
                    if(selectedObject != null)
                    {
                        // reset the property animation
                        selectedObject.animation.stop();
                        
                        selectedObject.arLabel.style.backgroundColor = '#FFFFFF80';
                        selectedObject.img.scaling = 1.0;
                        selectedObject.poiObj.renderingOrder = 0;
                        selectedObject = null;
                    }
                }
                var valr=0;
                var vall=0;
                 function rott()
                 {
                 valr = valr + 1;
                 vall = vall - 1;
                 document.getElementById('zoom').style.webkitTransform="rotate("+valr+"deg)";
                 document.getElementById('zoom').style.mozTransform="rotate("+valr+"deg)";
                 
                 document.getElementById('delete').style.webkitTransform="rotate("+vall+"deg)";
                 document.getElementById('delete').style.mozTransform="rotate("+vall+"deg)";   
                 
                 document.getElementById('info').style.webkitTransform="rotate("+valr+"deg)";
                 document.getElementById('info').style.mozTransform="rotate("+valr+"deg)";

                 document.getElementById('refresh').style.webkitTransform="rotate("+vall+"deg)";
                 document.getElementById('refresh').style.mozTransform="rotate("+vall+"deg)";
                 }
            