package commands;

import context.RequestContext;
import context.ResponseContext;
import dao.RiceTableDao;
import database.MySQLOperator;

public class ProductCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {
		RequestContext reqc = getRequestContext();
		Object result = null;
		
		MySQLOperator.getInstance().beginTransaction();
		
		RiceTableDao riceDao = new RiceTableDao();
		
		String rice_id = reqc.getParameter("rice_id")[0];
		
		result = riceDao.SelectProduct(rice_id);
		
		resc.setResult(result);
		
		MySQLOperator.getInstance().commit();
		
		resc.setTarget("product");
		
		return resc;
	}
}
