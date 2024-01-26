package commands;

import context.RequestContext;
import context.ResponseContext;
import dao.ReviewTableDao;
import database.MySQLOperator;

public class DeleteReviewCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {
		RequestContext reqc = getRequestContext();
		Object result = null;
		
		MySQLOperator.getInstance().beginTransaction();
		
		String user_name = reqc.getUserBeanInSession().getUser_name();
		
		int review_id = Integer.parseInt(reqc.getParameter("review_id")[0]);
		String rice_id = reqc.getParameter("rice_id")[0];
		System.out.println("review_id" + review_id);
		System.out.println("rice_id" + rice_id);
		System.out.println("user_name" + user_name);

		
		ReviewTableDao reviewtabledao = new ReviewTableDao();
		
		reviewtabledao.DELETE_REVIEW(review_id);
		MySQLOperator.getInstance().commit();
		
		resc.setTarget("/come/productdetail");						

		return resc;
	}

}
