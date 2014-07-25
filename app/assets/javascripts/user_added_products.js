$(function() {
	console.log("hello");
	return $("#user_added_product_name").autocomplete({
		source: $("#user_added_product_name").data("autocomplete-source"),
		minLength: 3,

		select: function(event, object) {
			var url = '/products/search/' + object.item.label;
			console.log(url);
			$.getJSON(url, function(data) {
				$('#user_added_product_unit_of_time_period').val(data.unit_of_time_period);
			});
		}
	});
});

//use sandy's method to turn it into four weeks from today
//fill in the id with the date AJAX-requested above. .datepicker('setDate', '07/30/2014')
//In the controller #create, 
//make use of the calendar date.
//make the calendar date override the default length of time

$(function() {
	return $("#datepicker").datepicker(
		{ numberOfMonths: [ 1,2 ],
			minDate: new Date(2014, 6, 23)
		}
		);
});