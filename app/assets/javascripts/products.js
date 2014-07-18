$(document).ready(function(){

	$('#new_product').on('keyup', '#product_name', function() {
		console.log($(this).val());
	});

});