package commands;

import java.util.ArrayList;

import beans.UserRiceBean;
import context.RequestContext;
import context.ResponseContext;
import context.WebRequestContext;
import dao.RiceTableDao;

public class ProductsListCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {
		RequestContext reqc = getRequestContext();
		Object result = null;
		String sort = null;
		String search = null;
		
		UserRiceBean userRiceBean = new UserRiceBean();
		
		RiceTableDao riceDao = new RiceTableDao();
		
		if(reqc.getParameter("search")[0] != null) {
			search = reqc.getParameter("search")[0];
		}
		
		if(reqc.getParameter("sort")[0] != null) {
			sort = reqc.getParameter("sort")[0];
		}
		
//		search = reqc.getParameter("search") != null ? reqc.getParameter("search")[0] : null;
//		sort = reqc.getParameter("sort") != null ? reqc.getParameter("sort")[0] : null;
//チャッピー
		
		result = riceDao.SelectRice(sort, search);
		
		userRiceBean.setRiceDto((ArrayList)result);
		userRiceBean.setUserBean(((WebRequestContext) reqc).getUserBeanInSession());
		
		resc.setResult(userRiceBean);
		
		resc.setTarget("productslist");
		
		return resc;
	}
}