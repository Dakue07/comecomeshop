package commands;

import java.util.ArrayList;

import context.RequestContext;
import context.ResponseContext;
import dao.CardTableDao;
import dao.CartTableDao;
import dao.UserAddressDao;
import database.MySQLOperator;

public class BuyProcedureCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {
		RequestContext reqc = getRequestContext();
		
		Object result = null;
		Object result2 = null;
		Object result3 = null;
		ArrayList<Object> allResult = new ArrayList<Object>();
		
		MySQLOperator.getInstance().beginTransaction();
		
		int user_id = reqc.getUserBeanInSession().getUser_id();
		
		CartTableDao cartdao = new CartTableDao();
		UserAddressDao address = new UserAddressDao();
		CardTableDao card = new CardTableDao();
		
		result = cartdao.AllSelect(user_id);
		result2 = address.selectAddressByUser(user_id);
		result3 = card.selectCardByUser(user_id);
		
		allResult.add(result);
		allResult.add(result2);
		allResult.add(result3);
		
		System.out.println(allResult);
		
		
		MySQLOperator.getInstance().commit();
		
		resc.setResult(allResult);
		resc.setTarget("procedure");
		
		return resc;
	}
	
}