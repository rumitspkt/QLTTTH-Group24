package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bases.BaseServlet;

@WebServlet(name="AdminPostServlet", urlPatterns={"/admin/post/category", "/admin/post", "/admin/post/approve"})
public class AdminPostServlet extends BaseServlet{

	@Override
	public void initServlet() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void handleGet(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		switch (getAction(request)) {
		case "/admin/post/category": case "/admin/post":
			showViewCategory(request, response);
			break;
		case "/admin/post/approve":
			showViewApprove(request, response);
		default:
			break;
		}
	}

	@Override
	public void handlePost(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	}
	
	private void showViewCategory(HttpServletRequest request, HttpServletResponse response) {
		try {
			forward(request, response, "/jsp/admin/admin-post-category.jsp");
		} catch (IOException | ServletException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	private void showViewApprove(HttpServletRequest request, HttpServletResponse response) {
		try {
			forward(request, response, "/jsp/admin/admin-post-approve.jsp");
		} catch (IOException | ServletException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	

}
