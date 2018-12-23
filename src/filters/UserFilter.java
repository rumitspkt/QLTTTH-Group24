package filters;

import java.io.IOException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import commons.TypeUser;
import models.User;

public class UserFilter implements Filter {

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain arg2)
			throws IOException, ServletException {
		System.out.println("user filter");
		// TODO Auto-generated method stub
		HttpServletRequest requestHttp = (HttpServletRequest) arg0;
		HttpServletResponse responseHttp = (HttpServletResponse) arg1;
		User user = (User) requestHttp.getSession().getAttribute("user");
		String requestURI = requestHttp.getRequestURI();
		if(user == null) {
			if(requestURI.contains("/admin") || requestURI.contains("/lecturer")) {
				requestHttp.getRequestDispatcher("/jsp/403.jsp").forward(requestHttp, responseHttp);
			}else {
				arg2.doFilter(arg0, arg1);
			}
		}else {
			if(requestURI.contains("/admin")) {
				if(!user.getType().equals(TypeUser.ADMIN) && !user.getType().equals(TypeUser.SUPER_ADMIN)) {
					requestHttp.getRequestDispatcher("/jsp/403.jsp").forward(requestHttp, responseHttp);
				}else {
					arg2.doFilter(arg0, arg1);
				}
			}else if(requestURI.contains("/lecturer")) {
				if(!user.getType().equals(TypeUser.LECTURER)) {
					requestHttp.getRequestDispatcher("/jsp/403.jsp").forward(requestHttp, responseHttp);
				}else {
					arg2.doFilter(arg0, arg1);
				}
			}else {
				arg2.doFilter(arg0, arg1);
			}
		}
	}
}
