package commands;

import beans.UserBean;
import context.RequestContext;
import context.ResponseContext;
import context.WebRequestContext;
import dao.CartTableDao;
import database.MySQLOperator;

public class ChangeRiceQuantityComamnd extends AbstractCommand {

	@Override
	public ResponseContext execute(ResponseContext resc) {
		RequestContext reqc = getRequestContext();
		Object result = null;
		
		MySQLOperator.getInstance().beginTransaction();
		
		UserBean userBean = reqc.getUserBeanInSession();
		int user_id = userBean.getUser_id();
		int rice_id = Integer.parseInt(reqc.getParameter("rice_id")[0]);
		int cart_quantity;
		int absolute_cart_quantity;
		
		try {
			cart_quantity = Integer.valueOf(reqc.getParameter("cart_quantity")[0]);
		} catch (NullPointerException e) {
			cart_quantity = 0;
		}
		try {
			absolute_cart_quantity = Integer.valueOf(reqc.getParameter("absolute_cart_quantity")[0]);
		} catch (NullPointerException e) {
			absolute_cart_quantity = 0;
		}
		
		CartTableDao cartDao = new CartTableDao();
		
		System.out.println("UserID:" + user_id);

		System.out.println("ライスID:" + rice_id);
		
		System.out.println("ホームから個数:" + cart_quantity );
		
		System.out.println("カートから個数" + absolute_cart_quantity);
		
		cartDao.UpdateCartQuantity(cart_quantity, absolute_cart_quantity, user_id, rice_id);
		
		result = cartDao.AllSelect(user_id);
		
		((WebRequestContext) reqc).getUserBeanInSession();
		
		resc.setResult(result);
		
		MySQLOperator.getInstance().commit();
		
		resc.setTarget("cartdetail");
		
		return resc;
	}

}
