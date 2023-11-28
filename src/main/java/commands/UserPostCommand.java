package commands;

import context.RequestContext;
import context.ResponseContext;
import dao.UserAddressDao;
import database.MySQLOperator;

public class UserPostCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {
		RequestContext reqc = getRequestContext();
		
		Object result = null;
		
		MySQLOperator.getInstance().beginTransaction();
		
		int user_id = reqc.getUserBeanInSession().getUser_id();
		
		UserAddressDao userAddressDao = new UserAddressDao();
		
		result = userAddressDao.selectAddressByUser(user_id);
		
		System.out.println(result);
		
		MySQLOperator.getInstance().commit();
		
		resc.setResult(result);
		resc.setTarget("post");
		
		return resc;
	}
	
}