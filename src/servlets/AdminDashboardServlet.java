package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bases.BaseServlet;
import daos.DashboardDAO;

@WebServlet(name = "AdminDashboardServlet", urlPatterns = { "/admin", "/admin/dashboard" })
public class AdminDashboardServlet extends BaseServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public void initServlet() {
		// TODO Auto-generated method stub
		DashboardDAO.getInstance().initDatabaseManager(getServletContext());
	}

	@Override
	public void handleGet(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		switch (getAction(request)) {
		case "/admin":
		case "/admin/dashboard":
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
		request.setAttribute("info", DashboardDAO.getInstance().summarize());
		
		try {
			forward(request, response, "/jsp/admin/admin-dashboard.jsp");
		} catch (IOException | ServletException e) {
			e.printStackTrace();
		}
	}

}
