package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bases.BaseServlet;
import commons.ErrorCodes;
import commons.PostStatus;
import commons.SuccessCodes;
import commons.TypeUser;
import daos.CategoryDAO;
import daos.ContactDAO;
import daos.CourseDAO;
import daos.PostDAO;
import daos.UserDAO;
import models.Contact;

@WebServlet(name="AdminCourseServlet", urlPatterns= {"/admin/course"})
public class AdminCourseServlet extends BaseServlet{

	@Override
	public void initServlet() {
		// TODO Auto-generated method stub
		CourseDAO.getInstance().initDatabaseManager(getServletContext());
		CategoryDAO.getInstance().initDatabaseManager(getServletContext());
		UserDAO.getInstance().initDatabaseManager(getServletContext());
	}

	@Override
	public void handleGet(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		switch (getAction(request)) {
		case "/admin/course":
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
		case "/admin/course/new":
			showView(request, response);
			break;
		case "/admin/course/update":
			showView(request, response);
			break;
		case "/admin/course/delete":
			showView(request, response);
			break;
		default:
			handleGet(request, response);
			break;
		}
	}
	
	private void showView(HttpServletRequest request, HttpServletResponse response) {
		int category = 0;
		if (request.getParameter("category") != null) {
			category = Integer.valueOf(request.getParameter("category"));
		}
		if (category == 0) {
			request.setAttribute("courses", CourseDAO.getInstance().getCourses());
			request.setAttribute("categories", CategoryDAO.getInstance().getCategories());
			request.setAttribute("selected", 0);
		} else {
			request.setAttribute("courses", CourseDAO.getInstance().getCoursesByCategory(category));
			request.setAttribute("categories", CategoryDAO.getInstance().getCategories());
			request.setAttribute("selected", category);
		}
		request.setAttribute("lecturers", UserDAO.getInstance().getUsers(TypeUser.LECTURER));
		try {
			forward(request, response, "/jsp/admin/admin-course.jsp");
		} catch (IOException | ServletException e) {
			// TODO: handle exception
			e.printStackTrace();
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
	
}
