package commands;

import context.RequestContext;
import context.ResponseContext;
import dao.UserAddressDao;
import database.MySQLOperator;

public class DeletePostCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {
		RequestContext reqc = getRequestContext();
		
		MySQLOperator.getInstance().beginTransaction();
		
		int useraddress_id = Integer.parseInt(reqc.getParameter("useraddress_id")[0]);
		
		System.out.println(useraddress_id);
	
		
		UserAddressDao userAddressDao = new UserAddressDao();
		
		userAddressDao.deleteAddress(useraddress_id);
		
		MySQLOperator.getInstance().commit();
		
		resc.setTarget("come/userpost");
				
		return resc;
	}
}
	