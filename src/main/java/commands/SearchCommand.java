package commands;

import context.RequestContext;
import context.ResponseContext;
import dao.RiceTableDao;
import database.MySQLOperator;

public class SearchCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {
		RequestContext reqc = getRequestContext();
		
		Object result = null;
		
		String search_name = null;
		String sort = null;
		
		search_name = reqc.getParameter("name")[0];
		try {
			sort = reqc.getParameter("sort")[0];
		} catch (NullPointerException e) { }
		
		MySQLOperator.getInstance().beginTransaction();
		
		RiceTableDao rdao = new RiceTableDao();
		
		result = rdao.SelectRice(search_name, sort);
		
		MySQLOperator.getInstance().commit();
		
		resc.setResult(result);
		
		resc.setTarget("productslist");
		
		return resc;
	}

}
