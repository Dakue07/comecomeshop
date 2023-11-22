package context;

import java.util.Map;

import beans.UserBean;

public interface RequestContext {
	public String getCommandPath();
	public String[] getParameter(String key);
	public void setParameterMap(Map<String, String[]> map);
	public Object getRequest();
	public void setRequest(Object request);
	public void setUserBeanInSession(UserBean bean);
	public UserBean getUserBeanInSession();
	public void setSearchWord(String searchWord);
	public String getSearchWord();
	public void InvalidateSession();
	
} 