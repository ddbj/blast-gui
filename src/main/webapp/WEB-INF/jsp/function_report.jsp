<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<script type="text/javascript" src="resources/js/blast-message.js"></script>
<script type="text/javascript" src="resources/js/blast-request-url.js"></script>
<script type="text/javascript" src="resources/js/blast-report-functions.js"></script>
<script type="text/javascript" src="resources/js/blast-search-time-functions.js"></script>
<script type="text/javascript">

blastUrl = "<%= jp.ac.nig.ddbj.blast.util.Conf.blastUrl %>"
var querySequence = replaceDecode(decodeURI('${querySequence}'));
var division = replaceDecode(decodeURI('${division}'));
var blastProgram = replaceDecode(decodeURI('${program}'));
var parameters = replaceDecode(decodeURI('${parameters}'));
var result = replaceDecode(decodeURI('${result}'));
var address = replaceDecode(decodeURI('${address}'));
var requestId;
var reqInterval = 1000;

function post(){
  //var url = blastUrl + "blast";
  var url = blastUrl + "wabi";
  $.ajax({
    type: 'POST',
    url: url,
    dataType: 'json',
    cache: false,
    data: {
      querySequence: querySequence,
      datasets: database,
      database: division,
      program: blastProgram,
      parameters: parameters,
      format: '${format}',
      result: result,
      address: address
    },
    success: function(data){
      if ("illegal-arguments" == data.status) {
        setErrorMsg(errorMsg4);
      } else {
        requestId = data.requestId;
        sessionStorage.setItem("requestId", requestId);
        startGetStatus();
      }
    },
    error: function(xmlreq, textStatus, errorThrown){
      if (404==xmlreq.status) {
        setErrorMsg(errorMsg3);
      } else if (400==xmlreq.status) {
        setErrorMsg(errorMsg4);
      } else if (400<=xmlreq.status && xmlreq.status<=499) {
        setErrorMsg(errorMsg1);
      } else {
        setErrorMsg(errorMsg2);
      }
    }
  });
}

function getStatus(){
  //var url = blastUrl + "blast/" + requestId + "?format=json";
  var url = blastUrl + "wabi/" + requestId + "?format=json";
  $.ajax({
    type: 'GET',
    url: url,
    dataType: 'json',
    cache: false,
    success: function(data, dataType){
      $('#status').text(data.status);
      if(data.status == "finished"){
        getResult();
      }
      else if(data.status == "not-found"){
        getRequestErrorFunction(errorMsg2);
      }
      else if(data.status == "illegal-arguments"){
        getRequestErrorFunction(errorMsg4);
      }
      else{
        setTimeout("getStatus()", reqInterval);
      }
    },
    error: function(xmlreq, textStatus, errorThrown){
      if (404==xmlreq.status) {
        setErrorMsg(errorMsg3);
      } else if (400==xmlreq.status) {
        setErrorMsg(errorMsg4);
      } else if (400<=xmlreq.status && xmlreq.status<=499) {
        setErrorMsg(errorMsg1);
      } else {
        setErrorMsg(errorMsg2);
      }
    }
  });
}

function getResult(){
  //var url = blastUrl + "blast/" + requestId + "?info=result";
  var url = blastUrl + "wabi/" + requestId + "?info=result";
  $.ajax({
    type: 'GET',
    url: url,
    cache: false,
    success: function(data){
      if ("illegal-arguments" == data.status) {
        setErrorMsg(errorMsg4);
      } else {
        getBlastImage(data);
        sessionStorage.removeItem("startDate");
        stopInterval();
        removeSearchInfoTbl();
        blastReport(data, database);
      }
    },
    error: function(xmlreq, textStatus, errorThrown){
      if (404==xmlreq.status) {
        setErrorMsg(errorMsg3);
      } else if (400==xmlreq.status) {
        setErrorMsg(errorMsg4);
      } else if (400<=xmlreq.status && xmlreq.status<=499) {
        setErrorMsg(errorMsg1);
      } else {
        setErrorMsg(errorMsg2);
      }
    }
  });
}

function getBlastImage(data){
  var lines = data.split("\n");
  var headerLine = makeheaderPattern(lines[0]);
  var dataCnt = 0;

  for(var i = 0; i < lines.length; i++){
    if(lines[i].match(new RegExp(headerLine))){
      dataCnt = dataCnt + 1;
      getImage(dataCnt);
    }
  }
}

function getImage(dataCnt){
  //var url = blastUrl + "blast/" + requestId + "?imageId=" + dataCnt;
  var url = blastUrl + "wabi/" + requestId + "?imageId=" + dataCnt;
  $.ajax({
    async: false,
    type: 'GET',
    url: url,
    cache: false,
    success: function(){
    },
    error: function(xmlreq, textStatus, errorThrown){
      if (404==xmlreq.status) {
        setErrorMsg(errorMsg3);
      } else if (400==xmlreq.status) {
        setErrorMsg(errorMsg4);
      } else if (400<=xmlreq.status && xmlreq.status<=499) {
        setErrorMsg(errorMsg1);
      } else {
        setErrorMsg(errorMsg2);
      }
    }
  });
}

function startGetStatus(){
  getStartDate();
  getStatus();
  $('#requestId').text(requestId);
  $('#status').text("waiting");
  $('#waitMessage').text(message1);
  startInterval();
}

function getRequestErrorFunction(errorMsg){
  sessionStorage.removeItem("startDate");
  setErrorMsg(errorMsg);
}

function setErrorMsg(errorMsg){
  removeSearchInfoTbl();
  $('#response').text(errorMsg);
}

function removeSearchInfoTbl(){
  if($('#searchInfo').length){
    var dom_obj = document.getElementById("searchInfo");
    var dom_obj_parent = dom_obj.parentNode;
    dom_obj_parent.removeChild(dom_obj);
  }
}

function setProgram(){
  if(sessionStorage.getItem("") == null){
    program = replaceDecode(decodeURI('${program}'));
  }
  else{
    program = sessionStorage.getItem("program");
  }
}

function setDatabase(){
  if(sessionStorage.getItem("database") == null){
    database = replaceDecode(decodeURI('${database}'));
  }
  else{
    database = sessionStorage.getItem("database");
  }
}


$(document).ready(function(){
  language_code2 = "${language_code2}";
  if("${querySequence}" == ""){
    setErrorMsg(errorMsg1);
  }
  else if("${division}" == ""){
    setErrorMsg(errorMsg1);
  }
  else{
    setProgram();
    setDatabase();
    setReportStr(database);

    if(sessionStorage.getItem("requestId") == null){
      post();
    }
    else{
      requestId = sessionStorage.getItem("requestId");
      if(sessionStorage.getItem("startDate") == null){
        removeSearchInfoTbl();
        getStatus();
      }
      else{
        startGetStatus();
      }
    }
  }

});
</script>
