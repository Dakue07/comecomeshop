package commands;

import context.RequestContext;
import context.ResponseContext;
import dao.ReviewTableDao;

public class ReviewCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {
		RequestContext reqc = getRequestContext();
		Object result = null;
		
		String rice_id = reqc.getParameter("rice_id")[0];
		
		ReviewTableDao reviewdao = new ReviewTableDao();
		
		result = reviewdao.Select_Review(rice_id);
		
		resc.setResult(result);
		
		resc.setTarget("review");
		
		return resc;
	}

}
