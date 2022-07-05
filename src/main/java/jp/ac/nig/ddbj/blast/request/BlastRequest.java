package jp.ac.nig.ddbj.blast.request;


/** POSTメソッドでBLASTのWebAPIを呼び出す時に用いられる入力データを表す.
 * 
 * 
 */
public class BlastRequest {

	String querySequence  = null;
	String datasets       = null;
	String database       = null;
	String program        = null;
	String parameters     = null;
	String format         = null;
	String result         = null;
	String address        = null;


	public String getQuerySequence() {
		return querySequence;
	}
	public void setQuerySequence(String querySequence) {
		this.querySequence = querySequence;
	}

	public String getDatasets() {
		return datasets;
	}
	public void setDatasets(String datasets) {
		this.datasets = datasets;
	}
	public String getDatabase() {
		return database;
	}
	public void setDatabase(String database) {
		this.database = database;
	}
	public String getProgram() {
		return program;
	}
	public void setProgram(String program) {
		this.program = program;
	}
	public String getParameters() {
		return parameters;
	}
	public void setParameters(String parameters) {
		this.parameters = parameters;
	}
	public String getFormat() {
		return format;
	}
	public void setFormat(String format) {
		this.format = format;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}

}
