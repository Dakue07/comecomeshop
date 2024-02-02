package commands;

import context.RequestContext;
import context.ResponseContext;
import dao.UserDao;
import database.MySQLOperator;

public class ChangeEmailCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {
		
		RequestContext reqc = getRequestContext();
		
		MySQLOperator.getInstance().beginTransaction();
		
		int user_id = reqc.getUserBeanInSession().getUser_id();
		String user_Email = reqc.getParameter("user_Ename")[0];
		
		UserDao userdao = new UserDao();
		
		userdao.updateEmail(user_id, user_Email);
		
		MySQLOperator.getInstance().commit();
		
		resc.setTarget("come/security");
		
		return resc;
	}

}
