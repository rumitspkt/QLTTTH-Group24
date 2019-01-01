package servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bases.BaseServlet;
import commons.PostStatus;
import daos.CategoryDAO;
import daos.PostDAO;
import daos.UserDAO;
import models.Category;
import models.Post;

@WebServlet(name = "PagePostServlet", urlPatterns = { "/post" })
public class PagePostServlet extends BaseServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public void initServlet() {
		// TODO Auto-generated method stub
		CategoryDAO.getInstance().initDatabaseManager(getServletContext());
		PostDAO.getInstance().initDatabaseManager(getServletContext());
		UserDAO.getInstance().initDatabaseManager(getServletContext());
	}

	@Override
	public void handleGet(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		switch (getAction(request)) {
		case "/post":
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

	public void showView(HttpServletRequest request, HttpServletResponse response) {
		List<Category> categories = CategoryDAO.getInstance().getCategories();
		request.setAttribute("mainCate1", categories.get(0));
		request.setAttribute("mainCate2", categories.get(1));
		request.setAttribute("mainCate3", categories.get(2));

		

		request.setAttribute("latestPosts", PostDAO.getInstance().getLatestPosts());

		request.setAttribute("categories", CategoryDAO.getInstance().getCategoriesWithNumberOfPosts());

		int category, id;
		try {
			if (request.getParameter("id") != null) {
				id = Integer.valueOf(request.getParameter("id"));
				Post post = PostDAO.getInstance().getPostDetail(id);
				request.setAttribute("post", post);
				request.setAttribute("lecturer", UserDAO.getInstance().getUser(post.getLecturer()));
				forward(request, response, "/jsp/page-post-detail.jsp");
			} else if (request.getParameter("category") != null) {
				category = Integer.valueOf(request.getParameter("category"));
				request.setAttribute("posts", PostDAO.getInstance().getPostsByCategoryAndStatus(category, PostStatus.ACCEPTED));
				forward(request, response, "/jsp/page-post.jsp");
			}else {
				request.setAttribute("posts", PostDAO.getInstance().getPostsByStatus(PostStatus.ACCEPTED));
				forward(request, response, "/jsp/page-post.jsp");
			}
			
		} catch (IOException | ServletException e) {
			e.printStackTrace();
		}
	}

}
