package commands;

import context.RequestContext;
import context.ResponseContext;
import dao.UserAddressDao;
import database.MySQLOperator;

public class AddPostCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {
		
		RequestContext reqc = getRequestContext();
		
		MySQLOperator.getInstance().beginTransaction();
		
		int user_id = reqc.getUserBeanInSession().getUser_id();
		String useraddress_receiver = reqc.getParameter("useraddress_receiver")[0];
		String useraddress_postcode = reqc.getParameter("useraddress_postcode")[0];
		String useraddress_state_city = reqc.getParameter("useraddress_state_city")[0];
		String useraddress_street = reqc.getParameter("useraddress_street")[0] + reqc.getParameter("street_address")[0];
		
		System.out.println(useraddress_receiver);
		System.out.println(useraddress_postcode);
		System.out.println(useraddress_state_city);
		System.out.println(useraddress_street);
		
		UserAddressDao userAddressDao = new UserAddressDao();
		userAddressDao.insertAddress(user_id, useraddress_receiver, useraddress_postcode, useraddress_state_city, useraddress_street);
		
		MySQLOperator.getInstance().commit();

		resc.setTarget("/come/userpost");
		
		return resc;
	}
}
