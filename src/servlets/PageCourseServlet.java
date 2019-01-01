package servlets;

import java.io.Console;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bases.BaseServlet;
import commons.ErrorCodes;
import commons.SuccessCodes;
import commons.TypeUser;
import daos.CourseDAO;
import daos.EnrollmentDAO;
import daos.ScoreDAO;
import models.Enrollment;
import models.Score;
import models.User;

@WebServlet(name = "PageCourseServlet", urlPatterns = { "/course", "/course/enroll" })
public class PageCourseServlet extends BaseServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public void initServlet() {
		// TODO Auto-generated method stub
		CourseDAO.getInstance().initDatabaseManager(getServletContext());
		EnrollmentDAO.getInstance().initDatabaseManager(getServletContext());
		ScoreDAO.getInstance().initDatabaseManager(getServletContext());
	}

	@Override
	public void handleGet(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		switch (getAction(request)) {
		case "/course":
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
		case "/course/enroll":
			enroll(request, response);
			break;

		default:
			handleGet(request, response);
			break;
		}
	}
	
	public void showView(HttpServletRequest request, HttpServletResponse response) {
		try {
			if(request.getParameter("id") == null && request.getAttribute("id") == null) {
				request.setAttribute("courses", CourseDAO.getInstance().getCourses());
				forward(request, response, "/jsp/page-course.jsp");
			}else {
				int course;
				if(request.getParameter("id") != null) {
					course = Integer.valueOf(request.getParameter("id"));
				}else {
					course = (int) request.getAttribute("id");
				}
				
				request.setAttribute("course", CourseDAO.getInstance().getCourse(course));
				forward(request, response, "/jsp/page-course-detail.jsp");
			}
		} catch (IOException | ServletException e) {
			e.printStackTrace();
		}
	}
	
public void enroll(HttpServletRequest request, HttpServletResponse response) {
		User user= (User) request.getSession().getAttribute("user");
		int course = Integer.valueOf(request.getParameter("course"));
		
		try {
			if(user == null) {
				sendRedirect(request, response, "/login");
				return;
			}else {
				if(!user.getType().equals(TypeUser.STUDENT)) {
					setErrorCode(request, ErrorCodes.YOU_ARE_NOT_STUDENT);
					request.setAttribute("id", course);
					forward(request, response, "/course");
				}else {
					Enrollment enrollment = EnrollmentDAO.getInstance().getEnrollment(user.getId(), course);
					if(enrollment == null) {
						System.out.println("enrollemt null");
						enrollment = new Enrollment(course, user.getId());
						int enrollmentId = EnrollmentDAO.getInstance().storeEnrollment(enrollment);
						if(enrollmentId != -1) {
							if(ScoreDAO.getInstance().storeScore(new Score(0.0f, 0.0f, enrollmentId))) {
								CourseDAO.getInstance().updateSeatCourse(course);
								setSuccessCode(request, SuccessCodes.ENROLL_COURSE_SUCCESS);
								request.setAttribute("id", course);
								forward(request, response, "/course");
								return;
							}
						}
						setErrorCode(request, ErrorCodes.ENROLL_COURSE_ERROR);
						request.setAttribute("id", course);
						forward(request, response, "/course");
					}else {
						System.out.println("enrollemt not null");
						setErrorCode(request, ErrorCodes.YOU_ALREADY_EXIST_IN_THIS_COURSE);
						request.setAttribute("id", course);
						forward(request, response, "/course");
					}
				}
			}
		} catch (IOException | ServletException e) {
			e.printStackTrace();
		}
	}

}
