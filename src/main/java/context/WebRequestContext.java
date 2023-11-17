package context;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import beans.UserBean;


public class WebRequestContext implements RequestContext {
	private Map<String, String[]> parameters;
	private HttpServletRequest request;
	private HttpSession session = null;
	
	public WebRequestContext() {}
	
	@Override
	public String getCommandPath() {
		String path = request.getRequestURI();
		System.out.println("ウェブリクエストコンテキスト" + path);
		String target = path.replace("come", "").replace("shop", "").replace("/","");
		System.out.println(target);
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
	
	public void setUserBeanInSession(UserBean bean) {
		session = request.getSession();
		session.setAttribute("bean", bean);
	}
	
	public UserBean getUserBeanInSession() {
		session = request.getSession();
		return (UserBean)session.getAttribute("bean");
	}
	
	public void setSearchWord(String searchWord) {
		session = request.getSession();
		session.setAttribute("searchWord", searchWord);
	}
	
	public String getSearchWord() {
		session = request.getSession();
		return (String)session.getAttribute("searchWord");
	}
	
	public void ShouldRedirect() {
		
	}
	
	public void InvalidateSession() {
		session = request.getSession();
		session.invalidate();
	}
} 