package jp.ac.nig.ddbj.blast.view;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Map;

import jp.ac.nig.ddbj.blast.util.Conf;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.view.AbstractView;

public class BlastOutputImageFile extends AbstractView {

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest req, HttpServletResponse res) throws Exception {

		String requestId = (String)model.get("requestId");
		String imageId = (String)model.get("imageId");

		String wabiUrl = Conf.wabiApiUrl + requestId + "?imageId=" + imageId;
		URL url = new URL( wabiUrl);
		HttpURLConnection http = (HttpURLConnection)url.openConnection();
		http.setRequestMethod("GET");
		http.connect();

		int responseCode = http.getResponseCode();
		if (200<=responseCode && responseCode<=299) {
			BufferedInputStream bi = new BufferedInputStream(http.getInputStream());

			File file = new File(Conf.imageFileDir + requestId + "_" + imageId + ".png");
			file.createNewFile();
			FileOutputStream fo = new FileOutputStream(file);
			int iData;
			while ((iData = bi.read()) != -1) {
				fo.write(iData);
			}
			bi.close();
			fo.close();
		} else if (400<=responseCode && responseCode<=499) {
			res.setStatus(responseCode);
		} else {
			res.setStatus(HttpURLConnection.HTTP_INTERNAL_ERROR);
		}

		http.disconnect();
		
	}
}
