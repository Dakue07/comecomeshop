package commands;

import context.RequestContext;
import context.ResponseContext;
import dao.CardTableDao;
import database.MySQLOperator;

public class DeleteCardCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {
		RequestContext reqc = getRequestContext();
		
		MySQLOperator.getInstance().beginTransaction();
		
		int user_id = reqc.getUserBeanInSession().getUser_id();
		String card_number = reqc.getParameter("card_number")[0];
		System.out.println(card_number);
		
		CardTableDao carddao = new CardTableDao();
		
		carddao.deleteCard(user_id, card_number);
		
		MySQLOperator.getInstance().commit();
		
		resc.setTarget("come/card");
				
		return resc;
	}
}
	