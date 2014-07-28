$(function() {
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
				$('#datepicker').val(date);	
			});
		}
	});
});

$(function() {
	return $("#datepicker").datepicker({
		minDate: new Date(2014, 6, 23)
	});
});


$(function(){
	return $('#user_added_product_number_unit_of_time').change(function(){
		var num_time = parseInt($(this).val());
		alert(num_time);
	});
});




