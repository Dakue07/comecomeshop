package commands;

import context.RequestContext;
import context.ResponseContext;

public class LogoutCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {
		RequestContext reqc = getRequestContext();
		reqc.InvalidateSession();
		resc.setTarget("/come/productslist");
		
		return resc;
	}

}
