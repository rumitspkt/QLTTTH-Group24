package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bases.BaseServlet;
import commons.ErrorCodes;
import commons.SuccessCodes;
import commons.TypePage;
import daos.PageDAO;
import models.Page;

@WebServlet(name="AdminPageServlet", urlPatterns= {"/admin/page/event", "/admin/page/about", "/admin/page/contact", "/admin/page", "/admin/page/event/edit", "/admin/page/about/edit"})
public class AdminPageServlet extends BaseServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public void initServlet() {
		// TODO Auto-generated method stub
		PageDAO.getInstance().initDatabaseManager(getServletContext());
	}

	@Override
	public void handleGet(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		switch (getAction(request)) {
		case "/admin/page/event": case "/admin/page":
			showViewPage(request, response, TypePage.EVENT);
			break;
		case "/admin/page/about":
			showViewPage(request, response, TypePage.ABOUT);
			break;
		default:
			break;
		}
	}

	@Override
	public void handlePost(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		switch (getAction(request)) {
		case "/admin/page/event/edit":
			editPage(request, response, TypePage.EVENT);
			break;
		case "/admin/page/about/edit":
			editPage(request, response, TypePage.ABOUT);
			break;
		default:
			handleGet(request, response);
			break;
		}
	}
	
	private void showViewPage(HttpServletRequest request, HttpServletResponse response, String typePage) {
		request.setAttribute("page", PageDAO.getInstance().getPage(typePage));
		try {
			switch (typePage) {
			case TypePage.ABOUT:
				forward(request, response, "/jsp/admin/admin-page-about.jsp");
				break;
			case TypePage.EVENT:
				forward(request, response, "/jsp/admin/admin-page-event.jsp");
				break;
			default:
				break;
			}
		} catch (IOException | ServletException e) {
			e.printStackTrace();
		}
	}
	
	private void editPage(HttpServletRequest request, HttpServletResponse response, String typePage) {
		String contents = request.getParameter("contents");
		if(PageDAO.getInstance().updatePage(typePage, contents)) {
			setSuccessCode(request, SuccessCodes.UPDATE_PAGE_SUCCESS);
		}else {
			setErrorCode(request, ErrorCodes.UPDATE_PAGE_ERROR);
		}
		try {
			switch (typePage) {
			case TypePage.ABOUT:
				forward(request, response, "/admin/page/about");
				break;
			case TypePage.EVENT:
				forward(request, response, "/admin/page/event");
			default:
				break;
			}
		} catch (IOException | ServletException e) {
			e.printStackTrace();
		}
	}
	

}
