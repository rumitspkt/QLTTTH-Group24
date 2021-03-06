package daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;

import org.omg.CORBA.PUBLIC_MEMBER;
import org.omg.PortableServer.ID_ASSIGNMENT_POLICY_ID;

import bases.BaseDAO;
import models.Contact;
import models.Course;

public class CourseDAO extends BaseDAO {
	private static final CourseDAO INSTANCE = new CourseDAO();

	public static CourseDAO getInstance() {
		return INSTANCE;
	}

	private CourseDAO() {
	}

	public Course getCourse(final int id) {
		try (Connection con = databaseManager.getConnection();
				PreparedStatement stmt = con.prepareStatement(
						"SELECT courses.id,courses.title,shortDescription,objective,eligibility,outline,schedules,totalSeat,availableSeat,fee,lecturer,date,CONCAT(users.firstName,' ',users.lastName) AS lecturerName,categories.title AS category, categories.id AS categoryId, posterUrl "
								+ "FROM courses " + "JOIN users ON lecturer=users.id "
								+ "JOIN classificationOfCourses ON classificationOfCourses.course=courses.id "
								+ "JOIN categories ON classificationOfCourses.category=categories.id "
								+ "WHERE courses.id = ?")) {

			stmt.setInt(1, id);

			try (ResultSet rs = stmt.executeQuery()) {
				if (rs.next()) {
					return fromRowDetail(rs);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	

	private Course fromRow(final ResultSet resultSet) throws SQLException {
		return new Course(resultSet.getInt("id"), resultSet.getString("title"), resultSet.getString("shortDescription"),
				resultSet.getString("objective"), resultSet.getString("eligibility"), resultSet.getString("outline"),
				resultSet.getString("schedules"), resultSet.getInt("totalSeat"), resultSet.getInt("availableSeat"),
				resultSet.getFloat("fee"), resultSet.getInt("lecturer"), resultSet.getTimestamp("date"));
	}

	private Course fromRowDetail(final ResultSet resultSet) throws SQLException {
		return new Course(resultSet.getInt("id"), resultSet.getString("title"), resultSet.getString("shortDescription"),
				resultSet.getString("objective"), resultSet.getString("eligibility"), resultSet.getString("outline"),
				resultSet.getString("schedules"), resultSet.getInt("totalSeat"), resultSet.getInt("availableSeat"),
				resultSet.getFloat("fee"), resultSet.getInt("lecturer"), resultSet.getTimestamp("date"),
				resultSet.getString("lecturerName"), resultSet.getString("category"), resultSet.getInt("categoryId"), resultSet.getString("posterUrl"));
	}

	public List<Course> getCourses() {
		try (Connection con = databaseManager.getConnection();
				PreparedStatement stmt = con.prepareStatement(
						"SELECT courses.id,courses.title,shortDescription,objective,eligibility,outline,schedules,totalSeat,availableSeat,fee,lecturer,date,CONCAT(users.firstName,' ',users.lastName) AS lecturerName,categories.title AS category, categories.id AS categoryId, posterUrl "
								+ "FROM courses " + "JOIN users ON lecturer=users.id "
								+ "JOIN classificationOfCourses ON classificationOfCourses.course=courses.id "
								+ "JOIN categories ON classificationOfCourses.category=categories.id ORDER BY id ASC")) {

			final List<Course> courses = new LinkedList<>();
			try (ResultSet rs = stmt.executeQuery()) {
				while (rs.next()) {
					courses.add(fromRowDetail(rs));
				}
			}

			return courses;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public List<Course> getPopularCourses() {
		try (Connection con = databaseManager.getConnection();
				PreparedStatement stmt = con.prepareStatement(
						"SELECT courses.id,courses.title,shortDescription,objective,eligibility,outline,schedules,totalSeat,availableSeat,fee,lecturer,date,CONCAT(users.firstName,' ',users.lastName) AS lecturerName,categories.title AS category,categories.id AS categoryId, posterUrl FROM courses JOIN users ON lecturer=users.id JOIN classificationOfCourses ON classificationOfCourses.course=courses.id JOIN categories ON classificationOfCourses.category=categories.id ORDER BY availableSeat DESC LIMIT 5")) {

			final List<Course> courses = new LinkedList<>();
			try (ResultSet rs = stmt.executeQuery()) {
				while (rs.next()) {
					courses.add(fromRowDetail(rs));
				}
			}

			return courses;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	public List<Course> getCoursesByCategory(int category) {
		try (Connection con = databaseManager.getConnection();
				PreparedStatement stmt = con.prepareStatement(
						"SELECT courses.id,courses.title,shortDescription,objective,eligibility,outline,schedules,totalSeat,availableSeat,fee,lecturer,date,CONCAT(users.firstName,' ',users.lastName) AS lecturerName,categories.title AS category, categories.id AS categoryId "
								+ "FROM courses " + "JOIN users ON lecturer=users.id "
								+ "JOIN classificationOfCourses ON classificationOfCourses.course=courses.id "
								+ "JOIN categories ON classificationOfCourses.category=categories.id "
								+ "WHERE categories.id=?")) {
			stmt.setInt(1, category);

			final List<Course> courses = new LinkedList<>();
			try (ResultSet rs = stmt.executeQuery()) {
				while (rs.next()) {
					courses.add(fromRowDetail(rs));
				}
			}

			return courses;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	public List<Course> getCoursesByLecturer(int lecturer) {
		try (Connection con = databaseManager.getConnection();
				PreparedStatement stmt = con.prepareStatement(
						"SELECT courses.id,courses.title,shortDescription,objective,eligibility,outline,schedules,totalSeat,availableSeat,fee,lecturer,date,CONCAT(users.firstName,' ',users.lastName) AS lecturerName,categories.title AS category, categories.id AS categoryId "
								+ "FROM courses " + "JOIN users ON lecturer=users.id "
								+ "JOIN classificationOfCourses ON classificationOfCourses.course=courses.id "
								+ "JOIN categories ON classificationOfCourses.category=categories.id "
								+ "WHERE users.id=?")) {
			stmt.setInt(1, lecturer);

			final List<Course> courses = new LinkedList<>();
			try (ResultSet rs = stmt.executeQuery()) {
				while (rs.next()) {
					courses.add(fromRowDetail(rs));
				}
			}

			return courses;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	public int storeCourse(final Course course) {
		try (Connection con = databaseManager.getConnection();
				PreparedStatement stmt = con.prepareStatement(
						"INSERT INTO courses (title, shortDescription, objective, eligibility, outline, schedules, totalSeat, fee, lecturer) "
								+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)",
						Statement.RETURN_GENERATED_KEYS)) {

			stmt.setString(1, course.getTitle());
			stmt.setString(2, course.getShortDescription());
			stmt.setString(3, course.getObjective());
			stmt.setString(4, course.getEligibility());
			stmt.setString(5, course.getOutline());
			stmt.setString(6, course.getSchedules());
			stmt.setInt(7, course.getTotalSeat());
			stmt.setFloat(8, course.getFee());
			stmt.setInt(9, course.getLecturer());
			stmt.executeUpdate();
			int key = -1;
			ResultSet generatedKeys = stmt.getGeneratedKeys();
			if (generatedKeys.next()) {
				key = generatedKeys.getInt(1);
			}
			return key;
		} catch (SQLException e) {
			e.printStackTrace();
			return -1;
		}
	}

	public boolean deleteCourse(final int id) {
		try (Connection con = databaseManager.getConnection();
				PreparedStatement stmt = con.prepareStatement("DELETE FROM courses where id = ?")) {

			stmt.setInt(1, id);
			return stmt.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean deleteClassification(final int course) {
		try (Connection con = databaseManager.getConnection();
				PreparedStatement stmt = con.prepareStatement("DELETE FROM classificationOfCourses where course = ?")) {

			stmt.setInt(1, course);
			return stmt.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean updateCourse(Course course) {
		try (Connection con = databaseManager.getConnection();
				PreparedStatement stmt = con.prepareStatement(
						"UPDATE courses SET title = ?, shortDescription = ?, objective = ?, eligibility = ?, outline = ?, schedules = ?, totalSeat = ?, fee = ?, lecturer = ? where id = ?")) {
//			PreparedStatement stmt = con.prepareStatement(
//					"UPDATE courses SET title = 'edited123123', shortDescription = 'edited', objective = 'edited', eligibility = 'edited', outline = 'edited', schedules = 'edited', totalSeat = 99, fee = 99.9, lecturer = 1 where id = 1")) {
			stmt.setString(1, course.getTitle());
			stmt.setString(2, course.getShortDescription());
			stmt.setString(3, course.getObjective());
			stmt.setString(4, course.getEligibility());
			stmt.setString(5, course.getOutline());
			stmt.setString(6, course.getSchedules());
			stmt.setInt(7, course.getTotalSeat());
			stmt.setFloat(8, course.getFee());
			stmt.setInt(9, course.getLecturer());
			stmt.setInt(10, course.getId());
			return stmt.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean updateCourse(final int id, int availableSeat) {
		try (Connection con = databaseManager.getConnection();
				PreparedStatement stmt = con.prepareStatement("UPDATE courses SET availableSeat = ? where id = ?")) {

			stmt.setInt(1, availableSeat);
			stmt.setInt(2, id);
			return stmt.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean updateSeatCourse(final int id) {
		try (Connection con = databaseManager.getConnection();
				PreparedStatement stmt = con.prepareStatement("UPDATE courses SET availableSeat = availableSeat + 1 where id = ?")) {

			stmt.setInt(1, id);
			return stmt.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean classifyCourse(final int course, final int category) {
		try (Connection con = databaseManager.getConnection();
				PreparedStatement stmt = con
						.prepareStatement("INSERT INTO classificationOfCourses (course,category) VALUES (?,?)")) {

			stmt.setInt(1, course);
			stmt.setInt(2, category);
			return stmt.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean updateClassifyCourse(int course, int category) {
		try (Connection con = databaseManager.getConnection();
				PreparedStatement stmt = con
						.prepareStatement("UPDATE classificationOfCourses SET category = ? where course = ?")) {

			stmt.setInt(1, category);
			stmt.setInt(2, course);
			return stmt.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

}
