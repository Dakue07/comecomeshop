package commands;

import context.RequestContext;
import context.ResponseContext;
import dao.OrderTableDao;
import dao.ReviewTableDao;
import database.MySQLOperator;

public class AddReviewCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {
		RequestContext reqc = getRequestContext();
		Object result = null;
		
		MySQLOperator.getInstance().beginTransaction();
		
		int user_id = reqc.getUserBeanInSession().getUser_id();
		String rice_id = reqc.getParameter("rice_id")[0];
		String review_comment = reqc.getParameter("review_comment")[0];
		String review_star = reqc.getParameter("review_star")[0];
		System.out.println("user_id:" + user_id);
		System.out.println("rice_id:" + rice_id);
		System.out.println("review_comment:" + review_comment);
		System.out.println("review_star:"  + review_star);
		
		ReviewTableDao reviewtabledao = new ReviewTableDao();
		
		reviewtabledao.Insert_Review(rice_id, user_id, review_comment, review_star);
		
		OrderTableDao orderdao = new OrderTableDao();
		
		result = orderdao.selectOrderByUserId(user_id);
		
		resc.setResult(result);
		
		MySQLOperator.getInstance().commit();
		
		resc.setTarget("history");
		
		return resc;
	}

}
