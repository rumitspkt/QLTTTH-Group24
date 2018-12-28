package servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bases.BaseServlet;
import commons.ErrorCodes;
import commons.PostStatus;
import commons.SuccessCodes;
import daos.CategoryDAO;
import daos.ContactDAO;
import daos.PostDAO;
import models.Category;
import models.Contact;
import models.Post;

@WebServlet(name = "AdminPostServlet", urlPatterns = { "/admin/post/category", "/admin/post", "/admin/post/approve",
		"/admin/post/category/new", "/admin/post/category/edit", "/admin/post/category/delete" })
public class AdminPostServlet extends BaseServlet {

	@Override
	public void initServlet() {
		// TODO Auto-generated method stub
		CategoryDAO.getInstance().initDatabaseManager(getServletContext());
		PostDAO.getInstance().initDatabaseManager(getServletContext());
	}

	@Override
	public void handleGet(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		switch (getAction(request)) {
		case "/admin/post/category":
			showViewCategory(request, response);
			break;
		case "/admin/post":
			showViewApprove(request, response);
			break;
		default:
			break;
		}
	}

	@Override
	public void handlePost(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		switch (getAction(request)) {
		case "/admin/post/category/new":
			createCategory(request, response);
			break;
		case "/admin/post/category/edit":
			editCategory(request, response);
			break;
		case "/admin/post/category/delete":
			deleteCategory(request, response);
			break;
		case "/admin/post/approve":
			appove(request, response);
			break;
		default:
			handleGet(request, response);
			break;
		}
	}

	private void showViewCategory(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("categories", CategoryDAO.getInstance().getCategories());
		try {
			forward(request, response, "/jsp/admin/admin-post-category.jsp");
		} catch (IOException | ServletException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	private void showViewApprove(HttpServletRequest request, HttpServletResponse response) {
		int category = 0;
		if (request.getParameter("category") != null) {
			category = Integer.valueOf(request.getParameter("category"));
		}
		if (category == 0) {
			request.setAttribute("posts", PostDAO.getInstance().getPostsByStatus(PostStatus.PENDING));
			request.setAttribute("categories", CategoryDAO.getInstance().getCategories());
			request.setAttribute("selected", 0);
		} else {
			request.setAttribute("posts",
					PostDAO.getInstance().getPostsByCategoryAndStatus(category, PostStatus.PENDING));
			request.setAttribute("categories", CategoryDAO.getInstance().getCategories());
			request.setAttribute("selected", category);
		}

		try {
			forward(request, response, "/jsp/admin/admin-post-approve.jsp");
		} catch (IOException | ServletException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	private void createCategory(HttpServletRequest request, HttpServletResponse response) {
		String title = request.getParameter("title");
		String description = request.getParameter("description");

		Category category = new Category(title, description);

		try {
			if (CategoryDAO.getInstance().storeCategory(category)) {
				setSuccessCode(request, SuccessCodes.CREATE_CATEGORY_SUCCESS);
				forward(request, response, "/admin/post/category");
			} else {
				setErrorCode(request, ErrorCodes.CREATE_CATEGORY_ERROR);
				forward(request, response, "/admin/post/category");
			}

		} catch (IOException | ServletException e) {
			e.printStackTrace();
		}
	}

	private void deleteCategory(HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.valueOf(request.getParameter("id"));

		try {
			if (CategoryDAO.getInstance().deleteCategory(id)) {
				setSuccessCode(request, SuccessCodes.DELETE_CATEGORY_SUCCESS);
				forward(request, response, "/admin/post/category");
			} else {
				setErrorCode(request, ErrorCodes.DELETE_CATEGORY_ERROR);
				forward(request, response, "/admin/post/category");
			}
		} catch (IOException | ServletException e) {
			e.printStackTrace();
		}
	}

	private void editCategory(HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.valueOf(request.getParameter("id"));
		String title = request.getParameter("title");
		String description = request.getParameter("description");

		try {
			if (CategoryDAO.getInstance().updateCategory(id, title, description)) {
				setSuccessCode(request, SuccessCodes.UPDATE_CONTACT_SUCCESS);
				forward(request, response, "/admin/post/category");
			} else {
				setErrorCode(request, ErrorCodes.UPDATE_CONTACT_FAIL);
				forward(request, response, "/admin/post/category");
			}
		} catch (IOException | ServletException e) {
			e.printStackTrace();
		}
	}

	private void appove(HttpServletRequest request, HttpServletResponse response) {
		int id = request.getParameter("id") == null ? 0 : Integer.valueOf(request.getParameter("id"));
		boolean isAccepted = request.getParameter("accept") != null;

		try {
			if (PostDAO.getInstance().updatePost(id, isAccepted ? PostStatus.ACCEPTED : PostStatus.DECLINED)) {
				setSuccessCode(request, SuccessCodes.APPROVE_POST_SUCCESS);
				forward(request, response, "/admin/post");
			} else {
				setErrorCode(request, ErrorCodes.APPROVE_POST_ERROR);
				forward(request, response, "/admin/post");
			}
		} catch (IOException | ServletException e) {
			e.printStackTrace();
		}
	}

}
