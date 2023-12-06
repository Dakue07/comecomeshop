package commands;

import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

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
		
		String card_validity2 = reqc.getParameter("card_validity")[0];
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate localDate = LocalDate.parse(card_validity2, formatter);
        java.sql.Date card_validity = Date.valueOf(localDate);

		
		CardTableDao carddao = new CardTableDao();
		carddao.insertCard(user_id, card_number, card_securitycode, card_holdername, card_validity);
		
		MySQLOperator.getInstance().commit();

		resc.setTarget("");

	
		
		return resc;
	}
}
