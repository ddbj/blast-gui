package jp.ac.nig.ddbj.blast.search;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.URLEncoder;


public class BlastSearchInfo {

	String characterEncoding = "UTF-8";

	public String inputStreemToString(InputStream in) throws IOException {
		BufferedReader reader = new BufferedReader(new InputStreamReader(in, characterEncoding));
		StringBuffer buf = new StringBuffer();
		String str;
		while ((str = reader.readLine()) != null) {
			if(str.startsWith(">")){
				buf.append(URLEncoder.encode(str, characterEncoding).replaceAll("\\+", " "));
			}
			else{
				buf.append(URLEncoder.encode(str, characterEncoding));
			}
			buf.append("\\n");
		}
		reader.close();
		return buf.toString();
	}

	public String replaceQseq(String in) throws IOException {
		StringReader strReader = new StringReader(in);
		BufferedReader bufReader = new BufferedReader(strReader);
		StringBuffer buf = new StringBuffer();
		String str;
		while((str = bufReader.readLine()) != null){
			if(str.startsWith(">")){
				buf.append(URLEncoder.encode(str, characterEncoding).replaceAll("\\+", " "));
			}
			else{
				buf.append(URLEncoder.encode(str, characterEncoding));
			}
			buf.append("\\n");
		}
		bufReader.close();
		return buf.toString();
	}

	public String replaceOnelineText(String in) throws IOException {
		return (null==in || in.isEmpty()) ? in : URLEncoder.encode(in, characterEncoding).replaceAll("\\+", " ");
	}

	public String makeScoresParam(String score){
		if(score == null || "".equals(score)){
			return " -v 100";
		}
		else{
			return " -v " + score;
		}
	}
	
	public String makeAlignmentsParam(String alignments){
		if(alignments == null || "".equals(alignments)){
			return " -b 100";
		}
		else{
			return " -b " + alignments;
		}
	}

	public String makeExpectParam(String expect){
		if(expect == null || "".equals(expect)){
			return " -e 10";
		}
		else{
			return " -e " + expect;
		}
	}

	public String makeWordsizeParam(String program, String wordsize){
		if(wordsize == null || "".equals(wordsize)){
			if("megablast".equals(program)){
				return " -W 28";
			}
			else if("blastn".equals(program)){
				return " -W 11";
			}
			else{
				return " -W 3";
			}
		}
		else{
			return " -W " + wordsize;
		}
	}

}
