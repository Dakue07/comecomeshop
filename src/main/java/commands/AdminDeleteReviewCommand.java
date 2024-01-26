package commands;

import context.RequestContext;
import context.ResponseContext;
import dao.ReviewTableDao;
import database.MySQLOperator;

public class AdminDeleteReviewCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {
		RequestContext reqc = getRequestContext();
				
		MySQLOperator.getInstance().beginTransaction();
		
		int review_id = Integer.parseInt(reqc.getParameter("review_id")[0]);
		
		ReviewTableDao reviewdao = new ReviewTableDao();
		
		reviewdao.DELETE_REVIEW(review_id);
		
		MySQLOperator.getInstance().commit();
		
		resc.setTarget("come/adminreview");

		return resc;
	}

}
