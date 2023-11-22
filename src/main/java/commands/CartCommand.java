package commands;

import beans.UserBean;
import context.RequestContext;
import context.ResponseContext;
import dao.CartTableDao;

public class CartCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {
		RequestContext reqc = getRequestContext();
		Object result = null;
		
		UserBean userBean = reqc.getUserBeanInSession();
		int id = userBean.getUser_id();
		String user_id = String.valueOf(id);
		
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