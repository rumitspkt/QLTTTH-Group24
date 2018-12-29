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
import models.Course;

@WebServlet(name="AdminCourseServlet", urlPatterns= {"/admin/course", "/admin/course/new", "/admin/course/edit", "/admin/course/delete"})
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
			create(request, response);
			break;
		case "/admin/course/edit":
			edit(request, response);
			break;
		case "/admin/course/delete":
			delete(request, response);
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
		String title = request.getParameter("title");
		String shortDescription = request.getParameter("shortDescription");
		String objective = request.getParameter("objective");
		String eligibility = request.getParameter("eligibility");
		String outline = request.getParameter("outline");
		String schedules = request.getParameter("schedules");
		int totalSeat = request.getParameter("totalSeat") != null ? Integer.valueOf(request.getParameter("totalSeat")) : 0;
		int lecturer = request.getParameter("lecturer") != null ? Integer.valueOf(request.getParameter("lecturer")) : 0;
		float fee = request.getParameter("fee") != null ? Integer.valueOf(request.getParameter("fee")) : 0f;
		int categoryId = request.getParameter("categoryId") != null ? Integer.valueOf(request.getParameter("categoryId")) : 0;

		Course course = new Course(title, shortDescription, objective, eligibility, outline, schedules, totalSeat, fee, lecturer);

		try {
			int key = CourseDAO.getInstance().storeCourse(course);
			if(key > 0) {
				if(CourseDAO.getInstance().classifyCourse(key, categoryId)) {
					setSuccessCode(request, SuccessCodes.CREATE_COURSE_SUCESS );
					forward(request, response, "/admin/course");
					return;
				}
			}
			setErrorCode(request, ErrorCodes.CREATE_COURSE_ERROR);
			forward(request, response, "/admin/course");
		} catch (IOException | ServletException e) {
			e.printStackTrace();
		}
	}

	private void delete(HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.valueOf(request.getParameter("id"));

		Course course = CourseDAO.getInstance().getCourse(id);
		
		try {
			if(course.getAvailableSeat() > 0) {
				setErrorCode(request, ErrorCodes.DELETE_COURSE_ERROR);
				forward(request, response, "/admin/course");
				return;
			}
			if(CourseDAO.getInstance().deleteClassification(id) && CourseDAO.getInstance().deleteCourse(id)) {
				setSuccessCode(request, SuccessCodes.DELETE_COURSE_SUCCESS);
				forward(request, response, "/admin/course");
			}else {
				setErrorCode(request, ErrorCodes.DELETE_COURSE_ERROR);
				forward(request, response, "/admin/course");
			}
		} catch (IOException | ServletException e) {
			e.printStackTrace();
		}
	}

	private void edit(HttpServletRequest request, HttpServletResponse response) {
		int id = request.getParameter("id") != null ? Integer.valueOf(request.getParameter("id")) : 0;
		String title = request.getParameter("title");
		String shortDescription = request.getParameter("shortDescription");
		String objective = request.getParameter("objective");
		String eligibility = request.getParameter("eligibility");
		String outline = request.getParameter("outline");
		String schedules = request.getParameter("schedules");
		int totalSeat = request.getParameter("totalSeat") != null ? Integer.valueOf(request.getParameter("totalSeat")) : 0;
		int lecturer = request.getParameter("lecturer") != null ? Integer.valueOf(request.getParameter("lecturer")) : 0;
		float fee = request.getParameter("fee") != null ? Float.valueOf(request.getParameter("fee")) : 0f;
		int categoryId = request.getParameter("categoryId") != null ? Integer.valueOf(request.getParameter("categoryId")) : 0;

		Course course = new Course(id, title, shortDescription, objective, eligibility, outline, schedules, totalSeat, fee, lecturer);

		try {
			if (CourseDAO.getInstance().updateCourse(course) && CourseDAO.getInstance().updateClassifyCourse(course.getId(), categoryId)) {
				setSuccessCode(request, SuccessCodes.UPDATE_COURSE_SUCCESS);
				forward(request, response, "/admin/course");
			} else {
				setErrorCode(request, ErrorCodes.UPDATE_COURSE_ERROR);
				forward(request, response, "/admin/course");
			}
		} catch (IOException | ServletException e) {
			e.printStackTrace();
		}
	}
	
}
