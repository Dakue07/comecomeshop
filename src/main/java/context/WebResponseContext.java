package context;

import javax.servlet.http.HttpServletResponse;

public class WebResponseContext implements ResponseContext {
	private Object result;
	private String target;
	private HttpServletResponse response;
	
	public WebResponseContext() {}
	
	public Object getResult() {
		return result;
	}
	
	public String getTarget() {
		return "/" + target;
	}
	
	public void setResult(Object bean) {
		result = bean;
	}
	
	public void setTarget(String transferInfo) {
		target = transferInfo;
	}
	
	public void setResponse(Object obj) {
		response = (HttpServletResponse)obj;
	}
	
	public Object getResponse() {
		return response;
	}
}