package commands;

import java.util.ArrayList;

import context.RequestContext;
import context.ResponseContext;
import dao.ReviewTableDao;
import dao.RiceTableDao;

public class ProductDetailComamnd extends AbstractCommand{
		public ResponseContext execute(ResponseContext resc) {
			RequestContext reqc = getRequestContext();
			ArrayList<Object> result = new ArrayList<Object>();
			Object result3 = null;
			Object result2 = null;
			
			String rice_id = reqc.getParameter("rice_id")[0];
			System.out.println("ProductDetailCommand" + rice_id);
			
			RiceTableDao ricedao = new RiceTableDao();
			
			result2 = ricedao.SelectProduct(rice_id);
			
			ReviewTableDao reviewdao = new ReviewTableDao();
			
			result3 = reviewdao.Select_Review(rice_id);
			
			result.add(result2);
			result.add(result3);
			
			resc.setResult(result);
			
			resc.setTarget("productdetail");
			
			return resc;
		}
	}
