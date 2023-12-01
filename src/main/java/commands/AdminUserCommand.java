package commands;

import context.RequestContext;
import context.ResponseContext;
import dao.UserDao;
import database.MySQLOperator;

public class AdminUserCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {
		RequestContext reqc = getRequestContext();
		Object result = null;

		MySQLOperator.getInstance().beginTransaction();
		
		UserDao userDao = new UserDao();
		
		result = userDao.SelectAll();
		System.out.println(result);
		
		resc.setResult(result);
		
		MySQLOperator.getInstance().commit();
		
		resc.setTarget("usermanage");
		
		return resc;
	}
}