package commands;

import context.RequestContext;
import context.ResponseContext;
import dao.ReviewTableDao;
import database.MySQLOperator;

public class AdminReviewCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {
		RequestContext reqc = getRequestContext();
		Object result = null;
		
		MySQLOperator.getInstance().beginTransaction();
		
		String rice_id = reqc.getParameter("rice_id")[0];
		
		ReviewTableDao reviewtabledao = new ReviewTableDao();
		
		result = reviewtabledao.Admin_Select_Review(rice_id);
		
		resc.setResult(result);
		
		MySQLOperator.getInstance().commit();
		
		resc.setTarget("review");
		
		return resc;
	}

}
