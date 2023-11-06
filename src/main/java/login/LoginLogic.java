package login;

import dao.UserDao;
import dto.UserDto;

public class LoginLogic {
	public static boolean isLoggedIn(String user, String pass) {
		boolean flag = false;
		UserDao dao = new UserDao();
		UserDto dto = dao.findRecord(user);
		if (dto != null) {
			
			String hashedpass = null;
			hashedpass = dto.getPass();
			System.out.println("loginlogic :" + dto.getPass()); 
			
			if(dto != null && user.equals(dto.getUser()) && Encryption.check(pass, hashedpass)) {
				flag = true;
			}	
		}
		return flag;
	}
}
