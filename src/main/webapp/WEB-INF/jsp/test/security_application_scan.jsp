<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html dir="ltr" lang="ja">
<head>
<meta charset="UTF-8" />
<title><tiles:insertAttribute name="title" ignore="true" /></title>
<style type="text/css">
div {
  border-style: solid;
  border-width: 1px;
  border-color: black;
  background-color: khaki;
  margin: 10px;
}
</style>
</head>

<body>

<div>
  <form action="/blast/report" method="post" enctype="multipart/form-data">
    <ul>
      <li><input type="text" size="100" name="language_code"  value="e"      > language_code  </li>
      <li><input type="text" size="100" name="language_code2" value="en"     > language_code2 </li>
      <li><input type="text" size="100" name="result"         value="www"    > result         </li>
      <li><input type="text" size="100" name="address"        value=""       > address        </li>
      <li><input type="text" size="100" name="program"        value="blastn" > program        </li>
      <li><input type="text" size="100" name="database"       value="ddbjall"> database       </li>
      <li><input type="text" size="100" name="division"       value="hum"    > division       </li>
      <li><input type="text" size="100" name="score"          value="100"    > score          </li>
      <li><input type="text" size="100" name="alignments"     value="100"    > alignments     </li>
      <li><input type="text" size="100" name="expect"         value="10"     > expect         </li>
      <li><input type="text" size="100" name="filter"         value="F"      > filter         </li>
      <li><input type="text" size="100" name="wordsize"       value="11"     > wordsize       </li>
      <li><textarea name="qseq" rows="5" cols="100">
>my query sequence 1
CACCCTCTCTTCACTGGAAAGGACACCATGAGCACGGAAAGCATGATCCAGGACGTGGAA
GCTGGCCGAGGAGGCGCTCCCCAGGAAGACAGCAGGGCCCCAGGGCTCCAGGCGGTGCTG
GTTCCTCAGCCTCTTCTCCTTCCTGCTCGTGGCAGGCGCCGCCAC</textarea> qseq </li>
      <li><input type="file" name="up_file"> up_file </li>
    </ul>
    <input type="submit">
  </form>
</div>

<div>
  <form action="/blast/report" method="post" enctype="multipart/form-data">
    <ul>
      <li><input type="text" size="100" name="language_code"  value="e"      > language_code  </li>
      <li><input type="text" size="100" name="language_code2" value="en"     > language_code2 </li>
      <li><input type="text" size="100" name="result"         value="www"    > result         </li>
      <li><input type="text" size="100" name="address"        value=""       > address        </li>
      <li><input type="text" size="100" name="program"        value="blastn" > program        </li>
      <li><input type="text" size="100" name="database"       value="ddbjall"> database       </li>
      <li><input type="text" size="100" name="division"       value="hum"    > division       </li>
      <li><input type="text" size="100" name="score"          value="100"    > score          </li>
      <li><input type="text" size="100" name="alignments"     value="100"    > alignments     </li>
      <li><input type="text" size="100" name="expect"         value="10"     > expect         </li>
      <li><input type="text" size="100" name="filter"         value="F"      > filter         </li>
      <li><input type="text" size="100" name="wordsize"       value="11"     > wordsize       </li>
      <li><textarea name="qseq" rows="5" cols="100">
>my query sequence 1
CACCCTCTCTTCACTGGAAAGGACACCATGAGCACGGAAAGCATGATCCAGGACGTGGAA
GCTGGCCGAGGAGGCGCTCCCCAGGAAGACAGCAGGGCCCCAGGGCTCCAGGCGGTGCTG
GTTCCTCAGCCTCTTCTCCTTCCTGCTCGTGGCAGGCGCCGCCAC</textarea></li>
      <li><input type="file" name="up_file"> up_file </li>
      <li><input type="text" size="100" name="up_fileContent" value="" > up_fileContent </li>
    </ul>
    <input type="submit">
  </form>
</div>

<div>
  <form action="/blast/report" method="post" enctype="multipart/form-data">
    <ul>
      <li><input type="text" size="100" name="language_code"  value="e"      > language_code  </li>
      <li><input type="text" size="100" name="language_code2" value="en"     > language_code2 </li>
      <li><input type="text" size="100" name="result"         value="www"    > result         </li>
      <li><input type="text" size="100" name="address"        value=""       > address        </li>
      <li><input type="text" size="100" name="program"        value="blastp" > program        </li>
      <li><input type="text" size="100" name="database"       value="ddbjall"> database       </li>
      <li><input type="text" size="100" name="division"       value="hum"    > division       </li>
      <li><input type="text" size="100" name="score"          value="100"    > score          </li>
      <li><input type="text" size="100" name="alignments"     value="100"    > alignments     </li>
      <li><input type="text" size="100" name="expect"         value="10"     > expect         </li>
      <li><input type="text" size="100" name="filter"         value="F"      > filter         </li>
      <li><input type="text" size="100" name="wordsize"       value="11"     > wordsize       </li>
      <li><textarea name="qseq" rows="5" cols="100">
>my query sequence 1
CACCCTCTCTTCACTGGAAAGGACACCATGAGCACGGAAAGCATGATCCAGGACGTGGAA
GCTGGCCGAGGAGGCGCTCCCCAGGAAGACAGCAGGGCCCCAGGGCTCCAGGCGGTGCTG
GTTCCTCAGCCTCTTCTCCTTCCTGCTCGTGGCAGGCGCCGCCAC</textarea></li>
      <li><input type="file" name="up_file"> up_file </li>
      <li><input type="text" size="100" name="matrix" value="" > matrix </li>
    </ul>
    <input type="submit">
  </form>
</div>

<div>
  <form action="/blast/result" method="post">
    <ul>
      <li><input type="text" size="100" name="language_code"  value="e"      > language_code  </li>
      <li><input type="text" size="100" name="language_code2" value="en"     > language_code2 </li>
      <li><input type="text" size="100" name="program"        value=""       > program        </li>
      <li><input type="text" size="100" name="id"             value=""       > id             </li>
    </ul>
    <input type="submit">
  </form>
</div>

<div>
  <a href="/blast/blastn?lang=%00">/blast/blastn?lang=%00</a>
  <form action="/blast/blastn" method="get">
    <ul>
      <li><input type="text" name="lang"> lang </li>
    </ul>
    <input type="submit">
  </form>
</div>

<div>
  <a href="/blast/wabi/wabi_blast_2013-0614-1455-55-880-396147?info=&amp;_=1371189376609">/blast/wabi/wabi_blast_2013-0614-1455-55-880-396147?info=&amp;_=1371189376609</a>
  <form action="/blast/wabi/wabi_blast_2013-0614-1455-55-880-396147" method="get">
    <ul>
      <li><input type="text" size="100" name="info"> info </li>
    </ul>
    <input type="submit">
  </form>
  <form action="/blast/wabi/wabi_blast_2013-0614-1455-55-880-396147" method="get">
    <ul>
      <li><input type="text" size="100" name="info"> info </li>
      <li><input type="text" size="100" name="_"   value="1371189376609"> _ </li>
    </ul>
    <input type="submit">
  </form>
</div>

</body>
</html>
