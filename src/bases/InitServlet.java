package bases;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface InitServlet {
//	String setUrlPattern();
	void initServlet();
	void handleGet(HttpServletRequest request, HttpServletResponse response);
	void handlePost(HttpServletRequest request, HttpServletResponse response);
}
