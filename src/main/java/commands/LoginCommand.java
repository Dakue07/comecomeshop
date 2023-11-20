package commands;


import java.util.ArrayList;

import beans.UserBean;
import beans.UserRiceBean;
import context.RequestContext;
import context.ResponseContext;
import context.WebRequestContext;
import dao.RiceTableDao;
import login.LoginLogic;

public class LoginCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {
		RequestContext reqc = getRequestContext();
		
		Object userResult = null;
		
		Object riceResult = null;
		
		String name = reqc.getParameter("user_name")[0];
		String pass = reqc.getParameter("user_pass")[0];
		
		if (LoginLogic.isLoggedIn(name, pass)) {
			
			
			UserBean userBean = new UserBean();
			userBean.setUser_name(name);
			((WebRequestContext) reqc).setUserBeanInSession(userBean);
			
			userResult = userBean;
			
			
			RiceTableDao riceDao = new RiceTableDao();
			
			riceResult = riceDao.SelectRice(null, null);
			
			UserRiceBean userRiceBean = new UserRiceBean();
			
			userRiceBean.setUserBean(userBean);
			userRiceBean.setRiceDto((ArrayList)riceResult);
			
			resc.setResult(userRiceBean);
			resc.setTarget("productslist");
		} else {
			resc.setResult("miss");
			resc.setTarget("signin");
		}
		
		return resc;
	}
}