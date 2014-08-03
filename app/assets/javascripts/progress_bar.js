function splitDates(date){
  var date_split = date.split("-");
  return parseDates(date_split);
};

function parseDates(date){
  var parse_year = parseInt(date[0]);
  var parse_month = parseInt(date[1]-1);
  var parse_day = parseInt(date[2]);
  return getDateObj(parse_year, parse_month, parse_day);
};

function getDateObj(year,month,day){
  var dateObj = new Date(year,month,day);
  return dateObj;
};

function total(start, end, day){
  var totalDays = Math.round(Math.abs((start.getTime() - end.getTime())/(day)));
  return totalDays;
};

function daysPassed(start, today, day){
  var daysPass = Math.round(Math.abs((start.getTime() - today.getTime())/(day)));
  return daysPass;
};

function percent(){
  var percentForBar = (daysPassed / totalDays)*100;
  return percentForBar;
};

function setProgressBar(days,percent){
  $('.bar').progressbar({
    display_text: 'fill',
    use_percentage: false
  });

  $('.bar').attr("style", ("width:" + percent + "%;"));
  $('.bar').attr("aria-valuetransitiongoal", percent);
  $('.bar').attr("aria-valuenow", percent);

  $('.bar').html(days + " Day(s) Left");

};

function setVariables(){
  var oneDay = 24*60*60*1000;

  var today = moment().format("YYYY-MM-DD");
  var startDate = $('#date_added').text();
  var endDate = $('#date_exp').text();

  var newToday = splitDates(today);
  var newStart = splitDates(startDate);
  var newEnd = splitDates(endDate);

  var totalDays = total(newStart,newEnd, oneDay);
  var daysGone = daysPassed(newStart, newToday, oneDay);
  
  var daysleft = totalDays - daysGone;
  var percentage = (daysGone / totalDays)*100;

  setProgressBar(daysleft, percentage);
};

