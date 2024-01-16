package commands;

import beans.UserBean;
import context.RequestContext;
import context.ResponseContext;
import context.WebRequestContext;
import dao.CartTableDao;
import dao.RiceTableDao;
import database.MySQLOperator;

public class AddCartCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {
		RequestContext reqc = getRequestContext();
		Object result = null;
		
		MySQLOperator.getInstance().beginTransaction();
		
		UserBean userBean = reqc.getUserBeanInSession();
		int user_id = userBean.getUser_id();
		int cart_quantity = Integer.valueOf(reqc.getParameter("cart_quantity")[0]);
		
		CartTableDao cartDao = new CartTableDao();
		String rice_id = reqc.getParameter("rice_id")[0];
		System.out.println("UserID:" + user_id);

		System.out.println("ライスID:" + rice_id);
		
		cartDao.UpdateCartQuantity(cart_quantity,user_id, rice_id);
		
		RiceTableDao riceDao = new RiceTableDao();
		
		result = riceDao.SelectRice(null, null);
		
		((WebRequestContext) reqc).getUserBeanInSession();
		
		resc.setResult(result);
		
		MySQLOperator.getInstance().commit();
		
		resc.setTarget("productlist");
		
		return resc;
	}

}
