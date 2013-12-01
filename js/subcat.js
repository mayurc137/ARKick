$(document).ready(function() {
   
				var index = -1;
		        var myword=JSON.parse(localStorage["currentword"]); 
       			
				for(var i=0;i<myword.length;i++)
				{
		 		$("#wordlist ul").append('<li><a href="#"><h1>'+myword[i].taboo+'</h1><p>'+myword[i].word1+', '+myword[i].word2+', '+myword[i].word3+', '+myword[i].word4+', '+myword[i].word5+'</p></a></li>');
				}
		
		
				
		   
		        $("#wordlist li").click(function () {
		          // this is the dom element clicked
			        index = $("#wordlist li").index(this);
			        localStorage.selectedindex = index;
			        
		        });
		});