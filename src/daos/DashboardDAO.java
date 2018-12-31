package daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import bases.BaseDAO;
import models.Certification;
import models.Dashboard;

public class DashboardDAO extends BaseDAO {
	private static final DashboardDAO INSTANCE = new DashboardDAO();

	public static DashboardDAO getInstance() {
		return INSTANCE;
	}

	private DashboardDAO() {
	}

	public Dashboard summarizeForLecturer(int lecturer) {
		Dashboard dashboard = new Dashboard(getNumberOfStudents(lecturer), getNumberOfPosts(lecturer), getNumberOfGrantedCertificates(lecturer), getTotalEarnings(lecturer));
		return dashboard;
	}
	
	public Dashboard summarize() {
		Dashboard dashboard = new Dashboard(getTotalEarnings(), getNumberOfPosts(), getNumberOfTypeCertificates(), getNumberOfUsers(), getNumberOfLecturer());
		return dashboard;
	}
	
	private int getNumberOfPosts(int lecturer) {
		try (Connection con = databaseManager.getConnection();
				PreparedStatement stmt = con.prepareStatement(
						"select COUNT(id) as posts  from posts WHERE posts.lecturer = ?")) {

			stmt.setInt(1, lecturer);

			try (ResultSet rs = stmt.executeQuery()) {
				if (rs.next()) {
					return rs.getInt("posts");
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	private int getNumberOfPosts() {
		try (Connection con = databaseManager.getConnection();
				PreparedStatement stmt = con.prepareStatement(
						"select COUNT(id) as posts  from posts")) {

			try (ResultSet rs = stmt.executeQuery()) {
				if (rs.next()) {
					return rs.getInt("posts");
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	private int getNumberOfStudents(int lecturer) {
		try (Connection con = databaseManager.getConnection();
				PreparedStatement stmt = con.prepareStatement(
						"select COUNT(enrollments.id) as students from enrollments join courses on enrollments.course = courses.id where courses.lecturer = ?")) {

			stmt.setInt(1, lecturer);

			try (ResultSet rs = stmt.executeQuery()) {
				if (rs.next()) {
					return rs.getInt("students");
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	private int getNumberOfGrantedCertificates(int lecturer) {
		try (Connection con = databaseManager.getConnection();
				PreparedStatement stmt = con.prepareStatement(
						"select COUNT(enrollments.id) as certificates from enrollments join courses on enrollments.course = courses.id where enrollments.certificate != 0 and courses.lecturer = ?")) {

			stmt.setInt(1, lecturer);

			try (ResultSet rs = stmt.executeQuery()) {
				if (rs.next()) {
					return rs.getInt("certificates");
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	private float getTotalEarnings(int lecturer) {
		try (Connection con = databaseManager.getConnection();
				PreparedStatement stmt = con.prepareStatement(
						"select SUM(students * fee) as total from (select COUNT(enrollments.id) as students, course, courses.fee from enrollments join courses on enrollments.course = courses.id WHERE courses.lecturer = ? GROUP BY enrollments.course ) as temp")) {

			stmt.setInt(1, lecturer);

			try (ResultSet rs = stmt.executeQuery()) {
				if (rs.next()) {
					return rs.getFloat("total");
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	private float getTotalEarnings() {
		try (Connection con = databaseManager.getConnection();
				PreparedStatement stmt = con.prepareStatement(
						"select SUM(students * fee) as total from (select COUNT(enrollments.id) as students, course, courses.fee from enrollments join courses on enrollments.course = courses.id GROUP BY enrollments.course ) as temp")) {

			try (ResultSet rs = stmt.executeQuery()) {
				if (rs.next()) {
					return rs.getFloat("total");
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	private int getNumberOfUsers() {
		try (Connection con = databaseManager.getConnection();
				PreparedStatement stmt = con.prepareStatement(
						"select count(id) as users from users")) {

			try (ResultSet rs = stmt.executeQuery()) {
				if (rs.next()) {
					return rs.getInt("users");
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	private int getNumberOfLecturer() {
		try (Connection con = databaseManager.getConnection();
				PreparedStatement stmt = con.prepareStatement(
						"select count(id) as lecturers from users where type = 'LECTURER';")) {

			try (ResultSet rs = stmt.executeQuery()) {
				if (rs.next()) {
					return rs.getInt("lecturers");
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	private int getNumberOfTypeCertificates() {
		try (Connection con = databaseManager.getConnection();
				PreparedStatement stmt = con.prepareStatement(
						"select count(id) as certificates from certificates")) {

			try (ResultSet rs = stmt.executeQuery()) {
				if (rs.next()) {
					return rs.getInt("certificates");
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
}
