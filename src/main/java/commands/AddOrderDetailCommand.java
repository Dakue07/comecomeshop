package commands;

import context.RequestContext;
import context.ResponseContext;
import database.MySQLOperator;

public class AddOrderDetailCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {
		
		RequestContext reqc = getRequestContext();
		
		MySQLOperator.getInstance().beginTransaction();
		
		int user_id = reqc.getUserBeanInSession().getUser_id();
		String user_address = reqc.getParameter("addressOption")[0];
		String payment = reqc.getParameter("paymentOption")[0];
		
		System.out.println("アドオーダー" + user_address);
		System.out.println("あど" + payment);
		
		MySQLOperator.getInstance().commit();

		resc.setTarget("come/userpost");
		
		return resc;
	}
}
