package commands;

import context.RequestContext;
import context.ResponseContext;
import database.MySQLOperator;

public class DeletePostCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {
		RequestContext reqc = getRequestContext();
		
		MySQLOperator.getInstance().beginTransaction();
		
		int user_id = Integer.parseInt(reqc.getParameter("user_id")[0]);
		String useraddress_postcode = reqc.getParameter("useraddress_postcode")[0];
		String useraddress_state_city = reqc.getParameter("useraddress_state_city")[0];
		
		//途中
		
		MySQLOperator.getInstance().commit();
		

		
		return resc;
	}
}
	