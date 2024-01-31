package commands;

import context.RequestContext;
import context.ResponseContext;
import dao.UserDao;
import database.MySQLOperator;
import login.Encryption;

public class ChangePasswordCommand extends AbstractCommand {
public ResponseContext execute(ResponseContext resc) {
		
		RequestContext reqc = getRequestContext();
		
		MySQLOperator.getInstance().beginTransaction();
		
		String oldPassword = Encryption.hash(reqc.getParameter("oldPassword")[0]);
		String newPassword = reqc.getParameter("newPassword")[0];
		int user_id = Integer.parseInt(reqc.getParameter("user_id")[0]);
		
		UserDao userdao = new UserDao();
		String hashPassword = userdao.selectPassword(user_id);
		
		if(oldPassword.equals(hashPassword)) {
			userdao.updatePassword(Encryption.hash(newPassword), user_id);
			MySQLOperator.getInstance().commit();
		} else {
			resc.setResult("miss");
		}
		
		resc.setTarget("come/石内のやつ");
		
		return resc;
	}
}
