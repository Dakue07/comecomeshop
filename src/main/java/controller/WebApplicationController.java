package controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import commands.AbstractCommand;
import commands.CommandFactory;
import context.RequestContext;
import context.ResponseContext;
import context.WebRequestContext;
import context.WebResponseContext;

public class WebApplicationController implements ApplicationController {
	
	//HttpServletRequestをRequestContextにセットしてリターンするメソッド
	public RequestContext getRequest(Object request) {
		
		
		RequestContext reqc = new WebRequestContext();
		
		reqc.setRequest(request);
		
		return reqc;
	}
	
	//渡されたRequestContextから
	public ResponseContext handleRequest(RequestContext reqc, String rootPath) {
		
		AbstractCommand command = CommandFactory.getCommand(reqc, rootPath);
		System.out.println("あぷこん" + command);
		command.init(reqc);
		
		
		ResponseContext resc = command.execute(new WebResponseContext());
		return resc;
	}
	
	public void handleResponse(RequestContext reqc, ResponseContext resc) {
		HttpServletRequest req = (HttpServletRequest) reqc.getRequest();
		HttpServletResponse res = (HttpServletResponse) resc.getResponse();
		
		req.setAttribute("data", resc.getResult());
		System.out.println("あぷ" + resc.getResult());

		System.out.println(resc.getTarget());
		RequestDispatcher rd = req.getRequestDispatcher(resc.getTarget());
		try {
			rd.forward(req, res);
		} catch (Exception e) {
			e.printStackTrace();
		}
		//cloneし直しテスト

	}

}
