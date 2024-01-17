package commands;

import context.RequestContext;
import context.ResponseContext;
import dao.CartTableDao;
import dao.UserAddressDao;
import database.MySQLOperator;

public class ProcedureCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {
		RequestContext reqc = getRequestContext();
		Object result = null;
		Object result2 = null;
		Object allResult = null;
		
		int user_id = Integer.parseInt(reqc.getParameter("user_id")[0]);
		
		MySQLOperator.getInstance().beginTransaction();
		
		CartTableDao cartDao = new CartTableDao();
		UserAddressDao useraddressDao = new UserAddressDao();
		//CardTableDao cardDao = new CardTableDao();
		
		result = cartDao.AllSelect(user_id);
		result2 = useraddressDao.selectAddressByUser(user_id);
		allResult = result + result2;

		resc.setResult(result);
		
		System.out.println("cartこまんど" + result);
		
		resc.setTarget("cart");
		
		return resc;
	}
}