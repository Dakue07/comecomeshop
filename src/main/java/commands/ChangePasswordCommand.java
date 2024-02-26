package commands;

import context.RequestContext;
import context.ResponseContext;
import dao.UserDao;
import database.MySQLOperator;
import login.Encryption;

public class ChangePasswordCommand extends AbstractCommand {
    public ResponseContext execute(ResponseContext resc) {
        
        RequestContext reqc = getRequestContext();
        
        MySQLOperator.getInstance().beginTransaction();
        
        String oldPassword = reqc.getParameter("oldPassword")[0];
        String newPassword = reqc.getParameter("newPassword")[0];
        int user_id = reqc.getUserBeanInSession().getUser_id();
        
        UserDao userdao = new UserDao();
        String storedPasswordHash = userdao.selectPassword(user_id);
        
        
        if (Encryption.check(oldPassword, storedPasswordHash)) {
           
            userdao.updatePassword(Encryption.hash(newPassword), user_id);
            MySQLOperator.getInstance().commit();
            resc.setResult("ok");
        } else {
        	resc.setResult("miss");
        }
        
        resc.setTarget("security");
        
        return resc;
    }
}
