package commands;

import java.sql.Date;

import context.RequestContext;
import context.ResponseContext;
import dao.CardTableDao;
import database.MySQLOperator;

public class CardInsertCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {
		
		RequestContext reqc = getRequestContext();
		
		MySQLOperator.getInstance().beginTransaction();
		
		int user_id = Integer.parseInt(reqc.getParameter("user_id")[0]);
		String card_number = reqc.getParameter("card_number")[0];
		String card_securitycode = reqc.getParameter("card_securitycode")[0];
		String card_holdername = reqc.getParameter("card_holdername")[0];
		Date card_validity = reqc.getParameter("card_validity")[0];//ここ分からん
		
		CardTableDao carddao = new CardTableDao();
		carddao.insertCard(user_id, card_number, card_securitycode, card_holdername, card_validity);
		
		MySQLOperator.getInstance().commit();


	
		
		return resc;
	}
}
