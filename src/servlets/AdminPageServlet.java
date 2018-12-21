package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bases.BaseServlet;

@WebServlet(name="AdminPageServlet", urlPatterns= {"/admin/page/event", "/admin/page/about", "/admin/page/contact", "/admin/page"})
public class AdminPageServlet extends BaseServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public void initServlet() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void handleGet(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		switch (getAction(request)) {
		case "/admin/page/event": case "/admin/page":
			showViewEventPage(request, response);
			break;
		case "/admin/page/about":
			showViewAboutPage(request, response);
			break;
		case "/admin/page/contact":
			showViewContactPage(request, response);
			break;
		default:
			break;
		}
	}

	@Override
	public void handlePost(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	}
	
	private void showViewEventPage(HttpServletRequest request, HttpServletResponse response) {
		try {
			forward(request, response, "/jsp/admin/admin-page-event.jsp");
		} catch (IOException | ServletException e) {
			e.printStackTrace();
		}
	}
	
	private void showViewAboutPage(HttpServletRequest request, HttpServletResponse response) {
		try {
			forward(request, response, "/jsp/admin/admin-page-about.jsp");
		} catch (IOException | ServletException e) {
			e.printStackTrace();
		}
	}
	
	private void showViewContactPage(HttpServletRequest request, HttpServletResponse response) {
		try {
			forward(request, response, "/jsp/admin/admin-page-contact.jsp");
		} catch (IOException | ServletException e) {
			e.printStackTrace();
		}
	}

}
