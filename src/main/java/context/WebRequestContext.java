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
		session.setAttribute("userBean", bean);
	}
	
	public UserBean getUserBeanInSession() {
		session = request.getSession();
		return (UserBean)session.getAttribute("userBean");
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
	
	public String getContextPath() {
		return request.getContextPath();
	}
	
	public void setReferer() {
		session = request.getSession();
		System.out.println("ウェブリクコン" + request.getHeader("REFERER"));
		session.setAttribute("referer", request.getHeader("REFERER").substring(34));
	}
	
	public String getReferer() {
		session = request.getSession();
		return (String)session.getAttribute("referer");
	}
	
	public void setAttribute(String name, String value) {
		request.setAttribute(name, value);
	}
	
	public String getAttribute(String name) {
		return (String)request.getAttribute(name);
	}
} 