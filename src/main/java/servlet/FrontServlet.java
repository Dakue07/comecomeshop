package servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import commands.AbstractCommand;
import commands.CommandFactory;
import context.RequestContext;
import context.ResponseContext;
import context.WebRequestContext;
import controller.ApplicationController;
import controller.WebApplicationController;

public class FrontServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doAction(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doAction(req, res);

	}

	private void doAction(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//Map<String, String[]> map = req.getParameterMap();

		req.setCharacterEncoding("UTF-8");

		ApplicationController app = new WebApplicationController();
		RequestContext reqc = app.getRequest(req);
		ResponseContext resc = app.handleRequest(reqc);
		
		resc.setResponse(reqc);
		
		app.handleResponse(reqc, resc);

//		if (command != null) {
//			command.init(rc);
//			ResponseContext resc = command.execute();
//			Object bean = resc.getResult();
//			req.setAttribute("data", bean);
//			System.out.println("front target: " + resc.getTarget());
//			req.getRequestDispatcher(resc.getTarget()).forward(req, res);
//
//		} else {
//			res.sendError(HttpServletResponse.SC_NOT_FOUND, "このページは存在しません");
//		}
	}
}
