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
		
		UserRiceBean userRiceBean = new UserRiceBean();
		
		RiceTableDao riceDao = new RiceTableDao();
		
		result = riceDao.SelectRice(null, null);
		
		userRiceBean.setRiceDto((ArrayList)result);
		userRiceBean.setUserBean(((WebRequestContext) reqc).getUserBeanInSession());
		
		resc.setResult(userRiceBean);
		
		resc.setTarget("productslist");
		
		return resc;
	}
}