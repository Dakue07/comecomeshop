package commands;

import java.util.ArrayList;

import context.RequestContext;
import context.ResponseContext;
import dao.CartTableDao;
import dao.OrderTableDao;
import dao.RiceTableDao;
import database.MySQLOperator;
import dto.RiceCartTableDto;
import mail.SendMail;

public class AddOrderDetailCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {
		Object result = null;
		String judge  ="";
		
		//データベース内の値を1増加させる何か
		
		
		RequestContext reqc = getRequestContext();
		
		MySQLOperator.getInstance().beginTransaction();
		
		ArrayList <RiceCartTableDto> cartlist = new ArrayList<RiceCartTableDto>();
		
		int order_id;
		int rice_id;
		int rice_price;
		int order_quantity;
		int rice_amount;
		int user_id = reqc.getUserBeanInSession().getUser_id();
		int address_id = Integer.parseInt(reqc.getParameter("addressOption")[0]);
		int card_id = Integer.parseInt(reqc.getParameter("paymentOption")[0]);
		
		CartTableDao cart = new CartTableDao();
		OrderTableDao order = new OrderTableDao();
		RiceTableDao rice = new RiceTableDao();
		
		order_id = order.IncrementId();
		
		order_id++;
		
		System.out.println("おーだーいｄ" + order_id);
		
		cartlist = cart.AllSelect(user_id);
		
		for (int i = 0; i < cartlist.size(); i++) {
			System.out.println("アドオーダー" + i + "回目");
			rice_id = cartlist.get(i).getRice_id();
			rice_price = rice.getRicePrice(rice_id);
			order_quantity = cartlist.get(i).getCart_quantity();
			rice_amount = order_quantity * rice_price; 
			order.InsertOrder(order_id, user_id, rice_id, address_id, card_id, order_quantity, rice_amount);
			judge = rice.updateRiceStock(rice_id, order_quantity);
		}
		
		System.out.println("iudge: " + judge);
		
		cart.deleteCart(user_id);
		
		if(judge.equals("ok")) {
			System.out.println("ifの中に入ったよ");
		    MySQLOperator.getInstance().commit();
		    SendMail.sendMail(user_id, order_id);
		    RiceTableDao riceDao = new RiceTableDao();
		    reqc.setAttribute("judge", judge);
		    result = riceDao.SelectRice(null, null);
		} else {
		    reqc.setAttribute("judge", judge); 
		}
		
		resc.setResult(result);
		
		resc.setTarget("come/productlist");
		
		return resc;
	}
}
