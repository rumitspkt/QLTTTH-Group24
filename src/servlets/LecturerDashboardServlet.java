package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bases.BaseServlet;
import daos.DashboardDAO;
import models.User;

@WebServlet(name = "LecturerDashboardServlet", urlPatterns = { "/lecturer", "/lecturer/dashboard" })
public class LecturerDashboardServlet extends BaseServlet {

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
		case "/lecturer":
		case "/lecturer/dashboard":
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
		User user = (User) request.getSession().getAttribute("user");
		
		request.setAttribute("info", DashboardDAO.getInstance().summarizeForLecturer(user.getId()));
		
		try {
			forward(request, response, "/jsp/lecturer/lecturer-dashboard.jsp");
		} catch (IOException | ServletException e) {
			e.printStackTrace();
		}
	}

}
