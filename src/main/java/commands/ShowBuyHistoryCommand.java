package commands;

import context.RequestContext;
import context.ResponseContext;
import dao.OrderTableDao;

public class ShowBuyHistoryCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {
		RequestContext reqc = getRequestContext();
		Object result = null;
		
		int user_id = reqc.getUserBeanInSession().getUser_id();
		
		OrderTableDao orderdao = new OrderTableDao();
		
		result = orderdao.selectOrderByUserId(user_id);
		
		resc.setResult(result);
		
		resc.setTarget("history");
		
		return resc;
	}
}