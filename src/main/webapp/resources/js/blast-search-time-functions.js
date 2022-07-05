var interval = 1000;
var crtTim = 0;
var wtcTim = 0;
var mon =["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"];
var wk = ["Sun","Mon","The","Wed","Thu","Fri","Sat"];
var startDate;

function startInterval(){
  wtcTim = setInterval("myWatch()", interval);
  crtTim = setInterval("getCurrentTime()", interval);
}

function stopInterval(){
  clearInterval(wtcTim);
  clearInterval(crtTim);
}

function getStartDate(){
  startDate = new Date();
  if(sessionStorage.getItem("startDate") == null){
    sessionStorage.setItem("startDate", startDate);
  }
  else{
    startDate.setTime(Date.parse(sessionStorage.getItem("startDate")));
  }
  setSearchTbl();
}

function setStartDate(data){
  startDate = new Date();
  startDate.setTime(Date.parse(data));

  setSearchTbl();
}

function setSearchTbl(){
  var year = startDate.getFullYear();
  var month = startDate.getMonth();
  var weeek = startDate.getDay();
  var day = startDate.getDate();
  var hh = startDate.getHours();
  var mm = startDate.getMinutes();
  var ss = startDate.getSeconds();

  hh = (hh < 10)? "0" + hh: hh;
  mm = (mm < 10)? "0" + mm: mm;
  ss = (ss < 10)? "0" + ss: ss;

  $('#submitted').text(wk[weeek] + " " + mon[month] + " " + day + " " + hh + ":" + mm + ":" + ss + " " + year);
  $('#currentTime').text(wk[weeek] + " " + mon[month] + " " + day + " " + hh + ":" + mm + ":" + ss + " " + year);
  $('#time').text("00:00:00");
}

function getCurrentTime(){
  var nowDate = new Date();
  var year = nowDate.getFullYear();
  var month = nowDate.getMonth();
  var weeek = nowDate.getDay();
  var day = nowDate.getDate();
  var hh = nowDate.getHours();
  var mm = nowDate.getMinutes();
  var ss = nowDate.getSeconds();

  hh = (hh < 10)? "0" + hh: hh;
  mm = (mm < 10)? "0" + mm: mm;
  ss = (ss < 10)? "0" + ss: ss;

  $('#currentTime').text(wk[weeek] + " " + mon[month] + " " + day + " " + hh + ":" + mm + ":" + ss + " " + year);
}

function myWatch(){
  var nowDate = new Date();
  var diffTime = nowDate.getTime() - startDate.getTime();
  var hh = Math.floor(diffTime / (60 * 60 * 1000));
  diffTime = diffTime - (hh * 60 * 60 * 1000);
  var mm = Math.floor(diffTime / (60 * 1000));
  diffTime = diffTime - (mm * 60 * 1000);
  var ss = Math.floor(diffTime / 1000);

  hh = (hh < 10)? "0" + hh: hh;
  mm = (mm < 10)? "0" + mm: mm;
  ss = (ss < 10)? "0" + ss: ss;

  $('#time').text(hh + ":" + mm + ":" + ss);
}
