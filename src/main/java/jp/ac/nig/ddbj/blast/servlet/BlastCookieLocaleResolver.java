package jp.ac.nig.ddbj.blast.servlet;

import java.io.IOException;
import java.net.URLEncoder;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.i18n.CookieLocaleResolver;

public class BlastCookieLocaleResolver extends CookieLocaleResolver {
	public void addCookie(HttpServletResponse res, String cookieValue) {
		String localeValue = cookieValue;
		if (null!=cookieValue && !cookieValue.isEmpty()) {
			try {
				if (!cookieValue.equals(URLEncoder.encode(cookieValue, "UTF-8"))) {
					/*
					 * Note: URLエンコード が必要なテキストをロケール指定値として渡された場合、
					 * デフォルトのロケールで代替しておきます。
					 *
					 * 例: GET /blast/blastn?lang=%00
					 */
					localeValue = getDefaultLocale().getLanguage();
				}
			} catch (IOException ignore) {
			}
		}
		super.addCookie(res, localeValue);
	}
}
