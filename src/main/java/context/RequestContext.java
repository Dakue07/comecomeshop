package context;

import java.util.Map;

public interface RequestContext {
	public String getCommandPath();
	public String[] getParameter(String key);
	public void setParameterMap(Map<String, String[]> map);
	public Object getRequest();
	public void setRequest(Object request);
	public void InvalidateSession();
	
} 