package commands;

import context.RequestContext;
import context.ResponseContext;
import dao.RiceTableDao;

public class ProductCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {
		RequestContext reqc = getRequestContext();
		Object result = null;
		
		RiceTableDao riceDao = new RiceTableDao();
		
		String rice_id = reqc.getParameter("rice_id")[0];
		
		result = riceDao.SelectProduct(rice_id);
		
		resc.setResult(result);
		
		resc.setTarget("product");
		
		return resc;
	}
}
