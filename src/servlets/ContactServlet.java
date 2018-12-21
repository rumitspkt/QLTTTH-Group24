package servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bases.BaseServlet;
import commons.ErrorCodes;
import commons.SuccessCodes;
import daos.ContactDAO;
import models.Contact;

@WebServlet(name = "ContactServlet", urlPatterns = {"/contact/edit", "/contact/new", "/contact", "/contact/list", "/contact/delete", "/contact/test"})
public class ContactServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;


	@Override
	public void initServlet() {
		// TODO Auto-generated method stub
		ContactDAO.getInstance().initDatabaseManager(getServletContext());
	}

	@Override
	public void handleGet(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		list(request, response);
	}

	@Override
	public void handlePost(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		switch (getAction(request)) {
		case "/contact/edit":
			edit(request, response);
			break;
		case "/contact/new":
			create(request, response);
			break;
		case "/contact/list": case "/contact":
			list(request, response);
			break;
		case "/contact/delete":
			delete(request, response);
			break;
		default:
			break;
		}
	}

	private void create(HttpServletRequest request, HttpServletResponse response) {
		String name = request.getParameter("name");
		String phoneNumber = request.getParameter("phoneNumber");

		Contact contact = new Contact(name, phoneNumber);

		try {
			if (ContactDAO.getInstance().storeContact(contact)) {
				setSuccessCode(request, SuccessCodes.CREATE_CONTACT_SUCCESS);
				forward(request, response, "/contact");
			} else {
				setErrorCode(request, ErrorCodes.CREATE_NEW_CONTACT_FAIL);
				forward(request, response, "/contact");
			}

		} catch (IOException | ServletException e) {
			e.printStackTrace();
		}
	}

	private void delete(HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.valueOf(request.getParameter("id"));

		try {
			if (ContactDAO.getInstance().deleteContact(id)) {
				setSuccessCode(request, SuccessCodes.DELETE_CONTACT_SUCCESS);
				forward(request, response, "/contact");
			} else {
				setErrorCode(request, ErrorCodes.DELETE_CONTACT_FAIL);
				forward(request, response, "/contact");
			}
		} catch (IOException | ServletException e) {
			e.printStackTrace();
		}
	}

	private void edit(HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.valueOf(request.getParameter("id"));
		String name = request.getParameter("name");
		String phoneNumber = request.getParameter("phoneNumber");

		try {
			if (ContactDAO.getInstance().updateContact(id, name, phoneNumber)) {
				setSuccessCode(request, SuccessCodes.UPDATE_CONTACT_SUCCESS);
				forward(request, response, "/contact");
			} else {
				setErrorCode(request, ErrorCodes.UPDATE_CONTACT_FAIL);
				forward(request, response, "/contact");
			}
		} catch (IOException | ServletException e) {
			e.printStackTrace();
		}
	}

	private void list(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("contacts", ContactDAO.getInstance().getAllContacts());
		try {
			forward(request, response, "/jsp/contact.jsp");
		} catch (IOException | ServletException e) {
			e.printStackTrace();
		}
	}
	
//	private void test(HttpServletRequest request, HttpServletResponse response) {
//		setSuccessCode(request, "testing after");
//		setErrorCode(request, "hello 2");
//		try {
//			forward(request, response, "/index.jsp");
//		} catch (IOException | ServletException e) {
//			e.printStackTrace();
//		}
//	}

	
}
