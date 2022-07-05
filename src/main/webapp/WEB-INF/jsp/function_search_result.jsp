<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<script type="text/javascript" src="resources/js/blast-message.js"></script>
<script type="text/javascript" src="resources/js/blast-request-url.js"></script>
<script type="text/javascript" src="resources/js/blast-report-functions.js"></script>
<script type="text/javascript" src="resources/js/blast-search-time-functions.js"></script>
<script type="text/javascript">

blastUrl = "<%= jp.ac.nig.ddbj.blast.util.Conf.blastUrl %>"
var requestId = replaceDecode(decodeURI('${requestId}'));
var interval = 1000;
var tblparent;
var firstFlg = 1;
var querySequence = "";

function getUserRequest(){
  //var url = blastUrl + "blast/" + requestId + "?info=request";
  var url = blastUrl + "wabi/" + requestId + "?info=request";
  $.ajax({
    type: 'GET',
    url: url,
    cache: false,
    success: function(data){
      if(data.Message == undefined){
        //database = data.datasets;
        if(data.datasets != undefined){
          database = data.datasets;
        }
        else{
          setDatabase(data.program);
        }
        program = data.program;
        querySequence = data.querySequence;
        setReportStr(database);
        getStatus();
      }
      else if("illegal-arguments" == data.status){
        setErrorMsg(errorMsg4);
      }
      else{
        $('#response').text(errorMsg3);
      }
    },
    error: function(xmlreq, textStatus, errorThrown){
      if (404==xmlreq.status) {
        $('#response').text(errorMsg3);
      } else if (400==xmlreq.status) {
        $('#response').text(errorMsg4);
      } else if (400<=xmlreq.status && xmlreq.status<=499) {
        $('#response').text(errorMsg1);
      } else {
        $('#response').text(errorMsg2);
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
    cache: false,
    success: function(data){
      if(data.status == "finished"){
        if(firstFlg == 0){
          $('#status').text(data.status);
        }
        getResult();
      }
      else if(data.status == "not-found") {
        $('#response').text(errorMsg3);
      }
      else if(data.status == "illegal-arguments") {
        $('#response').text(errorMsg4);
      }
      else {
        if(firstFlg == 1){
          $('#response').text("");
          $('div#content').prepend(tblparent);
          setStartDate(createStartDate(requestId));
          $('#requestId').text(requestId);
          $('#waitMessage').text(message1);
          startInterval();
          firstFlg = 0;
        }
        $('#status').text(data.status);
        setTimeout("getStatus()", interval);
      }
    },
    error: function(xmlreq, textStatus, errorThrown){
      if (404==xmlreq.status) {
        $('#response').text(errorMsg3);
      } else if (400==xmlreq.status) {
        $('#response').text(errorMsg4);
      } else if (400<=xmlreq.status && xmlreq.status<=499) {
        $('#response').text(errorMsg1);
      } else {
        $('#response').text(errorMsg2);
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
      if("illegal-arguments" == data.status){
        setErrorMsg(errorMsg4);
      } else {
        getBlastImage(data);
        stopInterval();
        $("table").remove("#searchInfo");
        blastReport(data);
      }
    },
    error: function(xmlreq, textStatus, errorThrown){
      if (404==xmlreq.status) {
        $('#response').text(errorMsg3);
      } else if (400==xmlreq.status) {
        $('#response').text(errorMsg4);
      } else if (400<=xmlreq.status && xmlreq.status<=499) {
        $('#response').text(errorMsg1);
      } else {
        $('#response').text(errorMsg2);
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
        $('#response').text(errorMsg3);
      } else if (400==xmlreq.status) {
        $('#response').text(errorMsg4);
      } else if (400<=xmlreq.status && xmlreq.status<=499) {
        $('#response').text(errorMsg1);
      } else {
        $('#response').text(errorMsg2);
      }
    }
  });
}

function createStartDate(requestId){
  var requestIdArray = requestId.split("-");
  var year = requestIdArray[0].substring(requestIdArray[0].lastIndexOf("_") + 1);
  var month = requestIdArray[1].substring(0, 2);
  var day = requestIdArray[1].substring(2);
  var hh = requestIdArray[2].substring(0, 2);
  var mm = requestIdArray[2].substring(2);
  var ss = requestIdArray[3];

  var dateStr = year + "/" + month + "/" + day + " " + hh + ":" + mm + ":" + ss;

  return dateStr;
}

function setDatabase(program){
  switch(program){
    case "megablas":
    case "blastn":
    case "tblastn":
    case "tblastx":
      database = "ddbjall";
      break;
    case "blastp":
    case "blastx":
      database = "uniprot_all";
      break;
    default:
      break;
  }
}

$(document).ready(function(){

  language_code2 = "${language_code2}";
  //$("table").remove("#searchInfo");
  tblparent = $("table#searchInfo").detach();
  if(requestId == ""){
    $('#response').text(errorMsg1);
  }
  else {
    $('#response').text(message3);
    getUserRequest();
  }

});


</script>