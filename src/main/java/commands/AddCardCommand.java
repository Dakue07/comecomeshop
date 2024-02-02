package commands;

import java.sql.Date;
import java.text.SimpleDateFormat;

import context.RequestContext;
import context.ResponseContext;
import dao.CardTableDao;
import database.MySQLOperator;

public class AddCardCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {
		
		RequestContext reqc = getRequestContext();
		
		MySQLOperator.getInstance().beginTransaction();
		
		int user_id = reqc.getUserBeanInSession().getUser_id();
		String card_number = reqc.getParameter("card_number")[0];
		String card_securitycode = reqc.getParameter("card_securitycode")[0];
		String card_holdername = reqc.getParameter("card_holdername")[0];
		
		String month = reqc.getParameter("month")[0];
		String year = reqc.getParameter("year")[0];
		
		String date = year + "-" + month;
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM");
		Date card_validity = null;

		try {
		    card_validity = new Date(formatter.parse(date).getTime());
		} catch (java.text.ParseException e) {
		    e.printStackTrace();
		}
		
		CardTableDao carddao = new CardTableDao();
		carddao.insertCard(user_id, card_holdername, card_number, card_validity, card_securitycode);
		
		MySQLOperator.getInstance().commit();
		
		String url = reqc.getReferer();

		resc.setTarget(url);

	
		
		return resc;
	}
}
