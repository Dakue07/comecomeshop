package commands;

import context.RequestContext;
import context.ResponseContext;
import dao.UserAddressDao;
import dao.UserDao;
import database.MySQLOperator;
import login.Encryption;

public class UserInsertCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {
		
		System.out.println("ユーザー登録まできてるよ");
		
		RequestContext reqc = getRequestContext();
		
		System.out.println("さいんあっぷこま" + reqc.getParameter("user_name")[0]);
		System.out.println("さいんあっぷこま" + reqc.getParameter("user_pass")[0]);
		
		MySQLOperator.getInstance().beginTransaction();
		
		String user_name = reqc.getParameter("user_name")[0];
		String user_pass = reqc.getParameter("user_pass")[0];
		String user_Email = reqc.getParameter("user_Email")[0];
		String useraddress_receiver = reqc.getParameter("useraddress_receiver")[0];
		String useraddress_postcord = reqc.getParameter("useraddress_postcode")[0];
		String useraddress_state_sity = reqc.getParameter("useraddress_state_city")[0];
		String useraddress_street = reqc.getParameter("useraddress_street")[0];
		
		String hashed = Encryption.hash(user_pass);
		
		System.out.println(hashed);
		
		UserDao userDao = new UserDao();
		UserAddressDao UAddressDao = new UserAddressDao();
		
		
		if (userDao.createUser(user_name, hashed, user_Email) == false) {
			MySQLOperator.getInstance().rollback();
			
			resc.setResult("miss");
			resc.setTarget("signup");

		} else {
			int user_id = Integer.valueOf(userDao.findUser_id(user_name, hashed));
			UAddressDao.insertAddress(user_id, useraddress_receiver, useraddress_postcord, useraddress_state_sity, useraddress_street);
			
			MySQLOperator.getInstance().commit();
			resc.setTarget("/come/signin");
		}
		return resc;
	}
}