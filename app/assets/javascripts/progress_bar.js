function getDates(){
  var oneDay = 24*60*60*1000;
  
  var today = moment().format("YYYY-MM-DD");
  var startDate = $('#date_added').text();
  var endDate = $('#date_exp').text();

  var splitToday = today.split("-");
  var todayYear = parseInt(splitToday[0]);
  var todayMonth = parseInt(splitToday[1]);
  var todayDay = parseInt(splitToday[2]);

  var splitStart = startDate.split("-");
  var startYear = parseInt(splitStart[0]);
  var startMonth = parseInt(splitStart[1]);
  var startDay = parseInt(splitStart[2]);

  var splitEnd = endDate.split("-");
  var endYear = parseInt(splitEnd[0]);
  var endMonth = parseInt(splitEnd[1]);
  var endDay = parseInt(splitEnd[2]);

  var newStart = new Date(startYear,startMonth, startDay);
  var newEnd = new Date(endYear, endMonth, endDay);
  var newToday = new Date(todayYear, todayMonth, todayDay);
  
  var totalDays = Math.round(Math.abs((newStart.getTime() - newEnd.getTime())/(oneDay)));
  var daysPassed = Math.round(Math.abs((newStart.getTime() - newToday.getTime())/(oneDay)));

  var daysleft = totalDays - daysPassed;
  var percent = (daysPassed / totalDays)*100;

  $('.bar').progressbar({
    display_text: 'fill',
    use_percentage: false
  });

  $('.bar').attr("style", ("width:" + percent + "%;"));
  $('.bar').attr("aria-valuetransitiongoal", percent);
  $('.bar').attr("aria-valuenow", percent);

  $('.bar').html(daysleft + " Day(s) Left");
};

