// function getDates(){
//   var oneDay = 24*60*60*1000;

//   var today = moment().format("YYYY-MM-DD");
//   var startDate = $('#date_added').text();
//   var endDate = $('#date_exp').text();

//   var newTodayDate = splitDates(today);
//   var newStartDate = splitDates(startDate);
//   var newEndDate = splitDates(endDate);

//   var totalDays = total(newStartDate,newEndDate,oneDay);
//   var passDays = passed(newStartDate, today, oneDay);

//   setProgressBar(totalDays, passDays);
// };

// function splitDates(date){
//   var split =  date.split("-");
  
//   parseDate(split);
// };

// function parseDate(date){
//   var dateYear = parseInt(date[0]);
//   var dateMonth = parseInt(date[1]-1);
//   var dateDay = parseInt(date[2]);

//   createDate(dateYear, dateMonth, dateDay);
// };

// function createDate(dateYear, dateMonth, dateDay){
//   var newDate = new Date(dateYear,dateMonth,dateDay);
//   return moment(newDate).format("YYYY-MM-DD");
// };

// function total(start,end,oneDay){
//   return Math.round(Math.abs((start.getTime() - end.getTime()) / (oneDay)));  
// };

// function passed(startDate,todayDate,oneDay){
//   return Math.round(Math.abs((startDate.getTime() - todayDate.getTime())/(oneDay)));
// };

// function setProgressBar(total, passed){
//   var daysLeft =  total - passed;
//   var percent = (passed / total)*100;

//   $('.bar').progressbar({
//      display_text: 'fill',
//      use_percentage: false
//    });

//   $('.bar').attr("style", ("width:" + percent + "%;"));
//   $('.bar').attr("aria-valuetransitiongoal", percent);
//   $('.bar').attr("aria-valuenow", percent);

//   $('.bar').html(daysLeft + " Day(s) Left");

//   console.log(percent);
// };


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
  //var percent = Math.floor((daysPassed / totalDays)*100) + "%";
  var percent = (daysPassed / totalDays)*100;
  //console.log(percent);
  $('.bar').progressbar({
    display_text: 'fill',
    use_percentage: false
  });

  console.log(percent);

  $('.bar').attr("style", ("width:" + percent + "%;"));
  $('.bar').attr("aria-valuetransitiongoal", percent);
  $('.bar').attr("aria-valuenow", percent);

  $('.bar').html(daysleft + " Day(s) Left");
};


