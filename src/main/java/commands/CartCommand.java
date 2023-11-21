package commands;

import context.RequestContext;
import context.ResponseContext;
import dao.CartTableDao;

public class CartCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {
		RequestContext reqc = getRequestContext();
		Object result = null;
		
		CartTableDao cartDao = new CartTableDao();
		
		String rice_id = reqc.getParameter("rice_id")[0];
		System.out.println("ライスID:" + rice_id);
		
		result = cartDao.AllSelect(rice_id);
		
		resc.setResult(result);
		
		resc.setTarget("cart");
		
		return resc;
	}
}