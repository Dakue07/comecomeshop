package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import beans.UserBean;

@WebFilter("/SessionFilter")
public class SessionFilter extends HttpFilter implements Filter {
       

    public SessionFilter() {
        super();
    }

	public void destroy() {}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpSession session = ((HttpServletRequest)request).getSession();
		UserBean bean = (UserBean) session.getAttribute("bean");
		
		if(session != null && bean != null){
			System.out.println("成功");
			chain.doFilter(request, response);
		} else {
			System.out.println("失敗");
			((HttpServletRequest)request).getRequestDispatcher("/signin").forward(request,response);
		}
		
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}
