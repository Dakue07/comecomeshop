package commands;

import context.RequestContext;
import context.ResponseContext;
import context.WebRequestContext;
import dao.RiceTableDao;

public class ProductsListCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {
		RequestContext reqc = getRequestContext();
		Object result = null;
		RiceTableDao riceDao = new RiceTableDao();
		
		result = riceDao.SelectRice(null, null);
		
		((WebRequestContext) reqc).getUserBeanInSession();
		
		resc.setResult(result);
		
		resc.setTarget("productslist");
		
		return resc;
	}
}