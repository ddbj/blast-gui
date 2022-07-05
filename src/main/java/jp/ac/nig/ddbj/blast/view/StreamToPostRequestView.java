package jp.ac.nig.ddbj.blast.view;

import java.util.Map;

import jp.ac.nig.ddbj.blast.util.Conf;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.ResourceAccessException;
import org.springframework.web.servlet.view.AbstractView;

public class StreamToPostRequestView extends AbstractView {

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest req, HttpServletResponse res) throws Exception {

		String contentType = "application/json; charset=utf-8";
		String characterEncoding = "UTF-8";

		res.setContentType( contentType );
		if ( characterEncoding != null )
			res.setCharacterEncoding( characterEncoding );


		String wabiUrl = Conf.wabiApiUrl;

		MultiValueMap<String, Object> parts = new LinkedMultiValueMap<String, Object>();
		parts.add("querySequence", (String)model.get("querySequence"));
		parts.add("datasets", (String)model.get("datasets"));
		parts.add("database", (String)model.get("database"));
		parts.add("program", (String)model.get("program"));
		parts.add("parameters", (String)model.get("parameters"));
		parts.add("format", (String)model.get("format"));
		parts.add("result", (String)model.get("result"));
		parts.add("address", (String)model.get("address"));

		ServletOutputStream out = res.getOutputStream();
		try {
			RestTemplate rest = new RestTemplate();
			String result = rest.postForObject(wabiUrl, parts, String.class);

			res.setContentLength( result.getBytes().length );
			out.print(result);
		} catch (HttpClientErrorException e) {
			res.setStatus(e.getStatusCode().value());
		} catch (ResourceAccessException e) {
			res.setStatus(HttpServletResponse.SC_SERVICE_UNAVAILABLE);
		} catch (Exception e) {
			res.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
		}
		out.flush();
		out.close();
	}
}
