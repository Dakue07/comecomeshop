package commands;

import context.RequestContext;
import context.ResponseContext;
import dao.OrderTableDao;
import dao.RiceTableDao;
import database.MySQLOperator;

public class OrderCancelCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {
		RequestContext reqc = getRequestContext();
		
		MySQLOperator.getInstance().beginTransaction();
		
		int user_id = reqc.getUserBeanInSession().getUser_id();
		int order_id = Integer.parseInt(reqc.getParameter("order_id")[0]);
		int rice_id = Integer.parseInt(reqc.getParameter("rice_id")[0]);
		int order_quantity = Integer.parseInt(reqc.getParameter("order_quantity")[0]);
		
		System.out.println("米キャンセル" + rice_id);
		System.out.println("米キャンセル" + order_quantity);
		
		OrderTableDao orderdao = new OrderTableDao();
		RiceTableDao ricedao = new RiceTableDao();
		
		orderdao.orderCancel(order_id);
		ricedao.orderCancel(rice_id, order_quantity);
		
		MySQLOperator.getInstance().commit();
		
		
		resc.setTarget("come/history");
		
		return resc;
	}
}