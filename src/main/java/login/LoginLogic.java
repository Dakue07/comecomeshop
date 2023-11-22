package login;

import dao.UserDao;
import database.MySQLOperator;
import dto.UserTableDto;

public class LoginLogic {
	public static boolean isLoggedIn(String user, String pass) {
		boolean flag = false;
		
		MySQLOperator.getInstance().beginTransaction(); 
		
		UserDao dao = new UserDao();
		UserTableDto dto = dao.findRecord(user);
		if (dto != null) {
			
			String hashedpass = null;
			hashedpass = dto.getUser_pass();
			System.out.println("loginlogic :" + dto.getUser_pass()); 
			
			if(dto != null && user.equals(dto.getUser_name()) && Encryption.check(pass, hashedpass)) {
				flag = true;
			}	
		}
		MySQLOperator.getInstance().commit();
		return flag;
	}
}
