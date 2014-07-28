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
				change_exp();
			});
		}
	});
});

$(function() {
	return $("#datepicker").datepicker({
		minDate: 0
	});
});

function change_exp(){
	$("#user_added_product_number_unit_of_time, #user_added_product_unit_of_time_period").change(function(){
	//$('#user_added_product_unit_of_time_period').change(function(){
			var period_time = $('#user_added_product_unit_of_time_period').val();
			var num_time = $('#user_added_product_number_unit_of_time').val();
			switch (period_time){
		   	case "Day(s)":
	
		   		$('#datepicker').val((moment().add('d', num_time).format("YYYY-MM-DD")));
		   		break;
		   	case "Week(s)":
		   		$('#datepicker').val((moment().add('w', num_time).format("YYYY-MM-DD")));
		   		break;
		   	case "Month(s)": 
		      $('#datepicker').val((moment().add('M', num_time).format("YYYY-MM-DD")));
		      break;
		    case "Year(s)": 
		      $('#datepicker').val((moment().add('y', num_time).format("YYYY-MM-DD")));
		      break;

		   	default: 
		      alert('Default case');
		      break;
		};
	});
};



