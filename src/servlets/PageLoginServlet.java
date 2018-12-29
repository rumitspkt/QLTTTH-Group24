package servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.core.ApplicationContext;

import bases.BaseServlet;
import commons.ErrorCodes;
import commons.TypeUser;
import daos.NotificationDAO;
import daos.UserDAO;
import models.User;
import utils.HashUtil;
import utils.ValidateUtil;

@WebServlet(name = "PageLoginServlet", urlPatterns = { "/login", "/logout" })
public class PageLoginServlet extends BaseServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public void initServlet() {
		// TODO Auto-generated method stub
		UserDAO.getInstance().initDatabaseManager(getServletContext());
		NotificationDAO.getInstance().initDatabaseManager(getServletContext());
	}

	@Override
	public void handleGet(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		switch (getAction(request)) {
		case "/login":	
			User user = (User) request.getSession().getAttribute("user");
			if (user != null) {
				redirectUser(request, response, user.getType());
			} else {
				showView(request, response);
			}
			break;
		case "/logout":
			logout(request, response);
			break;
		default:
			break;
		}
		
	}

	@Override
	public void handlePost(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		switch (getAction(request)) {
		case "/login":
			login(request, response);
			break;
		case "/logout":
			logout(request, response);
			break;
		default:
			break;
		}
	}

	private void showView(HttpServletRequest request, HttpServletResponse response) {
		try {
			forward(request, response, "/jsp/page-login.jsp");
		} catch (IOException | ServletException e) {
			e.printStackTrace();
		}
	}

	private void login(HttpServletRequest request, HttpServletResponse response) {
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		try {
			List<String> validationErrors = new ValidateUtil().candidate(username, "USERNAME").validateLength(6)
					.validateLowercaseLetterAndNumberOnly().candidate(password, "PASSWORD").validateLength(6)
					.getResults();
			if (validationErrors != null) {
				setErrorCode(request, validationErrors);
				showView(request, response);
				return;
			}

			User existedUser = UserDAO.getInstance().getUser(username);
			if (existedUser == null || !HashUtil.compareHash(existedUser.getHashPassword(), password)) {
				setErrorCode(request, ErrorCodes.USERNAME_OR_PASSWORD_WRONG);
				showView(request, response);
				return;
			}

			request.getSession().setAttribute("user", existedUser);

			redirectUser(request, response, existedUser.getType());

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

	}

	private void redirectUser(HttpServletRequest request, HttpServletResponse response, String userType) {
		try {
			switch (userType) {
			case TypeUser.STUDENT:
				sendRedirect(request, response, "/");
				break;
			case TypeUser.LECTURER:
				request.getSession().setAttribute("alerts", NotificationDAO.getInstance().getNotifications());
				sendRedirect(request, response, "/lecturer");
				break;
			case TypeUser.ADMIN:
				sendRedirect(request, response, "/admin");
				break;
			case TypeUser.SUPER_ADMIN:
				sendRedirect(request, response, "/admin");
				break;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

	}
	
	private void logout(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.getSession().invalidate();
			sendRedirect(request, response, "/login");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

	}

}
