package filters;

import java.io.IOException;
import java.time.LocalDateTime;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.MapUtil;

/**
 * Servlet Filter implementation class LogFilter
 */
public class LogFilter implements Filter {

    /**
     * Default constructor. 
     */
    public LogFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		System.out.println("log filter");
		// TODO Auto-generated method stub
		// place your code here
		HttpServletRequest requestHttp = (HttpServletRequest) request;
		HttpServletResponse responseHttp = (HttpServletResponse) response;
		System.out.println(LocalDateTime.now().toString() + ": " + requestHttp.getMethod() + " - " + requestHttp.getRequestURI());
		System.out.println("Parameters: " + MapUtil.mapToString(request.getParameterMap()));
		System.out.println("\n");
		// pass the request along the filter chain
		String requestURI = requestHttp.getRequestURI();
		if(requestURI.endsWith("/") && !requestURI.equals(requestHttp.getServletContext().getContextPath() + "/")) {
			responseHttp.sendRedirect(requestURI.substring(0, requestURI.length() - 1));
//			System.out.println(requestURI.substring(0, requestURI.length() - 1));
		}else {
			chain.doFilter(request, response);
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
