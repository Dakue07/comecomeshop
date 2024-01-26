package commands;

import context.RequestContext;
import context.ResponseContext;
import dao.OrderTableDao;
import dao.RiceTableDao;

public class OrderCancelCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {
		RequestContext reqc = getRequestContext();
		
		int user_id = reqc.getUserBeanInSession().getUser_id();
		int order_id = Integer.parseInt(reqc.getParameter("order_id")[0]);
		int rice_id = Integer.parseInt(reqc.getParameter("rice_id")[0]);
		int order_quantity = Integer.parseInt(reqc.getParameter("order_quantity")[0]);
		
		OrderTableDao orderdao = new OrderTableDao();
		RiceTableDao ricedao = new RiceTableDao();
		
		orderdao.orderCancel(order_id);
		ricedao.orderCancel(rice_id, order_quantity);
		
		
		resc.setTarget("history");
		
		return resc;
	}
}