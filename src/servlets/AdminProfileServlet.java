package servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import bases.BaseServlet;
import commons.ErrorCodes;
import commons.SuccessCodes;
import daos.ContactDAO;
import daos.UserDAO;
import models.User;
import utils.HashUtil;
import utils.ValidateUtil;

@WebServlet(name = "AdminProfileServlet", urlPatterns = { "/admin/profile", "/admin/profile/changePassword",
		"/admin/profile/changeImage", "/admin/profile/edit" })
public class AdminProfileServlet extends BaseServlet {

	// location to store file uploaded
	private static final String UPLOAD_DIRECTORY = "upload";

	// upload settings
	private static final int MEMORY_THRESHOLD = 1024 * 1024 * 3; // 3MB
	private static final int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
	private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50; // 50MB

	@Override
	public void initServlet() {
		// TODO Auto-generated method stub
		UserDAO.getInstance().initDatabaseManager(getServletContext());
	}

	@Override
	public void handleGet(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		switch (getAction(request)) {
		case "/admin/profile":
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
		case "/admin/profile/edit":
			editProfile(request, response);
			break;
		case "/admin/profile/changeImage":
			editImage(request, response);
			break;
		case "/admin/profile/changePassword":
			editPass(request, response);
			break;
		default:
			handleGet(request, response);
			break;
		}
	}

	private void showView(HttpServletRequest request, HttpServletResponse response) {
		try {
			forward(request, response, "/jsp/admin/admin-profile.jsp");
		} catch (IOException | ServletException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	private void editProfile(HttpServletRequest request, HttpServletResponse response) {
		User user = (User) request.getSession().getAttribute("user");
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String maxim = request.getParameter("maxim");
		String address = request.getParameter("address");
		String email = request.getParameter("email");

		try {
			if (UserDAO.getInstance().updateUser(user.getId(), user.getHashPassword(), firstName, lastName, address,
					user.getUrlAvatar(), email, maxim)) {
				setSuccessCode(request, SuccessCodes.UPDATE_PROFILE_SUCCESS);
				user.setFirstName(firstName);
				user.setLastName(lastName);
				user.setMaxim(maxim);
				user.setAddress(address);
				user.setEmail(email);
				forward(request, response, "/admin/profile");
			} else {
				setErrorCode(request, ErrorCodes.UPDATE_PROFILE_ERROR);
				forward(request, response, "/admin/profile");
			}
		} catch (IOException | ServletException e) {
			e.printStackTrace();
		}
	}

	private void editPass(HttpServletRequest request, HttpServletResponse response) {
		User user = (User) request.getSession().getAttribute("user");

		String currentPassword = request.getParameter("currentPassword");
		String newPassword = request.getParameter("newPassword");
		String confirmPassword = request.getParameter("confirmPassword");

		try {
			if (!HashUtil.compareHash(user.getHashPassword(), currentPassword)) {
				setErrorCode(request, ErrorCodes.PASSWORD_WRONG);
				forward(request, response, "/admin/profile");
				return;
			}

			if (!newPassword.equals(confirmPassword)) {
				setErrorCode(request, ErrorCodes.CONFIRM_PASSWORD_NOT_EQUAL);
				forward(request, response, "/admin/profile");
				return;
			}

			List<String> validationErrors = new ValidateUtil().candidate(newPassword, "NEW_PASSWORD").validateLength(6)
					.getResults();

			if (validationErrors != null) {
				setErrorCode(request, validationErrors);
				forward(request, response, "/admin/profile");
				return;
			}

			if (UserDAO.getInstance().updateUser(user.getId(), HashUtil.getHash(newPassword), user.getFirstName(),
					user.getLastName(), user.getAddress(), user.getUrlAvatar(), user.getEmail(), user.getMaxim())) {
				setSuccessCode(request, SuccessCodes.CHANGE_PASSWORD_SUCCESS);
				user.setHashPassword(HashUtil.getHash(newPassword));
				forward(request, response, "/admin/profile");
			} else {
				setErrorCode(request, ErrorCodes.CHANGE_PASSWORD_ERROR);
				forward(request, response, "/admin/profile");
			}
		} catch (IOException | ServletException e) {
			e.printStackTrace();
		}
	}

	private void editImage(HttpServletRequest request, HttpServletResponse response) {
		User user = (User) request.getSession().getAttribute("user");

		// checks if the request actually contains upload file
		if (!ServletFileUpload.isMultipartContent(request)) {
			// if not, we stop here
			PrintWriter writer;
			try {
				writer = response.getWriter();
				writer.println("Error: Form must has enctype=multipart/form-data.");
				writer.flush();
				return;
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		// configures upload settings
		DiskFileItemFactory factory = new DiskFileItemFactory();
		// sets memory threshold - beyond which files are stored in disk
		factory.setSizeThreshold(MEMORY_THRESHOLD);
		// sets temporary location to store files
		factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

		ServletFileUpload upload = new ServletFileUpload(factory);

		// sets maximum size of upload file
		upload.setFileSizeMax(MAX_FILE_SIZE);

		// sets maximum size of request (include file + form data)
		upload.setSizeMax(MAX_REQUEST_SIZE);

		// constructs the directory path to store upload file
		// this path is relative to application's directory
		String uploadPath = getServletContext().getContextPath()+ File.separator + UPLOAD_DIRECTORY;

		// creates the directory if it does not exist
		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists()) {
			uploadDir.mkdir();
		}

		try {
			// parses the request's content to extract file data
			@SuppressWarnings("unchecked")
			List<FileItem> formItems = upload.parseRequest(request);

			if (formItems != null && formItems.size() > 0) {
				// iterates over form's fields
				for (FileItem item : formItems) {
					// processes only fields that are not form fields
					if (!item.isFormField()) {
						String fileName = new File(item.getName()).getName();
						String filePath = uploadPath + File.separator + fileName;
						File storeFile = new File(filePath);

						// saves the file on disk
						item.write(storeFile);
//						request.setAttribute("message",
//								"Upload has been done successfully >>" + UPLOAD_DIRECTORY + "/" + fileName);
						System.out.println("URL Upload:" + filePath + "/" + fileName);
						setSuccessCode(request, SuccessCodes.CHANGE_IMAGE_SUCCESS);
					}
				}
			}
		} catch (Exception ex) {
//			request.setAttribute("message", "There was an error: " + ex.getMessage());
			setErrorCode(request, ErrorCodes.CHANGE_IMAGE_ERROR);
		}
		// redirects client to message page
		try {
			forward(request, response, "/admin/profile");
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
