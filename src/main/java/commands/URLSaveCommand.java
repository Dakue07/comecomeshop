package commands;

import context.RequestContext;
import context.ResponseContext;

public class URLSaveCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {
		RequestContext reqc = getRequestContext();
		Object result = null;
		
		String url = reqc.getParameter("url")[0];
		
		reqc.setReferer();
		
		System.out.println("リファラー" + reqc.getReferer());
		
		resc.setResult(result);
		
		resc.setTarget(url);
		
		return resc;
	}
}