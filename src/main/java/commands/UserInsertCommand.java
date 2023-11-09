package commands;

import context.RequestContext;
import context.ResponseContext;
import dao.UserDao;
import login.Encryption;

public class UserInsertCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {
		
		System.out.println("ユーザー登録まできてるよ");
		
		RequestContext reqc = getRequestContext();
		
		System.out.println("さいんあっぷこま" + reqc.getParameter("user_name")[0]);
		System.out.println("さいんあっぷこま" + reqc.getParameter("user_pass")[0]);
		
		String user = reqc.getParameter("user_name")[0];
		String pass = reqc.getParameter("user_pass")[0];
		
		String hashed = Encryption.hash(pass);
		
		System.out.println(hashed);
		
		UserDao uDao = new UserDao();
		
		if (uDao.createUser(user, hashed) == false) {
			resc.setResult("miss");
			resc.setTarget("signup");
		} else {
			resc.setTarget("productslist");
		}
		
		return resc;
	}
}