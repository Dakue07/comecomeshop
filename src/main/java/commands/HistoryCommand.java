package commands;

import context.RequestContext;
import context.ResponseContext;
import dao.OrderDetailsDao;

public class HistoryCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {
		RequestContext reqc = getRequestContext();
		Object result = null;
		
		int user_id = reqc.getUserBeanInSession().getUser_id();
		
		OrderDetailsDao orderdetailsdao = new OrderDetailsDao();
		
		result = orderdetailsdao.SELECT_ORDERDETAIL(user_id);
		
		resc.setResult(result);
		
		resc.setTarget("history");
		
		return resc;
	}
}