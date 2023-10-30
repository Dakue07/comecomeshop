package context;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


public class WebRequestContext implements RequestContext {
	private Map<String, String[]> parameters;
	private HttpServletRequest request;
	private HttpSession session = null;
	
	public WebRequestContext() {}
	
	@Override
	public String getCommandPath() {
		String path = request.getRequestURI();
		System.out.println(path);
		String target = "";
		return target;
	}
	
	public String[] getParameter(String key) {
		return parameters.get(key);
	}
	
	public void setParameterMap(Map<String, String[]> map) {
		parameters = map;
	}
	
	public Object getRequest() {
		return request;
	}
	
	public void setRequest(Object request) {
		this.request = (HttpServletRequest) request;
	}
	
	public void InvalidateSession() {
		session = request.getSession();
		session.invalidate();
	}
} 