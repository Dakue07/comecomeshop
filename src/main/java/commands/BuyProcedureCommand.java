package commands;

import beans.UserBean;
import context.RequestContext;
import context.ResponseContext;
import dao.CardTableDao;
import database.MySQLOperator;

public class BuyProcedureCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {
		RequestContext reqc = getRequestContext();
		Object result = null;
		
		MySQLOperator.getInstance().beginTransaction();
		
		UserBean userBean = reqc.getUserBeanInSession();
		int user_id = userBean.getUser_id();
		
		CardTableDao cardDao = new CardTableDao();
		
		result = cardDao.selectCardByUser(user_id);
		resc.setResult(result);
		
		MySQLOperator.getInstance().commit();
		
		resc.setTarget("procedure");
		
		return resc;
	}

}
