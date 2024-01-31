package commands;

import java.util.ArrayList;

import beans.OrderedBean;
import context.RequestContext;
import context.ResponseContext;
import dao.OrderTableDao;
import dao.RiceTableDao;
import database.MySQLOperator;

public class OrderCancelCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {
		RequestContext reqc = getRequestContext();
		
		MySQLOperator.getInstance().beginTransaction();
		
		OrderTableDao orderdao = new OrderTableDao();
		RiceTableDao ricedao = new RiceTableDao();
		
		int rice_id;
		int order_quantity;
		int order_id = Integer.parseInt(reqc.getParameter("order_id")[0]);
		
		ArrayList<OrderedBean> orderlist = new ArrayList<OrderedBean>();
		
		orderlist = orderdao.selectOrderByOrderId(order_id);
		
		
		for (int i = 0; i < orderlist.size(); i++) {
			rice_id = orderlist.get(i).getRice_id();
			System.out.println("forbun" + rice_id);
			order_quantity = orderlist.get(i).getOrder_quantity();
			ricedao.orderCancel(rice_id, order_quantity);
		}
		
		orderdao.orderCancel(order_id);
		
		
		MySQLOperator.getInstance().commit();
		
		
		resc.setTarget("come/history");
		
		return resc;
	}
}