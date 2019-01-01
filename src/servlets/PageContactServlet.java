package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bases.BaseServlet;
import commons.ErrorCodes;
import commons.SuccessCodes;
import daos.MessageDAO;
import models.Message;

@WebServlet(name = "PageContactServlet", urlPatterns = { "/contact", "/contact/new" })
public class PageContactServlet extends BaseServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public void initServlet() {
		// TODO Auto-generated method stub
		MessageDAO.getInstance().initDatabaseManager(getServletContext());
	}

	@Override
	public void handleGet(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		switch (getAction(request)) {
		case "/contact":
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
		case "/contact/new":
			create(request, response);
			break;

		default:
			break;
		}
	}
	
	public void showView(HttpServletRequest request, HttpServletResponse response) {
		try {
			forward(request, response, "/jsp/page-contact.jsp");
		} catch (IOException | ServletException e) {
			e.printStackTrace();
		}
	}
	
	public void create(HttpServletRequest request, HttpServletResponse response) {
		String senderName = request.getParameter("senderName");
		String emailOrPhone = request.getParameter("emailOrPhone");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		
		Message message = new Message(emailOrPhone, senderName, subject, content);
		
		try {
			if(MessageDAO.getInstance().storeMessage(message)) {
				setSuccessCode(request, SuccessCodes.SEND_MESSAGE_SUCCESS);
			}else {
				setErrorCode(request, ErrorCodes.SEND_MESSAGE_ERROR);
			}
			forward(request, response, "/jsp/page-contact.jsp");
		} catch (IOException | ServletException e) {
			e.printStackTrace();
		}
	}

}
