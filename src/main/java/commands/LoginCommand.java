package commands;


import beans.UserBean;
import context.RequestContext;
import context.ResponseContext;
import context.WebRequestContext;
import dao.RiceTableDao;
import dao.UserDao;
import database.MySQLOperator;
import dto.UserTableDto;
import login.LoginLogic;

public class LoginCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {
		RequestContext reqc = getRequestContext();
		
		MySQLOperator.getInstance().beginTransaction();
		Object userResult = null;
		Object riceResult = null;
		
		String name = reqc.getParameter("user_name")[0];
		String pass = reqc.getParameter("user_pass")[0];
		
		System.out.println(name);
		
		System.out.println();
		
		if (name.equals("admin")) {
			System.out.println("よお");
			if (LoginLogic.isLoggedIn(name, pass) == true) {
				
				resc.setTarget("admin");
				return resc;
			}
			
		} else if(LoginLogic.isLoggedIn(name, pass)) {
			
			UserDao userDao = new UserDao();
			
			UserTableDto userDto = userDao.findRecord(name);
			
			UserBean userBean = new UserBean();
			userBean.setUser_id(userDto.getUser_id());
			userBean.setUser_name(userDto.getUser_name());
			((WebRequestContext) reqc).setUserBeanInSession(userBean);
			
			RiceTableDao riceDao = new RiceTableDao();
			
			riceResult = riceDao.SelectRice(null, null);
			
			MySQLOperator.getInstance().commit();

			resc.setResult(riceResult);
			resc.setTarget("/come/productlist");
		} else {
			resc.setResult("miss");
			resc.setTarget("signin");
		}
		
		return resc;
	}
}