package jp.ac.nig.ddbj.blast.util;

import java.util.ResourceBundle;

public class Conf {
	/*
	 * Note: pom.xml 設定に応じて環境毎にリソースを切り替える。
	 * (pom.xml の project/profiles/profile/properties/resources.directory 要素を参照。)
	 * 例: 本番用は src/main/resources/env.properties
	 * 例: 統合テスト用は src/integration/resources/env.properties
	 * 例: 開発用は src/development/resources/env.properties
	 */
	private static ResourceBundle bundle = ResourceBundle.getBundle("env");
	
	/** このディレクトリの下にblast imageファイルが置かれる。 */
	final static public String imageFileDir = bundle.getString("Conf.imageFileDir");
	// 例: imageFileDir = "/usr/local/app/sabi/webapps/blast/resources/temp/"
	
	/** wabiAPIのURL。 */
	final static public String wabiApiUrl = bundle.getString("Conf.wabiApiUrl");
	// 例: wabiApiUrl = "http://wabi.ddbj.nig.ac.jp/blast/"
	
	/** SABI BLAST のURL。 */
	final static public String blastUrl = bundle.getString("Conf.blastUrl");
	// 例: blastUrl = "http://blast.ddbj.nig.ac.jp/"

	/** 脆弱性診断ページの GET を許可されている 接続元IPアドレス が満たすべき正規表現パターンです。 */
	final static public String patternPermittedRemoteAddrTestSecurityApplicationScanPage = bundle.getString("Conf.patternPermittedRemoteAddrTestSecurityApplicationScanPage");
}
