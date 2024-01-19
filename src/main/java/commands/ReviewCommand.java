package commands;

import beans.UserBean;
import context.RequestContext;
import context.ResponseContext;
import dao.ReviewTableDao;

public class ReviewCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {
		RequestContext reqc = getRequestContext();
		Object result = null;
		
		UserBean userBean = reqc.getUserBeanInSession();
		
		int user_id = userBean.getUser_id();
		
		ReviewTableDao reviewdao = new ReviewTableDao();
		
		result = reviewdao.Select_Review(user_id);
		
		resc.setResult(result);
		
		resc.setTarget("review");
		
		return resc;
	}

}
