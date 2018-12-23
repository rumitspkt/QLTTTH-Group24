package daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;

import bases.BaseDAO;
import models.Contact;
import models.Course;

public class CourseDAO extends BaseDAO{
	private static final CourseDAO INSTANCE = new CourseDAO();

    public static CourseDAO getInstance() {
        return INSTANCE;
    }

    private CourseDAO() {
    }
    
    public Course getCourse(final int id) {
        try (Connection con = databaseManager.getConnection();
            PreparedStatement stmt = con.prepareStatement(
                    "SELECT id, title, shortDescription, objective, eligibility, outline, schedules, totalSeat, availableSeat, fee, lecturer, date "
                    + "FROM courses WHERE id = ? ")) {

            stmt.setInt(1, id);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return fromRow(rs);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    private Course fromRow(final ResultSet resultSet) throws SQLException {
        return new Course(resultSet.getInt("id"),
        		resultSet.getString("title"), 
        		resultSet.getString("shortDescription"),
        		resultSet.getString("objective"),
        		resultSet.getString("eligibility"),
        		resultSet.getString("outline"),
        		resultSet.getString("schedules"),
        		resultSet.getInt("totalSeat"),
        		resultSet.getInt("availableSeat"),
        		resultSet.getFloat("fee"),
        		resultSet.getInt("lecturer"),
        		resultSet.getTimestamp("date")
        		);
    }

   
    public List<Course> getCourses() {
        try (Connection con = databaseManager.getConnection();
            PreparedStatement stmt = con.prepareStatement(
                    "SELECT id, title, shortDescription, objective, eligibility, outline, schedules, totalSeat, availableSeat, fee, lecturer, date " +
                    "FROM courses ORDER BY id ASC")) {

            final List<Course> courses = new LinkedList<>();
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                	courses.add(fromRow(rs));
                }
            }

            return courses;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public boolean storeCourse(final Course course) {
        try (Connection con = databaseManager.getConnection();
             PreparedStatement stmt = con.prepareStatement(
                     "INSERT INTO courses (title, shortDescription, objective, eligibility, outline, schedules, totalSeat, fee, lecturer, date) "
                     + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS)) {

            stmt.setString(1, course.getTitle());
            stmt.setString(2, course.getShortDescription());
            stmt.setString(3, course.getObjective());
            stmt.setString(4, course.getEligibility());
            stmt.setString(5, course.getOutline());
            stmt.setString(6, course.getSchedules());
            stmt.setInt(7, course.getTotalSeat());
            stmt.setFloat(8, course.getFee());
            stmt.setInt(9, course.getLecturer());
            stmt.setTimestamp(10, course.getDate());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean deleteCourse(final int id) {
    	try(Connection con = databaseManager.getConnection();
    		PreparedStatement stmt = con.prepareStatement(
                    "DELETE FROM courses where id = ?")) {

           stmt.setInt(1, id);
           return stmt.executeUpdate() > 0;
    	} catch (SQLException e) {
    		e.printStackTrace();
    		return false;
    	}
    }
    
    public boolean updateCourse(final int id, int availableSeat) {
    	try(Connection con = databaseManager.getConnection();
        		PreparedStatement stmt = con.prepareStatement(
                        "UPDATE courses SET availableSeat = ? where id = ?")) {

               stmt.setInt(1, availableSeat);
               stmt.setInt(2, id);
               return stmt.executeUpdate() > 0;
        	} catch (SQLException e) {
        		e.printStackTrace();
        		return false;
        	}
    }
}