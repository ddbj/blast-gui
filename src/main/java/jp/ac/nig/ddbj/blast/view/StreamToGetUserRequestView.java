package jp.ac.nig.ddbj.blast.view;

import java.util.Map;

import jp.ac.nig.ddbj.blast.util.Conf;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.client.RestTemplate;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.ResourceAccessException;
import org.springframework.web.servlet.view.AbstractView;

public class StreamToGetUserRequestView extends AbstractView {

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest req, HttpServletResponse res) throws Exception {

		String requestId = ( String )model.get( "requestId" );
		String info = ( String )model.get( "info" );
		String wabiUrl = Conf.wabiApiUrl + requestId + "?info=" + info;

		String contentType = "application/json; charset=utf-8";
		res.setContentType( contentType );

		String characterEncoding = "UTF-8";
		if ( characterEncoding != null )
			res.setCharacterEncoding( characterEncoding );

		ServletOutputStream out = res.getOutputStream();
		try {
			RestTemplate rest = new RestTemplate();
			String result = rest.getForObject(wabiUrl, String.class);

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
