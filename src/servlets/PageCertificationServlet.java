package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bases.BaseServlet;
import daos.CertificationDAO;
import daos.CourseDAO;
import daos.ScoreDAO;

@WebServlet(name = "PageCertificationServlet", urlPatterns = { "/certification" })
public class PageCertificationServlet extends BaseServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public void initServlet() {
		// TODO Auto-generated method stub
		CourseDAO.getInstance().initDatabaseManager(getServletContext());
		CertificationDAO.getInstance().initDatabaseManager(getServletContext());
	}

	@Override
	public void handleGet(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		switch (getAction(request)) {
		case "/certification":
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
		int course = 0;
		if (request.getParameter("course") != null) {
			course = Integer.valueOf(request.getParameter("course"));
		}
		if (course == 0) {
			request.setAttribute("courses", CourseDAO.getInstance().getCourses());
			request.setAttribute("selected", 0);
		} else {
			request.setAttribute("certificates", CertificationDAO.getInstance().getCertificationsByCourse(course));
			request.setAttribute("courses", CourseDAO.getInstance().getCourses());
			request.setAttribute("selected", course);
		}
		try {
			forward(request, response, "/jsp/page-certification.jsp");
		} catch (IOException | ServletException e) {
			e.printStackTrace();
		}
	}

}
