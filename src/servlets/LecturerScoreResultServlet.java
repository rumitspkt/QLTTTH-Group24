package servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bases.BaseServlet;
import commons.ErrorCodes;
import commons.SuccessCodes;
import daos.CategoryDAO;
import daos.ContactDAO;
import daos.CourseDAO;
import daos.PostDAO;
import daos.ScoreDAO;
import models.User;
import utils.ValidateUtil;

@WebServlet(name = "LecturerScoreResultServlet", urlPatterns = { "/lecturer/score", "/lecturer/score/edit" })
public class LecturerScoreResultServlet extends BaseServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public void initServlet() {
		// TODO Auto-generated method stub
		ScoreDAO.getInstance().initDatabaseManager(getServletContext());
		CourseDAO.getInstance().initDatabaseManager(getServletContext());
	}

	@Override
	public void handleGet(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		switch (getAction(request)) {
		case "/lecturer/score":
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
		case "/lecturer/score/edit":
			edit(request, response);
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
		if (course == 0) {
			request.setAttribute("courses", CourseDAO.getInstance().getCoursesByLecturer(user.getId()));
			request.setAttribute("selected", 0);
		} else {
			request.setAttribute("scores", ScoreDAO.getInstance().getScoreByCourse(course));
			request.setAttribute("courses", CourseDAO.getInstance().getCoursesByLecturer(user.getId()));
			request.setAttribute("selected", course);
		}

		try {
			forward(request, response, "/jsp/lecturer/lecturer-score.jsp");
		} catch (IOException | ServletException e) {
			e.printStackTrace();
		}
	}

	private void edit(HttpServletRequest request, HttpServletResponse response) {
		int enrollment = Integer.valueOf(request.getParameter("enrollment"));
		float firstScore = Float.valueOf(request.getParameter("firstScore"));
		float secondScore = Float.valueOf(request.getParameter("secondScore"));
		int course = Integer.valueOf(request.getParameter("course"));

		request.setAttribute("course", course);

		try {
			List<String> validationErrors = new ValidateUtil().candidateFloat(firstScore, "FIRST_SCORE")
					.validateLessOrEqualThan(10.0f).validateGreaterOrEqualThan(0.0f)
					.candidateFloat(secondScore, "SECOND_SCORE").validateGreaterOrEqualThan(0.0f)
					.validateLessOrEqualThan(10.0f).getResults();

			if (validationErrors != null) {
				setErrorCode(request, validationErrors);
				forward(request, response, "/lecturer/score");
				return;
			}

			if (ScoreDAO.getInstance().updateScore(enrollment, firstScore, secondScore)) {
				setSuccessCode(request, SuccessCodes.UPDATE_SCORE_SUCCESS);
				forward(request, response, "/lecturer/score");
			} else {
				setErrorCode(request, ErrorCodes.UPDATE_SCORE_ERROR);
				forward(request, response, "/lecturer/score");
			}
		} catch (IOException | ServletException e) {
			e.printStackTrace();
		}
	}

}
