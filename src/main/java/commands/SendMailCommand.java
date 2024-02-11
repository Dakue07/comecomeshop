package commands;

import context.RequestContext;
import context.ResponseContext;
import dao.RiceTableDao;
import mail.SendMail;

public class SendMailCommand extends AbstractCommand{
	public ResponseContext execute(ResponseContext resc) {
		Object result = null;
		RequestContext reqc = getRequestContext();
		
		int user_id = reqc.getUserBeanInSession().getUser_id();
		String user_name = reqc.getParameter("user_name")[0];
		String content = reqc.getParameter("content")[0];
		
		SendMail.sendMail(user_id, user_name, content);
		
		RiceTableDao riceDao = new RiceTableDao();
		
		result = riceDao.SelectRice(null, null);
		
		reqc.setAttribute("mail", "mail");
		
		resc.setResult(result);

		resc.setTarget("come/productlist");
		
		return resc;
	}
}
