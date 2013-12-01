var arkickpreload = new function () {
		
	this.init = function () {
		
		/////////////////PRELOADING IMAGES///////////////////////

		var imageArray = [];
		//push all images to be loaded to s
		//for (var i=1; i<=28; i++) {
			var i =1;
			imageArray.push('test.jpg');
		//}
		imageCache.pushArray(imageArray, loadImageEvent, loadAllEvent);

		////////////////////////////////////////////////////////
		
	}
	
	function loadImageEvent() {
		
	}
	
	function loadAllEvent() {
		//perform what is to be done when the images are loaded
		
		$('body').html('<img src="test.jpg"/>')

	}

}
	//if you want to show images 
	//$('#images').html(s);
	//where var s ='<img src="images/dnfmomd/' + num + '.jpg" class="notShown" />';
		

$(window).load(arkickpreload.init)
