$(function() {
	jQuery(function() {
		return $("#product_name").autocomplete({
			source: $("#product_name").data("autocomplete-source"),
			minLength: 3,
			select: function(event, object) { //select is an alias function
				var url = '/products/search/' + object.item.label;
				$.getJSON(url, function(data) {
			$('#product_time').val(data.time);
		});
			}
		});	
	});	
});
