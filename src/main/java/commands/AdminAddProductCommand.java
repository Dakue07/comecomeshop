package commands;

import context.RequestContext;
import context.ResponseContext;
import dao.RiceTableDao;
import database.MySQLOperator;

public class AdminAddProductCommand extends AbstractCommand {
	public ResponseContext execute(ResponseContext resc) {
		
		System.out.println("addProductまで来たよ");
		
		RequestContext reqc = getRequestContext();
		
		MySQLOperator.getInstance().beginTransaction();
		
		String rice_name = reqc.getParameter("rice_name")[0];
		String rice_genre = reqc.getParameter("rice_genre")[0];
		int rice_weight = Integer.valueOf(reqc.getParameter("rice_weight")[0]);
		String rice_made = reqc.getParameter("rice_made")[0];
		String rice_image_path = reqc.getParameter("rice_image_path")[0];
		String rice_since = reqc.getParameter("rice_since")[0];
		int rice_stock = Integer.valueOf(reqc.getParameter("rice_stock")[0]);
		int rice_price = Integer.valueOf(reqc.getParameter("rice_price")[0]);
		
		System.out.println(reqc.getParameter("rice_name")[0]);
		
		RiceTableDao riceDao = new RiceTableDao();

		riceDao.insertProduct(rice_name,rice_genre, rice_weight, rice_made, rice_image_path, rice_since, rice_stock, rice_price);
		
		MySQLOperator.getInstance().commit();
		
		resc.setTarget("come/adminproduct");
		
		return resc;
	}

}
