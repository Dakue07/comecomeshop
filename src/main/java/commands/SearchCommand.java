package commands;

import context.RequestContext;
import context.ResponseContext;
import dao.RiceTableDao;
import database.MySQLOperator;

public class SearchCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {
		RequestContext reqc = getRequestContext();
		
		String search_name = reqc.getParameter("name")[0];
		String sort = reqc.getParameter("sort")[0];
		
		reqc.setSearchWord(search_name);
		
		MySQLOperator.getInstance().beginTransaction();
		
		RiceTableDao rdao = new RiceTableDao();
		
		rdao.SelectRice(search_name, sort);
		
		MySQLOperator.getInstance().commit();
		
		resc.setTarget("productslist");
		
		return resc;
	}

}
