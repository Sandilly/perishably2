$(function() {
	jQuery(function() {
		return $("#product_name").autocomplete({
			source: $("#product_name").data("autocomplete-source"),
			minLength: 3,
			select: function(event, ui) {
				//alert("this happened"); 
				// this = [object HTMLInputElement]
				//ui = object Object
				//event = object Object
				//alert($([object HTMLInputElement]).text);
				//alert($('.ui-menu-item').text());
				//alert(ui);
				//var url = find_by(name: )

			//jQuery.get( url/showpage [, data/product ] [, success/add product.time to the time text field ] [, dataType/string ] )

			}
		});	
});	
 // 	$('#new_product').on('click', 'input[type=submit]:first', function() {
	// 	console.log($(this).val());		
	// });	
 	
 // 	$('#new_product').on('click', 'input[type=submit]:first', function() {
	// 	console.log($(this).val());		
	// });	

});
// .get $('#product_name').val(). sends a hash back. 
//products.json