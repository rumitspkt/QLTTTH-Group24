package bases;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.Response;

import utils.MapUtil;

public abstract class BaseServlet extends HttpServlet implements InitServlet {
	private static final long serialVersionUID = 1L;

//	private String type = setUrlPattern();

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		initServlet();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		handleGet(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		handlePost(request, response);
	}

	protected String getAction(HttpServletRequest request) {
		return request.getRequestURI().substring(request.getContextPath().length());
	}

	protected void sendRedirect(HttpServletRequest request, HttpServletResponse response, String subUri)
			throws IOException {
		response.sendRedirect(request.getContextPath() + subUri);
	}

	protected void forward(HttpServletRequest request, HttpServletResponse response, String subUri)
			throws ServletException, IOException {
		request.getRequestDispatcher(subUri).forward(request, response);
	}

	protected void setSuccessCode(HttpServletRequest request, String message) {
		List<String> successes = (List<String>) request.getAttribute("successes");
		if(successes == null) {
			successes = new ArrayList<>();
		}
		successes.add(message);
		request.setAttribute("successes", successes);
	}
	
	protected void setSuccessCode(HttpServletRequest request, List<String> messages) {
		List<String> successes = (List<String>) request.getAttribute("successes");
		if(successes == null) {
			successes = new ArrayList<>();
		}
		successes.addAll(messages);
		request.setAttribute("successes", successes);
	}

	protected void setErrorCode(HttpServletRequest request, String message) {
		List<String> errors = (List<String>) request.getAttribute("errors");
		if(errors == null) {
			errors = new ArrayList<>();
		}
		errors.add(message);
		request.setAttribute("errors", errors);
	}
	
	protected void setErrorCode(HttpServletRequest request, List<String> messages) {
		List<String> errors = (List<String>) request.getAttribute("errors");
		if(errors == null) {
			errors = new ArrayList<>();
		}
		errors.addAll(messages);
		request.setAttribute("errors", errors);
	}
	
	protected void validate() {
		
	}

}
