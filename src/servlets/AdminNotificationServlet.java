package servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bases.BaseServlet;
import commons.ErrorCodes;
import commons.PriorityNotification;
import commons.SuccessCodes;
import daos.ContactDAO;
import daos.NotificationDAO;
import models.Contact;
import models.Notification;

@WebServlet(name="AdminNotificationServlet", urlPatterns= {"/admin/notification", "/admin/notification/new", "/admin/notification/edit", "/admin/notification/delete"})
public class AdminNotificationServlet extends BaseServlet{

	@Override
	public void initServlet() {
		// TODO Auto-generated method stub
		NotificationDAO.getInstance().initDatabaseManager(getServletContext());
	}

	@Override
	public void handleGet(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		switch (getAction(request)) {
		case "/admin/notification":
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
		case "/admin/notification/new":
			create(request, response);
			break;
		case "/admin/notification/edit":
			edit(request, response);
			break;
		case "/admin/notification/delete":
			delete(request, response);
			break;
		default:
			handleGet(request, response);
			break;
		}
	}
	
	private void showView(HttpServletRequest request, HttpServletResponse response) {
		List<String> priorities = new ArrayList<>();
		priorities.add(PriorityNotification.LOW);
		priorities.add(PriorityNotification.MEDIUM);
		priorities.add(PriorityNotification.HIGH);
		request.setAttribute("priorities", priorities);
		
		if(request.getParameter("priority") == null || request.getParameter("priority").equals("all")) {
			request.setAttribute("notifications", NotificationDAO.getInstance().getNotifications());
		}else {
			System.out.println("alo alo: " + request.getParameter("priority"));
			request.setAttribute("selected", request.getParameter("priority"));
			request.setAttribute("notifications", NotificationDAO.getInstance().getNotifications(request.getParameter("priority")));
		}
		
		try {
			forward(request, response, "/jsp/admin/admin-notification.jsp");
		} catch (IOException | ServletException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	private void create(HttpServletRequest request, HttpServletResponse response) {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String priority = request.getParameter("priorityPost");

		Notification notification = new Notification(title, content, priority);

		try {
			if (NotificationDAO.getInstance().storeNotification(notification)) {
				setSuccessCode(request, SuccessCodes.CREATE_NOTIFICATION_SUCCESS);
				forward(request, response, "/admin/notification");
			} else {
				setErrorCode(request, ErrorCodes.CREATE_NOTIFICATION_ERROR);
				forward(request, response, "/admin/notification");
			}

		} catch (IOException | ServletException e) {
			e.printStackTrace();
		}
	}

	private void delete(HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.valueOf(request.getParameter("id"));
		try {
			if (NotificationDAO.getInstance().deleteNotification(id)) {
				setSuccessCode(request, SuccessCodes.DELETE_NOTIFICATION_SUCCESS);
				forward(request, response, "/admin/notification");
			} else {
				setErrorCode(request, ErrorCodes.DELETE_NOTIFICATION_ERROR);
				forward(request, response, "/admin/notification");
			}
		} catch (IOException | ServletException e) {
			e.printStackTrace();
		}
	}

	private void edit(HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.valueOf(request.getParameter("id"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String priority = request.getParameter("priorityPost");
		try {
			if (NotificationDAO.getInstance().updateNotification(id, title, content, priority)) {
				setSuccessCode(request, SuccessCodes.UPDATE_NOTIFICATION_SUCCESS);
				forward(request, response, "/admin/notification");
			} else {
				setErrorCode(request, ErrorCodes.DELETE_NOTIFICATION_ERROR);
				forward(request, response, "/admin/notification");
			}
		} catch (IOException | ServletException e) {
			e.printStackTrace();
		}
	}
	
}
