           // 1
var catscreen = document.getElementById("catscreen");               // 2
var subcatscreen = document.getElementById("subcatscreen");         // 3
var subsubcatscreen = document.getElementById("subsubcatscreen");   // 4


makevisible(2);
var selcat =-1; 
var selsubcat =-1;
var selsubsubcat =-1;

function makevisible(screen){

   if(screen == 2){
         catscreen.style.visibility="visible";
        subcatscreen.style.visibility="hidden";
        subsubcatscreen.style.visibility="hidden";
       
        
    }
    else if(screen == 3){
       
        catscreen.style.visibility="hidden";
        subcatscreen.style.visibility="visible";
        subsubcatscreen.style.visibility="hidden";
        
    }
    else if(screen == 4){
       
        catscreen.style.visibility="hidden";
        subcatscreen.style.visibility="hidden";
        subsubcatscreen.style.visibility="visible";
      
        
    }
   
}





 
$("#catlist li").click(function(e){
    e.preventDefault();
    var index = $("#catlist li").index(this);
    selcat =index;
    makevisible(3)
    for(var i=0; i<category.response.categories[selcat].categories.length;i++){
               var name = category.response.categories[selcat].categories[i].name;
               $("#subcatscreen ul").append('<li><a href="#"><a class="avatar"><img src="img/category/0.0.png" alt=""></a><h2>'+name+'</h2></a></li>');           
    }
    $("#subcatscreen li").click(function(){
    var index = $("#subcatscreen li").index(this);
    selsubcat = index;
    if(category.response.categories[selcat].categories[selsubcat].categories.length == 0){
        localStorage.selcat = selcat;
        localStorage.selsubcat = selsubcat;
        localStorage.selsubsubcat = -1;
        alert(localStorage.selcat);
        alert(localStorage.selsubcat);
        alert(localStorage.selsubsubcat);
        location.href="browser.html";
    }
    else{
        makevisible(4)
         for(var j=0; j<category.response.categories[selcat].categories[selsubcat].categories.length;j++){
                   var name = category.response.categories[selcat].categories[selsubcat].categories[j].name;
                  
                   $("#subsubcatscreen ul").append('<li><a href="#"><a class="avatar"><img src="img/category/0.0.png" alt=""></a><h2>'+name+'</h2></a></li>');           
        }
    }
    $("#subsubcatscreen li").click(function(){
    var index = $("#subsubcatscreen li").index(this);
    selsubsubcat = index;
        localStorage.selcat = selcat;
        localStorage.selsubcat = selsubcat;
        localStorage.selsubsubcat =selsubsubcat;
        alert(localStorage.selcat);
        alert(localStorage.selsubcat);
        alert(localStorage.selsubsubcat);

        location.href="browser.html";
    });
    
});
});

