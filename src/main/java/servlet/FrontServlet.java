package servlet;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import context.RequestContext;
import context.ResponseContext;
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
		try {
		req.setCharacterEncoding("UTF-8");
		
		ServletContext context = getServletContext();
		String rootPath = context.getRealPath("/");
		
		//ApplicationControllerのインスタンスを取得
		ApplicationController app = new WebApplicationController();
		
		//RequestContextの実装クラスのインスタンスを取得
		RequestContext reqc = app.getRequest(req);
		
		reqc.setParameterMap(req.getParameterMap());
		
		//ResponseContextにhandleRequestメソッドの結果を格納
		ResponseContext resc = app.handleRequest(reqc, req.getServletContext().getResourceAsStream("/WEB-INF/properties/commands.properties"));
		System.out.println("ふろんと" + resc.getResult());
		
		//結果をResponseContextにセットする
		resc.setResponse(res);
		
		//forwardする
		app.handleResponse(reqc, resc);
		}catch(Throwable e) {
			e.printStackTrace();
		}

	}
}
