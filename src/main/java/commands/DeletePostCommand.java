package commands;

import context.RequestContext;
import context.ResponseContext;
import dao.UserAddressDao;
import database.MySQLOperator;

public class DeletePostCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {
		RequestContext reqc = getRequestContext();
		
		MySQLOperator.getInstance().beginTransaction();
		
		System.out.println(reqc.getParameter("user_id")[0]);
		
		int user_id = Integer.parseInt(reqc.getParameter("user_id")[0]);
		String useraddress_receiver = reqc.getParameter("useraddress_receiver")[0];
		String useraddress_postcode = reqc.getParameter("useraddress_postcode")[0];
		String useraddress_state_city = reqc.getParameter("useraddress_state_city")[0];
		String useraddress_street = reqc.getParameter("useraddress_street")[0];
		
		UserAddressDao userAddressDao = new UserAddressDao();
		
		userAddressDao.deleteAddress(user_id, useraddress_receiver, useraddress_postcode, useraddress_state_city, useraddress_street);
		
		MySQLOperator.getInstance().commit();
		
		resc.setTarget("come/userpost");
				
		return resc;
	}
}
	