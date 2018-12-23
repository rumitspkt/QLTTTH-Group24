package servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.eclipse.jdt.internal.compiler.ast.ArrayQualifiedTypeReference;

import com.mysql.cj.x.protobuf.MysqlxDatatypes.Array;

import bases.BaseServlet;
import commons.ErrorCodes;
import commons.SuccessCodes;
import commons.TypeUser;
import daos.ContactDAO;
import daos.UserDAO;
import models.Contact;
import models.User;
import utils.HashUtil;
import utils.ValidateUtil;

@WebServlet(name = "AdminAccountServlet", urlPatterns = { "/admin/account", "/admin/account/new" })
public class AdminAccountServlet extends BaseServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public void initServlet() {
		// TODO Auto-generated method stub
		UserDAO.getInstance().initDatabaseManager(getServletContext());
	}

	@Override
	public void handleGet(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		showView(request, response);
	}

	@Override
	public void handlePost(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		switch (getAction(request)) {
		case "/admin/account/new":
			create(request, response);
			break;
		
		default:
			handleGet(request, response);
		}
	}

	private void showView(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("users", UserDAO.getInstance().getUsers());
		try {
			forward(request, response, "/jsp/admin/admin-account.jsp");
		} catch (IOException | ServletException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	private void create(HttpServletRequest request, HttpServletResponse response) {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String confirmPassword = request.getParameter("confirmPassword");
		String email = request.getParameter("email");

		try {
			if (!password.equals(confirmPassword)) {
				setErrorCode(request, ErrorCodes.CONFIRM_PASSWORD_NOT_EQUAL);
				forward(request, response, "/admin/account");
				return;
			}

			List<String> validationErrors = new ValidateUtil().candidate(username, "USER_NAME").validateLength(6)
					.validateLowercaseLetterAndNumberOnly().candidate(password, "PASSWORD").validateLength(6).candidate(email, "EMAIL").validateEmail().getResults();
			
			if(validationErrors != null) {
				setErrorCode(request, validationErrors);
				forward(request, response, "/admin/account");
				return;
			}
			
			if(UserDAO.getInstance().getUser(username) != null) {
				setErrorCode(request, ErrorCodes.USERNAME_EXISTED);
				forward(request, response, "/admin/account");
				return;
			}
			
			User user = new User(TypeUser.LECTURER, username, HashUtil.getHash(password), email);

			if (UserDAO.getInstance().storeUser(user)) {
				setSuccessCode(request, SuccessCodes.CREATE_ACCOUNT_SUCCESS);
				forward(request, response, "/admin/account");
			} else {
				setErrorCode(request, ErrorCodes.CREATE_NEW_ACCOUNT_FAIL);
				forward(request, response, "/admin/account");
			}

		} catch (IOException | ServletException e) {
			e.printStackTrace();
		}
	}

}
