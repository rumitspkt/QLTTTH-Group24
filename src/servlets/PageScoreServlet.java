package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bases.BaseServlet;

@WebServlet(name = "PageScoreServlet", urlPatterns = { "/score" })
public class PageScoreServlet extends BaseServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public void initServlet() {
		// TODO Auto-generated method stub
	}

	@Override
	public void handleGet(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		switch (getAction(request)) {
		case "/score":
			showView(request, response);
			break;

		default:
			break;
		}
	}

	@Override
	public void handlePost(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

	}
	
	public void showView(HttpServletRequest request, HttpServletResponse response) {
		try {
			forward(request, response, "/jsp/page-score.jsp");
		} catch (IOException | ServletException e) {
			e.printStackTrace();
		}
	}

}
