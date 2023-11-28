package commands;

import context.RequestContext;
import context.ResponseContext;
import context.WebRequestContext;
import dao.RiceTableDao;
import database.MySQLOperator;

public class AdminProductCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {
		RequestContext reqc = getRequestContext();
		Object result = null;

		MySQLOperator.getInstance().beginTransaction();
		
		RiceTableDao riceDao = new RiceTableDao();
		
		result = riceDao.SelectAll();
		
		((WebRequestContext) reqc).getUserBeanInSession();
		
		resc.setResult(result);
		
		MySQLOperator.getInstance().commit();
		
		resc.setTarget("productslist");
		
		return resc;
	}
}