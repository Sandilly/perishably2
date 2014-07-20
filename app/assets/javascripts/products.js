$(function() {
	jQuery(function() {
		return $("#product_name").autocomplete({
			source: $("#product_name").data("autocomplete-source")
		});
	});
	$('#new_product').on('click', '#product_name', function() {
		console.log($(this).val());		
	});	
 

});