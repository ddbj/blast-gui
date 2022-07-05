package jp.ac.nig.ddbj.blast.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import jp.ac.nig.ddbj.blast.request.BlastRequest;
import jp.ac.nig.ddbj.blast.search.BlastSearchInfo;
import jp.ac.nig.ddbj.blast.util.Conf;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class BlastWebPageController {

	public static final Map<String,String> blastDatabaseGroup = new HashMap<String,String>();

	private static Pattern patternPermittedRemoteAddrTestSecurityApplicationScanPage = Pattern.compile(Conf.patternPermittedRemoteAddrTestSecurityApplicationScanPage);

	/**
	 * HTTP 404 Not Found を通知する用途
	 */
	private static class NotFoundException extends Exception {
		// Note: とくに実装なし。
	}

	/**
	 * HTTP 400 Bad Request を通知する用途
	 */
	private static class BadRequestException extends Exception {
		// Note: とくに実装なし。
	}

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		/*
		 * Note: 脆弱性対策
		 * 不正なパラメータを指定された時に HTTP 500 エラーになっていたので、
		 * それを回避するために、有効なパラメータ名を列挙して指定しておく。
		 */
		binder.setAllowedFields("lang",
								"language_code", "language_code2", "up_file", "qseq", "result", "address", "program", "database", "division", "score", "alignments", "expect", "filter", "matrix", "wordsize",
								"querySequence", "datasets", "database", "program", "parameters", "format", "result", "address",
								"id", "format", "imageId", "info", "id", "language_code", "language_code2", "id");
	}

	public BlastWebPageController() {
		blastDatabaseGroup.put("ddbjall", "ddbj");
		blastDatabaseGroup.put("ddbjnew", "ddbj");
		blastDatabaseGroup.put("uniprot_all", "uniprot");
		blastDatabaseGroup.put("uniprot_sprot", "uniprot");
		blastDatabaseGroup.put("uniprot_trembl", "uniprot");
		blastDatabaseGroup.put("16S_rRNA", "16S");
		blastDatabaseGroup.put("patent_protein", "patent");
	}

	@RequestMapping(value={"/blastn", "/"})
	public ModelAndView showBlastNPage(@RequestParam(value="lang",defaultValue="en")  String lang, ModelMap model) {
		if (lang.equals("ja")) {
			model.addAttribute("program_title", "blastn (クエリー：塩基配列, 検索対象:塩基配列)");

			model.addAttribute("language_chooser_label", "English");
			model.addAttribute("language_chooser_url", "blastn?lang=en");

			// http://www.ddbj.nig.ac.jp/index-j.html などの"j"の部分。
			model.addAttribute("language_code", "j");
			model.addAttribute("language_code2", "ja");
		}
		else {
			model.addAttribute("program_title", "blastn (Query: DNA vs. Target: DNA)");
			model.addAttribute("language_chooser_label", "Japanese");
			model.addAttribute("language_chooser_url", "blastn?lang=ja");

			model.addAttribute("language_code", "e");
			model.addAttribute("language_code2", "en");
		}

		model.addAttribute("word_size", 11);
		model.addAttribute("program", "blastn");

		return new ModelAndView("blastn", model);
	}

	@RequestMapping(value="/megablast")
	public ModelAndView showMegablastPage(@RequestParam(value="lang",defaultValue="en")  String lang, ModelMap model) {
		if (lang.equals("ja")) {
			model.addAttribute("program_title", "megablast (クエリー：塩基配列, 検索対象:塩基配列)");
			model.addAttribute("language_chooser_label", "English");
			model.addAttribute("language_chooser_url", "megablast?lang=en");

			// http://www.ddbj.nig.ac.jp/index-j.html などの"j"の部分。
			model.addAttribute("language_code", "j");
			model.addAttribute("language_code2", "ja");
		}
		else {
			model.addAttribute("program_title", "megablast (Query: DNA vs. Taget: DNA)");
			model.addAttribute("language_chooser_label", "Japanese");
			model.addAttribute("language_chooser_url", "megablast?lang=ja");

			model.addAttribute("language_code", "e");
			model.addAttribute("language_code2", "en");

		}
		model.addAttribute("word_size", 28);
		model.addAttribute("program", "megablast");

		return new ModelAndView("megablast", model);
	}


	@RequestMapping(value="/tblastn")
	public ModelAndView showTBlastNPage(@RequestParam(value="lang",defaultValue="en")  String lang, ModelMap model) {
		if (lang.equals("ja")) {
			model.addAttribute("program_title", "tblastn (クエリ:アミノ酸配列,検索対象:塩基配列*) *:アミノ酸配列に翻訳");
			model.addAttribute("language_chooser_label", "English");
			model.addAttribute("language_chooser_url", "tblastn?lang=en");

			// http://www.ddbj.nig.ac.jp/index-j.html などの"j"の部分。
			model.addAttribute("language_code", "j");
			model.addAttribute("language_code2", "ja");

		}
		else {
			model.addAttribute("program_title", "tblastn (Query: Protein vs. Target: DNA*) *:translated into Protein");
			model.addAttribute("language_chooser_label", "Japanese");
			model.addAttribute("language_chooser_url", "tblastn?lang=ja");

			model.addAttribute("language_code", "e");
			model.addAttribute("language_code2", "en");
		}
		model.addAttribute("word_size", 3);
		model.addAttribute("program", "tblastn");

		return new ModelAndView("tblastn", model);
	}


	@RequestMapping(value="/tblastx")
	public ModelAndView showTBlastXPage(@RequestParam(value="lang",defaultValue="en")  String lang, ModelMap model) {
		if (lang.equals("ja")) {
			model.addAttribute("program_title", "tblastx (クエリ:塩基配列*,検索対象:塩基配列*) *:アミノ酸配列に翻訳");
			model.addAttribute("language_chooser_label", "English");
			model.addAttribute("language_chooser_url", "tblastx?lang=en");

			// http://www.ddbj.nig.ac.jp/index-j.html などの"j"の部分。
			model.addAttribute("language_code", "j");
			model.addAttribute("language_code2", "ja");


		}
		else {
			model.addAttribute("program_title", "tblastx (Query: DNA* vs. Target: DNA*) *:translated into Protein");
			model.addAttribute("language_chooser_label", "Japanese");
			model.addAttribute("language_chooser_url", "tblastx?lang=ja");

			model.addAttribute("language_code", "e");
			model.addAttribute("language_code2", "en");
		}
		model.addAttribute("word_size", 3);
		model.addAttribute("program", "tblastx");

		return new ModelAndView("tblastx", model);
	}


	@RequestMapping(value="/blastp")
	public ModelAndView showBlastPPage(@RequestParam(value="lang",defaultValue="en")  String lang, ModelMap model) {
		if (lang.equals("ja")) {
			model.addAttribute("program_title", "blastp (クエリ:アミノ酸配列,検索対象:アミノ酸配列)");
			model.addAttribute("language_chooser_label", "English");
			model.addAttribute("language_chooser_url", "blastp?lang=en");

			// http://www.ddbj.nig.ac.jp/index-j.html などの"j"の部分。
			model.addAttribute("language_code", "j");
			model.addAttribute("language_code2", "ja");

		}
		else {
			model.addAttribute("program_title", "blastp (Query: Protein vs. Target: Protein)");
			model.addAttribute("language_chooser_label", "Japanese");
			model.addAttribute("language_chooser_url", "blastp?lang=ja");

			model.addAttribute("language_code", "e");
			model.addAttribute("language_code2", "en");
		}
		model.addAttribute("word_size", 3);
		model.addAttribute("program", "blastp");

		return new ModelAndView("blastp", model);
	}


	@RequestMapping(value="/blastx")
	public ModelAndView showBlastXPage(@RequestParam(value="lang",defaultValue="en")  String lang, ModelMap model) {
		if (lang.equals("ja")) {
			model.addAttribute("program_title", "blastx (クエリ:塩基配列*,検索対象:アミノ酸配列) *:アミノ酸配列に翻訳");
			model.addAttribute("language_chooser_label", "English");
			model.addAttribute("language_chooser_url", "blastx?lang=en");

			// http://www.ddbj.nig.ac.jp/index-j.html などの"j"の部分。
			model.addAttribute("language_code", "j");
			model.addAttribute("language_code2", "ja");

		}
		else {
			model.addAttribute("program_title", "blastx (Query: DNA* vs. Target: Protein) *:translated into Protein");
			model.addAttribute("language_chooser_label", "Japanese");
			model.addAttribute("language_chooser_url", "blastx?lang=ja");

			model.addAttribute("language_code", "e");
			model.addAttribute("language_code2", "en");
		}
		model.addAttribute("word_size", 3);
		model.addAttribute("program", "blastx");

		return new ModelAndView("blastx", model);
	}


	@RequestMapping(value="/viewer")
	public ModelAndView showSearchPage(@RequestParam(value="lang",defaultValue="en")  String lang, ModelMap model) {
		if (lang.equals("ja")) {
			model.addAttribute("program_title", "Result viewer");
			model.addAttribute("language_chooser_label", "English");
			model.addAttribute("language_chooser_url", "viewer?lang=en");

			// http://www.ddbj.nig.ac.jp/index-j.html などの"j"の部分。
			model.addAttribute("language_code", "j");
			model.addAttribute("language_code2", "ja");

		}
		else {
			model.addAttribute("program_title", "Result viewer");
			model.addAttribute("language_chooser_label", "Japanese");
			model.addAttribute("language_chooser_url", "viewer?lang=ja");

			model.addAttribute("language_code", "e");
			model.addAttribute("language_code2", "en");
		}

		return new ModelAndView("blast_viewer", model);
	}


	@RequestMapping(value="/report", method=RequestMethod.POST)
	//public ModelAndView showReportPage(@ModelAttribute BlastRequest request) {
	public ModelAndView showReportPage(
		@RequestParam("language_code") String language_code,
		@RequestParam("language_code2") String language_code2,
		@RequestParam("up_file") MultipartFile file,
		@RequestParam("qseq") String qseq,
		@RequestParam("result") String result,
		@RequestParam("address") String address,
		@RequestParam("program") String program,
		@RequestParam("database") String database,
		@RequestParam(value="division", required=false) String division,
		@RequestParam("score") String score,
		@RequestParam("alignments") String alignments,
		@RequestParam("expect") String expect,
		@RequestParam("filter") String filter,
		@RequestParam(value="matrix", required=false) String matrix,
		@RequestParam("wordsize") String wordsize) throws IOException {
		//@RequestParam("wordsize") String wordsize,
		//@RequestParam("options") String options) throws IOException {

		BlastSearchInfo searchInfo = new BlastSearchInfo();
		ModelMap model = new ModelMap();
		//model.addAttribute("querySequence", request.getQuerySequence());
		//model.addAttribute("database", request.getDatabase());
		//model.addAttribute("program", request.getProgram());
		//model.addAttribute("parameters", request.getParameters());
		//model.addAttribute("format", request.getFormat());

		//set language_code
		if (!("j".equals(language_code) ||
			  "e".equals(language_code))) {
			language_code = "e";
		}
		model.addAttribute("language_code", language_code);

		//set language_code2
		if (!("ja".equals(language_code2) ||
			  "en".equals(language_code2))) {
			language_code2 = "en";
		}
		model.addAttribute("language_code2", language_code2);

		//set querySequence
		String strFile = "";
		String strQseq = "";
		if(!file.isEmpty())
			strFile = searchInfo.inputStreemToString(file.getInputStream());
		if(!("".equals(qseq) || qseq == null))
			strQseq = searchInfo.replaceQseq(qseq);
		model.addAttribute("querySequence", strFile + strQseq);

		//set result
		model.addAttribute("result", searchInfo.replaceOnelineText(result));

		//set address
		if("".equals(address) || address == null){
			model.addAttribute("address", "");
		}
		else{
			model.addAttribute("address", searchInfo.replaceOnelineText(address));
		}

		//set database
		model.addAttribute("database", searchInfo.replaceOnelineText(database));

		//set division
		//if("uniprot".equals(blastDatabaseGroup.get(database))){
		if("uniprot".equals(blastDatabaseGroup.get(database)) || "16S".equals(blastDatabaseGroup.get(database))){
			model.addAttribute("division", searchInfo.replaceOnelineText(database));
		}
		//else if(division == null && !"uniprot".equals(blastDatabaseGroup.get(database))){
		else if(division == null
			&& (!"uniprot".equals(blastDatabaseGroup.get(database)) || !"16S".equals(blastDatabaseGroup.get(database)))){
			model.addAttribute("division", "");
		}
		else{
			String strDivision = division.replaceAll(",", " ");
			model.addAttribute("division", searchInfo.replaceOnelineText(strDivision));
		}

		//set program
		model.addAttribute("program", searchInfo.replaceOnelineText(program));

		//set parameters
		StringBuffer buf = new StringBuffer();
		buf.append(searchInfo.makeScoresParam(score));
		buf.append(searchInfo.makeAlignmentsParam(alignments));
		buf.append(searchInfo.makeExpectParam(expect));
		buf.append(" -F " + filter);
		if(!("megablast".equals(program) || "blastn".equals(program)))
			buf.append(" -M " + matrix);
		buf.append(searchInfo.makeWordsizeParam(program, wordsize));
		//if(!(options == null || "".equals(options)))
		//	buf.append(" " + options);
		model.addAttribute("parameters", searchInfo.replaceOnelineText(buf.toString()));

		//set format
		model.addAttribute("format", "json");

		//return new ModelAndView("blast_report", model);
		if("www".equals(result)){
			model.addAttribute("program_title", "Blast Report");
			return new ModelAndView("blast_report", model);
			//return new ModelAndView("blast_mail", model);
		}
		else{
			model.addAttribute("program_title", "Blast Mail");
			return new ModelAndView("blast_mail", model);
		}
	}

	//@RequestMapping(value="/blast", method=RequestMethod.POST)
        @RequestMapping(value="/wabi", method=RequestMethod.POST)
	public ModelAndView post(@ModelAttribute BlastRequest request) {

		ModelMap model = new ModelMap();

		model.addAttribute("querySequence", request.getQuerySequence());
		model.addAttribute("datasets", request.getDatasets());
		model.addAttribute("database", request.getDatabase());
		model.addAttribute("program", request.getProgram());
		model.addAttribute("parameters", request.getParameters());
		model.addAttribute("format", request.getFormat());
		model.addAttribute("result", request.getResult());
		model.addAttribute("address", request.getAddress());

		return new ModelAndView("blast_post", model);
	}

	//@RequestMapping(value="/blast/{id}", method=RequestMethod.GET)
	@RequestMapping(value="/wabi/{id}", method=RequestMethod.GET)
	public ModelAndView get(@PathVariable("id") String requestId,
			@RequestParam(value="format", defaultValue="text")  String format,
			@RequestParam(value="imageId", required=false) String imageId,
			@RequestParam(value="info", defaultValue="status")  String info) throws IOException, BadRequestException {

		ModelMap model = new ModelMap();
		String viewName = "";
		model.addAttribute("requestId", requestId);

		boolean invalidInfo = false;
		if (info.equals("status")) {
			viewName = "blast_status";
			model.addAttribute("format", format);
		}
		else if (info.equals("result")) {
			viewName = "blast_result";
			model.addAttribute("info", info);
		}
		else if (info.equals("request")) {
			viewName = "blast_request";
			model.addAttribute("info", info);
		}
		else {
			invalidInfo = true;
		}

		if (!("".equals(imageId) || imageId == null)){
			viewName = "blast_image";
			model.addAttribute("imageId", imageId);
			invalidInfo = false;
		}

		if (invalidInfo) {
			throw new BadRequestException();
		}

		return new ModelAndView(viewName, model);
	}

	@RequestMapping(value="/result", method=RequestMethod.POST)
	public ModelAndView showSearchPage(@RequestParam("id") String requestId,
			@RequestParam("language_code") String language_code,
			@RequestParam("language_code2") String language_code2) throws IOException {

		BlastSearchInfo searchInfo = new BlastSearchInfo();
		ModelMap model = new ModelMap();

		if (!("j".equals(language_code) ||
			  "e".equals(language_code))) {
			language_code = "e";
		}
		if (!("ja".equals(language_code2) ||
			  "en".equals(language_code2))) {
			language_code2 = "en";
		}

		model.addAttribute("program_title", "Blast Search");
		model.addAttribute("requestId", searchInfo.replaceOnelineText(requestId));
		model.addAttribute("language_code", language_code);
		model.addAttribute("language_code2", language_code2);

		return new ModelAndView("search_result", model);
	}

	@RequestMapping(value="/{id}")
	public ModelAndView showSearchPage(@PathVariable("id") String requestId) {

		ModelMap model = new ModelMap();

		model.addAttribute("program_title", "Blast Report for Result Viewer");
		model.addAttribute("requestId", requestId);
		model.addAttribute("language_code", "j");
		model.addAttribute("language_code2", "ja");

		return new ModelAndView("search_result", model);
	}

	@RequestMapping(value="/test/security_application_scan", method=RequestMethod.GET)
	public String showSecurityApplicationScanPage(HttpServletRequest req) throws NotFoundException {
		if (!patternPermittedRemoteAddrTestSecurityApplicationScanPage.matcher(req.getRemoteAddr()).matches()) {
			throw new NotFoundException();
		}
		return "test.security_application_scan";
	}

	@ExceptionHandler
	@ResponseBody
	@ResponseStatus(HttpStatus.NOT_FOUND)
	public String handlerException(NotFoundException e) {
		return "BLAST: The specified resource is not found.";
	}

	@ExceptionHandler
	@ResponseBody
	@ResponseStatus(HttpStatus.BAD_REQUEST)
	public String handlerException(BadRequestException e) {
		return "BLAST: The specified resource is not found.";
	}

}
