package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bases.BaseServlet;
import commons.ErrorCodes;
import commons.SuccessCodes;
import daos.CertificationDAO;
import daos.CourseDAO;
import daos.ScoreDAO;
import models.User;

@WebServlet(name = "LecturerCertificateServlet", urlPatterns = { "/lecturer/certificate", "/lecturer/certificate/approve"})
public class LecturerCertificateServlet extends BaseServlet {

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
		case "/lecturer/certificate":
			showView(request, response);
			break;

		default:
			break;
		}
	}

	@Override
	public void handlePost(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		switch (getAction(request)) {
		case "/lecturer/certificate/approve":
			approve(request, response);
			break;

		default:
			handleGet(request, response);
			break;
		}
	}
	
	public void showView(HttpServletRequest request, HttpServletResponse response) {
		User user = (User) request.getSession().getAttribute("user");

		int course = 0;
		if (request.getParameter("course") != null) {
			course = Integer.valueOf(request.getParameter("course"));
		}
		request.setAttribute("courses", CourseDAO.getInstance().getCoursesByLecturer(user.getId()));
		request.setAttribute("typeOfCertificates", CertificationDAO.getInstance().getCertifications());
		if (course == 0) {
			request.setAttribute("selected", 0);
		} else {
			request.setAttribute("certificates", CertificationDAO.getInstance().getCertificationsByCourse(course));
			request.setAttribute("selected", course);
		}
		
		try {
			forward(request, response, "/jsp/lecturer/lecturer-certificate.jsp");
		} catch (IOException | ServletException e) {
			e.printStackTrace();
		}
	}
	
	public void approve(HttpServletRequest request, HttpServletResponse response) {
		int enrollment = Integer.valueOf(request.getParameter("enrollment"));
		int certificate = Integer.valueOf(request.getParameter("certificate"));
		int course = Integer.valueOf(request.getParameter("course"));
		
		request.setAttribute("course", course);
		
		try {
			if(CertificationDAO.getInstance().approve(enrollment, certificate)) {
				setSuccessCode(request, SuccessCodes.APPROVE_CERTIFICATE_SUCCESS);
				forward(request, response, "/lecturer/certificate");
			}else {
				setErrorCode(request, ErrorCodes.APPROVE_CERTIFICATE_ERROR);
				forward(request, response, "/lecturer/certificate");
			}
		} catch (IOException | ServletException e) {
			e.printStackTrace();
		}
	}

}
