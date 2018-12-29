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
import daos.ContactDAO;
import models.Certification;
import models.Contact;

@WebServlet(name="AdminCertificateServlet", urlPatterns= {"/admin/certificate", "/admin/certificate/new", "/admin/certificate/edit"})
public class AdminCertificateServlet extends BaseServlet{

	@Override
	public void initServlet() {
		// TODO Auto-generated method stub
		CertificationDAO.getInstance().initDatabaseManager(getServletContext());
	}

	@Override
	public void handleGet(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		switch (getAction(request)) {
		case "/admin/certificate":
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
		case "/admin/certificate/new":
			create(request, response);
			break;
		case "/admin/certificate/edit":
			edit(request, response);
			break;
		default:
			handleGet(request, response);
			break;
		}
	}
	
	private void showView(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("certificates", CertificationDAO.getInstance().getCertifications());
		try {
			forward(request, response, "/jsp/admin/admin-certificate.jsp");
		} catch (IOException | ServletException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	private void create(HttpServletRequest request, HttpServletResponse response) {
		String title = request.getParameter("title");
		String description = request.getParameter("description");

		Certification certification = new Certification(title, description);

		try {
			if (CertificationDAO.getInstance().storeCertification(certification)) {
				setSuccessCode(request, SuccessCodes.CREATE_CERTIFICATION_SUCCESS);
				forward(request, response, "/admin/certificate");
			} else {
				setErrorCode(request, ErrorCodes.CREATE_CERTIFICATION_ERROR);
				forward(request, response, "/admin/certificate");
			}

		} catch (IOException | ServletException e) {
			e.printStackTrace();
		}
	}
	
	private void edit(HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.valueOf(request.getParameter("id"));
		String title = request.getParameter("title");
		String description = request.getParameter("description");

		try {
			if (CertificationDAO.getInstance().updateCertification(id, title, description)) {
				setSuccessCode(request, SuccessCodes.UPDATE_CERTIFICATION_SUCCESS);
				forward(request, response, "/admin/certificate");
			} else {
				setErrorCode(request, ErrorCodes.UPDATE_CERTIFICATION_ERROR);
				forward(request, response, "/admin/certificate");
			}
		} catch (IOException | ServletException e) {
			e.printStackTrace();
		}
	}
	
}
