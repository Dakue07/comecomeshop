package commands;

import context.RequestContext;
import context.ResponseContext;

public class HistoryCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {
		RequestContext reqc = getRequestContext();
		Object result = null;
		
		resc.setResult(result);
		
		resc.setTarget("history");
		
		return resc;
	}
}