package commands;

import context.RequestContext;
import context.ResponseContext;

public abstract class AbstractCommand {
	private RequestContext reqContext;
	
	public void init(RequestContext reqc) {
		reqContext = reqc;
	}
	
	public RequestContext getRequestContext() {
		return reqContext;
	}
	
	public abstract ResponseContext execute(ResponseContext resc);//ApplicationController適用するなら引数は(ResponseContext resc)
}
