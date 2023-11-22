package commands;

import beans.UserBean;
import context.RequestContext;
import context.ResponseContext;
import dao.CartTableDao;

public class CartCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {
		RequestContext reqc = getRequestContext();
		Object result = null;
		
		CartTableDao cartDao = new CartTableDao();
		
		String rice_id = reqc.getParameter("rice_id")[0];
		
		result = cartDao.AllSelect(rice_id);
		
		resc.setResult(result);
		
		UserBean userBean = reqc.getUserBeanInSession();
		
		System.out.println("cartこまんど" + userBean.getUser_id());
		
		resc.setTarget("productslist");
		
		return resc;
	}
}