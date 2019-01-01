package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bases.BaseServlet;
import commons.TypeUser;
import daos.CourseDAO;
import daos.PostDAO;
import daos.UserDAO;
import models.User;

public class PageHomeServlet extends BaseServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public void initServlet() {
		// TODO Auto-generated method stub
		CourseDAO.getInstance().initDatabaseManager(getServletContext());
		UserDAO.getInstance().initDatabaseManager(getServletContext());
		PostDAO.getInstance().initDatabaseManager(getServletContext());
	}

	@Override
	public void handleGet(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		showView(request, response);
	}

	@Override
	public void handlePost(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

	}

	public void showView(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("courses", CourseDAO.getInstance().getPopularCourses());
		request.setAttribute("lecturers", UserDAO.getInstance().getUsers(TypeUser.LECTURER));
		request.setAttribute("posts", PostDAO.getInstance().getLatestPosts());
		try {
			forward(request, response, "/jsp/page-home.jsp");
		} catch (IOException | ServletException e) {
			e.printStackTrace();
		}
	}

}
