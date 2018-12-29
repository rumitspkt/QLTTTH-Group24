package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bases.BaseServlet;
import daos.MessageDAO;

@WebServlet(name="AdminMessageServlet", urlPatterns= {"/admin/message"})
public class AdminMessageServlet extends BaseServlet{

	@Override
	public void initServlet() {
		// TODO Auto-generated method stub
		MessageDAO.getInstance().initDatabaseManager(getServletContext());
	}

	@Override
	public void handleGet(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		switch (getAction(request)) {
		case "/admin/message":
			showView(request, response);
			break;

		default:
			break;
		}
	}

	@Override
	public void handlePost(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	}
	
	private void showView(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("messages", MessageDAO.getInstance().getMessages());
		try {
			forward(request, response, "/jsp/admin/admin-message.jsp");
		} catch (IOException | ServletException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
}
