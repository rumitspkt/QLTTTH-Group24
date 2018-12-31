package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bases.BaseServlet;
import commons.ErrorCodes;
import commons.PostStatus;
import commons.SuccessCodes;
import daos.CategoryDAO;
import daos.CourseDAO;
import daos.PostDAO;
import models.Category;
import models.Post;
import models.User;

@WebServlet(name = "LecturerPostServlet", urlPatterns = { "/lecturer/post/new", "/lecturer/post" })
public class LecturerPostServlet extends BaseServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public void initServlet() {
		// TODO Auto-generated method stub
		PostDAO.getInstance().initDatabaseManager(getServletContext());
		CategoryDAO.getInstance().initDatabaseManager(getServletContext());
	}

	@Override
	public void handleGet(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		switch (getAction(request)) {
		case "/lecturer/post":
			showView(request, response);
			break;
		case "/lecturer/post/new":
			showViewNewPost(request, response);
		default:
			break;
		}
	}

	@Override
	public void handlePost(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		switch (getAction(request)) {
		case "/lecturer/post/new":
			create(request, response);
			break;
		default:
			handleGet(request, response);
			break;
		}
	}
	
	public void showView(HttpServletRequest request, HttpServletResponse response) {
//		User user = (User) request.getSession().getAttribute("user");
		
		int category = 0;
		if (request.getParameter("category") != null) {
			category = Integer.valueOf(request.getParameter("category"));
		}
		if (category == 0) {
			request.setAttribute("posts", PostDAO.getInstance().getPosts());
			request.setAttribute("categories", CategoryDAO.getInstance().getCategories());
			request.setAttribute("selected", 0);
		} else {
			request.setAttribute("posts",
					PostDAO.getInstance().getPostsByCategory(category));
			request.setAttribute("categories", CategoryDAO.getInstance().getCategories());
			request.setAttribute("selected", category);
		}
		
		try {
			forward(request, response, "/jsp/lecturer/lecturer-post.jsp");
		} catch (IOException | ServletException e) {
			e.printStackTrace();
		}
	}
	
	public void showViewNewPost(HttpServletRequest request, HttpServletResponse response) {
		try {
			forward(request, response, "/jsp/lecturer/lecturer-new-post.jsp");
		} catch (IOException | ServletException e) {
			e.printStackTrace();
		}
	}
	
	private void create(HttpServletRequest request, HttpServletResponse response) {
		User user = (User) request.getSession().getAttribute("user");
		
		String title = request.getParameter("title");
		String summary = request.getParameter("summary");
		String posterUrl = request.getParameter("posterUrl");
		String content = request.getParameter("content");
		
		int categoryId = request.getParameter("categoryId") != null ? Integer.valueOf(request.getParameter("categoryId")) : 0;

		Post post = new Post(posterUrl, user.getId(), title, summary, content);

		try {
			int key = PostDAO.getInstance().storePost(post);
			if(key > 0) {
				if(PostDAO.getInstance().classifyPost(key, categoryId)) {
					setSuccessCode(request, SuccessCodes.CREATE_POST_SUCCESS );
					forward(request, response, "/lecturer/post");
					return;
				}
			}
			setErrorCode(request, ErrorCodes.CREATE_POST_ERROR);
			forward(request, response, "/lecturer/post");
		} catch (IOException | ServletException e) {
			e.printStackTrace();
		}
	}
}
