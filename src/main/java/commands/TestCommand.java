package commands;

import context.ResponseContext;
import controller.ApplicationController;
import controller.WebApplicationController;


public class TestCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {
        ApplicationController app = new WebApplicationController();

		resc.setTarget("toppage");
		
		System.out.println("テスコま" + resc.getTarget());
		
		return resc;
	}
}