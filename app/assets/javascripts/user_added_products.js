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
				$('#user_added_product_number_unit_of_time').val(data.number_unit_of_time);
				var date =	moment().add(data.unit_of_time_period.replace("(s)", ""), data.number_unit_of_time).format('YYYY-MM-DD');
				console.log(date);
				$('#expDate').val(date);	
			});
		}
	});
});

$(function() {
	return $("#datepicker").datepicker(
		{ numberOfMonths: [ 1,2 ],
			minDate: new Date(2014, 6, 23)
		});
});


