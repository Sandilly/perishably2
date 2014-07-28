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

// var getDate = $(function(){
// 	var curr_date = new Date();
// 	var curr_day = curr_date.getDate();
// 	var curr_month = curr_date.getMonth() + 1;
// 	var curr_year = curr_date.getFullYear();

// 	if(curr_day < 10){
// 		curr_day = "0" + curr_day
// 	};

// 	if(curr_month < 10){
// 		curr_month = "0" + curr_month
// 	};
// });

// $(function(){
// 	return $('#user_added_product_number_unit_of_time').change(function(){
// 		var num_time = parseInt($(this).val());
// 		change_exp(num_time);
// 	});
// });


// function change_exp(num_time){
// 	// $("#user_added_product_number_unit_of_time, #user_added_product_unit_of_time_period")
// 	$('#user_added_product_unit_of_time_period').change(function(){
// 			var period_time = $(this).val();
// 			switch (period_time){
// 		   	case "Day(s)":
	
// 		   		$('#datepicker').val((moment().add('d', num_time).format("L")));
// 		   		break;
// 		   	case "Week(s)":
// 		   		$('#datepicker').val((moment().add('w', num_time).format("L")));
// 		   		break;
// 		   	case "Month(s)": 
// 		      $('#datepicker').val((moment().add('M', num_time).format("L")));
// 		      break;
// 		    case "Year(s)": 
// 		      $('#datepicker').val((moment().add('y', num_time).format("L")));
// 		      break;

// 		   	default: 
// 		      alert('Default case');
// 		      break;
// 			}
// 			//$('#datepicker').val(date);	
// 		});
// };



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
			//$('#datepicker').val(date);	
		});
};



