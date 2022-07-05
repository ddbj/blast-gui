var database;
var program;
var language_code2;
var dataSets = {
      ddbjall: 'ddbj',
      ddbjnew: 'ddbj',
      uniprot_all: 'uniprot',
      uniprot_sprot: 'uniprot',
      uniprot_trembl: 'uniprot',
      '16S_rRNA': '16S',
      patent_protein: 'patent',
      dadall: 'dad',
      dadnew: 'dad',
      refseq_na: 'refseq',
      refseq_aa: 'refseq'
};
var scorePattern = {
      ddbj: /^[a-zA-Z]+[0-9]+\|/,
      uniprot: /^[a-zA-Z0-9]+\|[a-zA-Z0-9]+/,
      '16S': /^[a-zA-Z0-9]+_/,
      //patent: /^[a-zA-Z]+POP:[a-zA-Z0-9]/
      patent: /^[a-zA-Z]+:[a-zA-Z0-9]/,
      dad: /^[a-zA-Z]+[0-9]+-[0-9]+\|/,
      refseq: /^ref\|[a-zA-Z]+_[0-9]+\.[0-9]+\|/
};
var accessionPattern = {
      ddbj: /^>[a-zA-Z]+[0-9]+\|/,
      uniprot: /^>[a-zA-Z0-9]+\|[a-zA-Z0-9]+/,
      '16S': /^>[a-zA-Z0-9]+_/,
      //patent: /^>[a-zA-Z]+POP:[a-zA-Z0-9]/
      patent: /^>[a-zA-Z]+:[a-zA-Z0-9]/,
      dad: /^>[a-zA-Z]+[0-9]+-[0-9]+\|/,
      refseq: /^>ref\|[a-zA-Z]+_[0-9]+\.[0-9]+\|/
};
var clustalwType = {
      megablas: 'dna',
      blastn: 'dna',
      tblastn: 'dna',
      tblastx: 'dna',
      blastp: 'protein',
      blastx: 'protein'
};
var getentryDatabase = {
      ddbj: 'na',
      uniprot: 'uniprot',
      '16S': 'na',
      patent: 'patent_aa',
      dad: 'dad',
      refseq: 'refseq'
};
var patentNotGetentryPattern = ["USPOP", "EPOP"];
var defaultSeqHeader = ">Query_";
var scorePatternStr;
var accessionPatternStr;
var getentryUrl;

var anchorsAccessionNo = new Array();
var queryName = "";
var queryNameFlg = 0;
var scoreLineCnt = 0;
var query = [];
var accessionsQuery = "";
var accessions = new Array();
var checkedAccessionsQuery = [];
var checkedQuery = [];
var checkedQueryAll = [];

function blastReport(data){
  var dataCnt = 0;
  var Cnt1 = 0;
  var Cnt2 = 0;
  var headerFlg = 0;
  var outArray = new Array();
  var lines = data.split("\n");
  var headerLine = lineReplace(makeheaderPattern(lines[0]));
  var pos = 0;
  var str1 = "";
  var str2 = "";
  var str3 = "";
  var accessionNo = "";

  getAnchorsAccessionNo(data);

  outArray.push("<DIV>Request ID&nbsp&nbsp&nbsp" + requestId + "</DIV>");
  for(var i = 0; i < lines.length; i++){
    makeAccessionsQueryArray(lines[i]);
    lines[i] = lineReplace(lines[i]);

    if(lines[i].match(new RegExp(headerLine))){
      dataCnt = dataCnt + 1;
      Cnt1 = 0;
      Cnt2 = 0;
      headerFlg = 1;
      if(dataCnt > 1){
        outArray.push("<HR align=\"left\" >");
      }
    }
    if(lines[i].match(/^Query=&nbsp/)){
      switch(dataSets[database]){
        case "ddbj":
        case "uniprot":
        case "16S":
        case "patent":
        case "dad":
        case "refseq":
          outArray.push("<INPUT ID=\"openClustalW_" + dataCnt
                        + "\" TYPE=\"button\" VALUE=\"ClustalW\"><BR>");
          break;
        default:
          break;
      }
      var name = lines[i].replace(/Query=&nbsp/g, "");
      name = name.replace(/&nbsp/g, " ");
      lines[i] = "<INPUT ID=\"query_" + dataCnt + "\" TYPE=\"checkbox\" NAME=\"" + name
                 + "\" VALUE=\"\"  style=\"vertical-align: middle\" >" + "&nbsp<span id=\"queryTitle_" + dataCnt + "\">" + lines[i] + "</span>"
                 + "<script type=\"text/javascript\">"
                 + "$('#query_" + dataCnt + "').attr(\"name\", function(attr) { decodeURI(attr); });"
                 + "$('#queryTitle_" + dataCnt + "').text(decodeURI($('#queryTitle_" + dataCnt + "').text()));"
                 + "</script>";
    }

    if(lines[i].match(/Score&nbsp&nbsp&nbsp&nbspE/)){
      lines[i] = "&nbsp&nbsp&nbsp&nbsp" + lines[i];
    }

    if(lines[i].match(/^Sequences/)){
      pos = lines[i].indexOf("(");
      str1 = lines[i].substring(0, pos);
      str2 = lines[i].substring(pos);
      lines[i] = str1 + "&nbsp&nbsp&nbsp&nbsp" + str2;
    }

    if(lines[i].match(scorePatternStr)){
      var accessionStr = getAccessionNo(lines[i]);
      accessionNo = accessionStr;
      switch(dataSets[database]){
        case "uniprot":
          if(accessionNo.match(/-/)){
            accessionNo = accessionNo.substring(0, accessionNo.indexOf("-"));
          }
          break;
        case "16S":
          accessionNo = accessionNo.substring(0, accessionNo.indexOf("_"));
          break;
      }
      var checkboxStr = "<INPUT ID=\"score_" + dataCnt + "\" TYPE=\"checkbox\" NAME=\""
                        + accessionStr + "\" VALUE=\"" + accessionNo + "\"  style=\"vertical-align: middle\" >";

      if(lines[i].match(new RegExp(anchorsAccessionNo[dataCnt][Cnt1])) &&
           anchorsAccessionNo[dataCnt][Cnt1] != undefined){
        if(lines[i].match(/\.&nbsp&nbsp/)){
          pos = lines[i].lastIndexOf(".&nbsp&nbsp");
          str1 = lines[i].substring(0, pos + 1);
          str2 = lines[i].substring(pos + 1);
        }
        else{
          pos = lines[i].indexOf("&nbsp&nbsp&nbsp");
          str1 = lines[i].substring(0, pos);
          str2 = lines[i].substring(pos);
        }
        lines[i] = checkboxStr + "&nbsp" + "<a href=\"#" + accessionStr + "_"
                   + dataCnt + "\">" + str1 + "</a>" + str2;
        Cnt1 = Cnt1 + 1;
      }
      else{
        lines[i] = checkboxStr + "&nbsp" + lines[i];
      }
    }

    if(lines[i].match(accessionPatternStr)){

      if(lines[i].match(new RegExp(anchorsAccessionNo[dataCnt][Cnt2])) &&
          anchorsAccessionNo[dataCnt][Cnt2] != undefined){
        lines[i] = "<a name=\"" + getAccessionNo(lines[i]) + "_"
                   + dataCnt + "\"></a>" + lines[i];
        Cnt2 = Cnt2 + 1;
      }

      switch(dataSets[database]){
        case "ddbj":
          line = lines[i].split("|");
          str1 = line[0].substring(0, line[0].lastIndexOf(">") + 1);
          str2 = line[0].substring(line[0].lastIndexOf(">") + 1);
          lines[i] = str1 + "<a href=\"" + getentryUrl + str2
                     + "\" target=\"_blank\" >" + str2 + "</a>|" + line[1];
          break;
        case "uniprot":
          line = lines[i].split("|");
          if(line[1].match(/-/)){
            str1 = line[1].substring(0, line[1].indexOf("-"));
            str2 = line[1].substring(line[1].indexOf("-"));
            lines[i] = line[0] + "|" + "<a href=\"" + getentryUrl + str1
                       + "\" target=\"_blank\" >" + str1 + "</a>" + str2 + "|" + line[2];
          }
          else{
            lines[i] = line[0] + "|" + "<a href=\"" + getentryUrl + line[1]
                       + "\" target=\"_blank\" >" + line[1] + "</a>|" + line[2];
          }
          break;
        case "16S":
          line = lines[i].split("|");
          str1 = line[0].substring(0, line[0].lastIndexOf(">") + 1);
          str2 = line[0].substring(line[0].lastIndexOf(">") + 1, line[0].lastIndexOf("_"));
          str3 = line[0].substring(line[0].lastIndexOf("_"));
          lines[i] = str1 + "<a href=\"" + getentryUrl + str2
                     + "\" target=\"_blank\" >" + str2 + "</a>" + str3 + "|" + line[1] + "|" + line[2];
          break;
        case "patent":
          var matchFlg = 0;
          var j;
          for(j = 0; j < patentNotGetentryPattern.length; j++){
            if(lines[i].match(patentNotGetentryPattern[j])){
              matchFlg = 1;
            }
          }
          if(matchFlg == 0){
            line = lines[i].split("&nbsp");
            str1 = line[0].substring(0, line[0].lastIndexOf(":") + 1);
            str2 = line[0].substring(line[0].lastIndexOf(":") + 1);
            str3 = "&nbsp";
            for(j = 1; j < line.length; j++){
              str3 = str3 + line[j] + "&nbsp";
            }
            lines[i] = str1 + "<a href=\"" + getentryUrl + str2 + "\" target=\"_blank\" >" + str2 + "</a>" + str3;
          }
          break;
        case "dad":
          line = lines[i].split("|");
          str1 = line[0];
          str2 = line[1];
          str3 = lines[i].substring(str1.length + str2.length + 2);
          lines[i] = str1 + "|<a href=\"" + getentryUrl + str2
                     + "\" target=\"_blank\" >" + str2 + "</a>|" + str3;
          break;
        case "refseq":
          break;
        default:
          break;
      }

      if(headerFlg == 1){
        switch(dataSets[database]){
          case "ddbj":
          case "uniprot":
          case "16S":
          case "patent":
          case "dad":
            outArray.push("<INPUT ID=\"openClustalW_" + dataCnt
                          + "\" TYPE=\"button\" VALUE=\"ClustalW\">&nbsp<INPUT ID=\"openGetentry_"
                          + dataCnt + "\" TYPE=\"button\" VALUE=\"getentry\"><BR>");
            break;
          case "refseq":
            outArray.push("<INPUT ID=\"openClustalW_" + dataCnt
                          + "\" TYPE=\"button\" VALUE=\"ClustalW\"><BR>");
            break;
          default:
            break;
        }

        outArray.push("<img ID=\"image\" border=\"0\" src=\"" + "resources/temp/"
                      + requestId + "_" + dataCnt + ".png\" ><BR>");
        headerFlg = 0;
      }

    }
    outArray.push(lines[i]);
  }
  accessionsQuery = query.join("\n");

  for(var i=1; i <= dataCnt; i++){
    checkedAccessionsQuery[i] = "";
    checkedQuery[i] = "";
    checkedQueryAll[i] = "";
    queryCheckFunction(i);
    scoreCheckFunction(i);
    openClustalwFunction(i);
    openGetentryFunction(i);
    accessions[i] = [];
  }

  $('#response').html(outArray.join("<BR>"));

}

function getAnchorsAccessionNo(data){
  var lines = data.split("\n");
  var headerLine = makeheaderPattern(lines[0]);
  var AccessionNo = [];
  var cnt = 0;
  var datacnt = 0;

  for(var i = 0; i < lines.length; i++){
    if(lines[i].match(new RegExp(headerLine))){
      datacnt = datacnt + 1;
      cnt = 0;
      anchorsAccessionNo[datacnt] = [];
      AccessionNo = [];
    }
    if(lines[i].match(scorePatternStr)){
      AccessionNo.push(getAccessionNo(lines[i]));
    }
    if(lines[i].match(accessionPatternStr) &&
        lines[i].match(new RegExp(AccessionNo[cnt]))){
      anchorsAccessionNo[datacnt].push(AccessionNo[cnt]);
      cnt = cnt + 1;
    }
  }
}

function getAccessionNo(line){
  var accessionNo = "";
  lineArray = line.split("|");

  switch(dataSets[database]){
    case "ddbj":
      if(line.match(/>/)){
        accessionNo = lineArray[0].substring(1);
      }
      else{
        accessionNo = lineArray[0];
      }
      break;
    case "uniprot":
      accessionNo = lineArray[1];
      break;
    case "16S":
      if(line.match(/>/)){
        //accessionNo = lineArray[0].substring(1, lineArray[0].indexOf("_"));
        accessionNo = lineArray[0].substring(1);
      }
      else{
        //accessionNo = lineArray[0].substring(0, lineArray[0].indexOf("_"));
        accessionNo = lineArray[0];
      }
      break;
    case "patent":
      if(line.match(/&nbsp/)){
        lineArray = line.split("&nbsp");
      }
      else{
        lineArray = line.split(" ");
      }
      accessionNo = lineArray[0].substring(lineArray[0].indexOf(":") + 1);
      break;
    case "dad":
      accessionNo = lineArray[1];
      break;
    case "refseq":
      accessionNo = lineArray[1];
      break;
    default:
      break;
  }
  return accessionNo;
}

function makeAccessionsQueryArray(line){
  if(line.match(accessionPatternStr)){
    queryNameFlg = 1;
    scoreLineCnt = 0;
  }
  if(line.match(/Length =/)){
    queryNameFlg = 0;
    query.push(queryName.replace(/^ /, ""));
    queryName = "";
  }
  if(line.match(/Score =/)){
    scoreLineCnt++;
  }
  if(queryNameFlg == 1){
    queryNameStr = line;
    queryNameStr = queryNameStr.replace(/^ +/, "");
    queryName = queryName + " " + queryNameStr;
  }
  if(line.match(/^Sbjct:/) && scoreLineCnt == 1){
    var queryStr = line;
    queryStr = queryStr.replace(/^Sbjct: [0-9]+ +/, "");
    queryStr = queryStr.replace(/ [0-9]+/, "");
    queryStr = queryStr.replace(/[^a-zA-Z]/g, "");
    query.push(queryStr);
  }
}

function makeheaderPattern(line){
  var headerPattern = "";
  if(program == "megablast"){
    headerPattern = "Query=";
  }
  else{
    headerPattern = line.substring(0, line.indexOf("\[") - 1);
  }
  return headerPattern;
}

function lineReplace(reportLine){
  var strLine = reportLine;
  strLine = strLine.replace(/ /g, "&nbsp");

  return strLine;
}

function replaceDecode(reportLine){
  var strLine = reportLine;

  strLine = strLine.replace(/%23/g, "#");
  strLine = strLine.replace(/%24/g, "$");
  strLine = strLine.replace(/%26/g, "&");
  strLine = strLine.replace(/%2B/g, "+");
  strLine = strLine.replace(/%2C/g, ",");
  strLine = strLine.replace(/%2F/g, "/");
  strLine = strLine.replace(/%3A/g, ":");
  strLine = strLine.replace(/%3B/g, ";");
  strLine = strLine.replace(/%3D/g, "=");
  strLine = strLine.replace(/%3F/g, "?");
  strLine = strLine.replace(/%40/g, "@");

  return strLine;
}

function queryCheckFunction(dataCnt){
  $('#query_'+ dataCnt).live('click', function(){
    checkedQueryAll[dataCnt] = "";
    checkedQuery[dataCnt] = "";

    if(this.checked) {
      var queryName = $(this).attr('name');

      var startPos = querySequence.indexOf(">" + queryName);
      if(queryName == ""){
        startPos = 0;
      }
      var endPos = querySequence.indexOf(">", startPos + 1) - 1;

      if(endPos > 0){
        checkedQuery[dataCnt] = querySequence.substring(startPos, endPos);
      }
      else if(endPos < 0){
        checkedQuery[dataCnt] = querySequence.substring(startPos).slice(0, -1);
      }

      if(queryName == ""){
        var header = defaultSeqHeader + dataCnt + "|" + requestId;
        checkedQuery[dataCnt] = header + "\n" + checkedQuery[dataCnt];
      }
    }
    checkedQueryAll[dataCnt] = checkedQuery[dataCnt] + checkedAccessionsQuery[dataCnt];
  });
}

function scoreCheckFunction(dataCnt){
  $('#score_' + dataCnt).live('click', function(){
    checkedQueryAll[dataCnt] = "";
    checkedAccessionsQuery[dataCnt] = "";
    accessions[dataCnt] = [];
    var accessionsName = [];
    $('input[id=score_' + dataCnt + ']:checked').each(function(){
      accessions[dataCnt].push($(this).attr('value'));
      accessionsName.push($(this).attr('name'));
    });

    for(var i = 0; i < accessionsName.length; i++){
      var startPos;
      switch(dataSets[database]){
        case "ddbj":
        case "16S":
          startPos = accessionsQuery.indexOf(">" + accessionsName[i]);
          break;
        case "uniprot":
          startPos = accessionsQuery.indexOf("|" + accessionsName[i] + "|") - 3;
          break;
        case "patent":
          startPos = accessionsQuery.indexOf(":" + accessionsName[i]);
          while(accessionsQuery.substring(startPos, startPos + 1) != ">"){
            startPos = startPos - 1;
          }
          break;
        case "dad":
        case "refseq":
          var tmpPos = accessionsQuery.indexOf("|" + accessionsName[i] + "|");
          startPos = accessionsQuery.substring(0, tmpPos).lastIndexOf(">");
          break;
        default:
          startPos = accessionsQuery.indexOf(">" + accessionsName[i]);
          break;
      }
      var endPos = accessionsQuery.indexOf(">", startPos + 1) - 1;

      if(startPos == 0 && endPos > 0){
        checkedAccessionsQuery[dataCnt] = "\n" + accessionsQuery.substring(startPos, endPos);
      }
      else if(startPos == 0 && endPos < 0){
        checkedAccessionsQuery[dataCnt] = "\n" + accessionsQuery.substring(startPos);
      }
      else if(startPos > 0 && endPos > 0){
        checkedAccessionsQuery[dataCnt] = checkedAccessionsQuery[dataCnt] + "\n"
                                        + accessionsQuery.substring(startPos, endPos);
      }
      else if(startPos > 0 && endPos < 0){
        checkedAccessionsQuery[dataCnt] = checkedAccessionsQuery[dataCnt] + "\n"
                                        + accessionsQuery.substring(startPos);
      }
    }
    checkedQueryAll[dataCnt] = checkedQuery[dataCnt] + checkedAccessionsQuery[dataCnt];
  });
}

function openClustalwFunction(dataCnt){
  $('#openClustalW_' + dataCnt).live('click', function(){
    window.open("", "clustalW");
    var form = document.createElement("form");
    form.action = clustalwUrl;
    form.target = "clustalW";
    form.method = 'post';

    var hiddens = [{type:'hidden', name:'lang', value:language_code2},
                   {type:'hidden', name:'seq', value:checkedQueryAll[dataCnt]},
                   {type:'hidden', name:'type', value:clustalwType[program]}];

    for(var i = 0; i < hiddens.length; i++) {
      var hidden = hiddens[i];
      var input = document.createElement("input");
      for(var p in hidden){
        input.setAttribute(p, hidden[p]);
      }
      form.appendChild(input);
    }

    var body = document.getElementsByTagName("body")[0];
    body.appendChild(form);
    form.submit();
    body.removeChild(form);
  });
}

function openGetentryFunction(dataCnt){
  var accessionNo = "";
  $('#openGetentry_' + dataCnt).live('click', function(){
    accessionNo = accessions[dataCnt].join(",");
    window.open("", "getentry");
    var form = document.createElement("form");
    form.action = getentryUrl + accessionNo;
    form.target = "getentry";
    form.method = 'post';

    var body = document.getElementsByTagName("body")[0];
    body.appendChild(form);
    form.submit();
    body.removeChild(form);
  });
}

function setReportStr(database){
  scorePatternStr = scorePattern[dataSets[database]];
  accessionPatternStr = accessionPattern[dataSets[database]];
  getentryUrl = getentry + getentryDatabase[dataSets[database]] + "/";
}
