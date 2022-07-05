<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<h2 style="margin-top:1em;">Query</h2>
File Upload: <input type="file" name="up_file" maxlength="0" /><br />
&nbsp;or COPY & PASTE:<br />
<textarea name="qseq" cols=80 rows=10></textarea>
<br />
<br />
<input type=radio name="result" value="www" checked /> WWW
<br />
<input type=radio name="result" value="mail" /> E-Mail <INPUT type=text SIZE=30 name="address" value="" />
<br />
<br />
<input id="send_to_blast" type="submit" value="Send to BLAST" />
<input id="query_clear" type="button" value="Clear" />
<br />
<br />
