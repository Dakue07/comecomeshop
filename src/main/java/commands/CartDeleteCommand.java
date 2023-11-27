package commands;

import beans.UserBean;
import context.RequestContext;
import context.ResponseContext;
import dao.CartTableDao;
import database.MySQLOperator;



public class CartDeleteCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {
		Object result = null;
		
		System.out.println("コマンドCartDeleteCommand");
		
		RequestContext reqc = getRequestContext();
		
		MySQLOperator.getInstance().beginTransaction();
		
		UserBean userBean = reqc.getUserBeanInSession();
		int user_id = userBean.getUser_id();
		
		int rice_id = Integer.parseInt(reqc.getParameter("rice_id")[0]);
		
		CartTableDao cartDao = new CartTableDao();
		cartDao.CartDelete(rice_id, user_id);
		
		
		result = cartDao.AllSelect(user_id);
		
		MySQLOperator.getInstance().commit();
		resc.setResult(result);
		resc.setTarget("cart");
		
		return resc;
	}

}
