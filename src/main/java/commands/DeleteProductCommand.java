package commands;

import context.RequestContext;
import context.ResponseContext;
import dao.RiceTableDao;
import database.MySQLOperator;

public class DeleteProductCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {
		RequestContext reqc = getRequestContext();
		
		MySQLOperator.getInstance().beginTransaction();
		
		int rice_id = Integer.parseInt(reqc.getParameter("rice_id")[0]);
		
		RiceTableDao riceDao = new RiceTableDao();
		
		riceDao.deleteProduct(rice_id);
		
		MySQLOperator.getInstance().commit();
		
		resc.setTarget("come/adminproduct");
		
		return resc;
	}
}
	