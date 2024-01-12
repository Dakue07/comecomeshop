package commands;

import context.RequestContext;
import context.ResponseContext;
import controller.ApplicationController;
import controller.WebApplicationController;


public class TestCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {
        ApplicationController app = new WebApplicationController();
        
        RequestContext reqc = getRequestContext();
        
		resc.setTarget("productlist");
		
		System.out.println("テスコま" + resc.getTarget());
		
		return resc;
	}
}