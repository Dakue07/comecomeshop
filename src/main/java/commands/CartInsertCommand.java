package commands;

import beans.UserBean;
import context.RequestContext;
import context.ResponseContext;
import context.WebRequestContext;
import dao.CartTableDao;
import dao.RiceTableDao;

public class CartInsertCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {
		RequestContext reqc = getRequestContext();
		Object result = null;
		
		UserBean userBean = reqc.getUserBeanInSession();
		int user_id = userBean.getUser_id();
		
		CartTableDao cartDao = new CartTableDao();
		String rice_id = reqc.getParameter("rice_id")[0];
		System.out.println("UserID:" + user_id);

		System.out.println("ライスID:" + rice_id);
		
		cartDao.CartInsert(1,user_id, rice_id);
		
		RiceTableDao riceDao = new RiceTableDao();
		
		result = riceDao.SelectRice(null, null);
		
		((WebRequestContext) reqc).getUserBeanInSession();
		
		resc.setResult(result);
		
		resc.setTarget("productslist");
		
		return resc;
	}

}
