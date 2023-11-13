package commands;

import context.RequestContext;
import context.ResponseContext;
import dao.RiceTableDao;

public class SerachCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {
		
		RequestContext reqc = getRequestContext();
		
		String search_name = reqc.getParameter("name")[0];
		String sort = reqc.getParameter("sort")[0];
		
		RiceTableDao rdao = new RiceTableDao();
		
		rdao.SelectRice_Sort(search_name, sort);
		
		resc.setTarget("productslist");
		
		return resc;
	}

}
