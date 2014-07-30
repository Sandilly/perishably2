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

$(function(){
	return $("#datepicker").datepicker({
		minDate: 0,
		dateFormat: 'yy-mm-dd'
	});
});

$(function(){

	$("#user_added_product_number_unit_of_time, #user_added_product_unit_of_time_period").change(function(){
		var period_time = $('#user_added_product_unit_of_time_period').val().replace("(s)", "");
		var num_time = $('#user_added_product_number_unit_of_time').val();
		var date =	moment().add(period_time, num_time).format("YYYY-MM-DD");
		$('#datepicker').val(date);
	});
});


$(function(){
	$("#day_of__Specific_notification_date").change(function(){
		$("#select_notification_date").slideDown("slow");
	})
});

$(function(){
	$("#day_of__Default_notification_date").change(function(){
		$("#select_notification_date").slideUp("slow");
	})
});	

$(function(){
	$("#notify_date_type").change(function(){
		var expDate= $("#datepicker").val();
		var expMoment = moment(expDate, "YYYY-MM-DD");
		var num = $("#notify_num").val();
		var unit = $("#notify_date_type").val().replace("(s)", "");
		var notiDate = expMoment.subtract(unit, num).format("YYYY-MM-DD");
		$("#notification_date").val(notiDate);
	})
});

//repeating above function entirely to make it register a change
$(function(){
	$("#notify_num").change(function(){
		var expDate= $("#datepicker").val();
		var expMoment = moment(expDate, "YYYY-MM-DD");
		var num = $("#notify_num").val();
		var unit = $("#notify_date_type").val().replace("(s)", "");
		var notiDate = expMoment.subtract(unit, num).format("YYYY-MM-DD");
		$("#notification_date").val(notiDate);
	})
});






