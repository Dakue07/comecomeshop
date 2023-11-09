package commands;


import beans.UserBean;
import context.RequestContext;
import context.ResponseContext;
import context.WebRequestContext;
import login.LoginLogic;

public class LoginCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {
		RequestContext reqc = getRequestContext();
		
		String name = reqc.getParameter("user_name")[0];
		String pass = reqc.getParameter("user_pass")[0];
		
		if (LoginLogic.isLoggedIn(name, pass)) {
			UserBean bean = new UserBean();
			bean.setUser_name(name);
			((WebRequestContext) reqc).setUserBeanInSession(bean);;
			resc.setTarget("productslist");
		} else {
			resc.setResult("miss");
			resc.setTarget("signin");
		}
		
		return resc;
	}
}