package commands;

import beans.UserBean;
import context.RequestContext;
import context.ResponseContext;
import dao.CartTableDao;

public class CartCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {
		RequestContext reqc = getRequestContext();
		Object result = null;
		
		int user_id;
		
		UserBean userBean = reqc.getUserBeanInSession();
		
		try {
			user_id = userBean.getUser_id();
		} catch (NullPointerException e) {
			resc.setTarget("signin");
			return resc;
		}
		
		CartTableDao cartDao = new CartTableDao();
		
//		String rice_id = reqc.getParameter("rice_id")[0];
//		System.out.println("ライスID:" + rice_id);
		
		result = cartDao.AllSelect(user_id);
		
		resc.setResult(result);
		
		System.out.println("cartこまんど" + result);
		
		resc.setTarget("cart");
		
		return resc;
	}
}