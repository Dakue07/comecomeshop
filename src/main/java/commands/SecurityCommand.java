package commands;

import beans.UserBean;
import context.RequestContext;
import context.ResponseContext;
import dao.UserDao;
import database.MySQLOperator;
import dto.UserTableDto;

public class SecurityCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {
		Object result = null;
		
		RequestContext reqc = getRequestContext();
		
		MySQLOperator.getInstance().beginTransaction();
		
		int user_id = reqc.getUserBeanInSession().getUser_id();
		                                                      
		UserDao userdao = new UserDao();
		
		UserTableDto userDto = userdao.selectAll(user_id);
		
		UserBean userBean = new UserBean();
		userBean.setUser_Email(userDto.getUser_Email());
		userBean.setUser_name(userDto.getUser_name());
		
		
		resc.setResult(result);
		
		resc.setTarget("security");

		return resc;
	}
}
