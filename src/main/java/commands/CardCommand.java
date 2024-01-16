package commands;

import context.RequestContext;
import context.ResponseContext;
import dao.CardTableDao;
import database.MySQLOperator;

public class CardCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {
		RequestContext reqc = getRequestContext();
		
		Object result = null;
		
		MySQLOperator.getInstance().beginTransaction();
		
		int user_id = reqc.getUserBeanInSession().getUser_id();
		
		CardTableDao carddao = new CardTableDao();
		
		result = carddao.selectCardByUser(user_id);
		
		MySQLOperator.getInstance().commit();
		
		resc.setResult(result);
		resc.setTarget("card");
		
		return resc;
	}
	
}