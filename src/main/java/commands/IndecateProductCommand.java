package commands;

import context.RequestContext;
import context.ResponseContext;
import dao.RiceTableDao;
import database.MySQLOperator;

public class IndecateProductCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {
		RequestContext reqc = getRequestContext();
		
		MySQLOperator.getInstance().beginTransaction();
		
		String rice_id = reqc.getParameter("rice_id")[0];
		
		RiceTableDao riceDao = new RiceTableDao();
		
		riceDao.changeTrue(rice_id);
		
		MySQLOperator.getInstance().commit();
		
		resc.setTarget("come/adminproduct");
		
		return resc;
	}
}
	