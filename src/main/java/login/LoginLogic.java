package login;

import dao.UserDao;
import dto.UserTableDto;

public class LoginLogic {
	public static boolean isLoggedIn(String user, String pass) {
		boolean flag = false;
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
		return flag;
	}
}
