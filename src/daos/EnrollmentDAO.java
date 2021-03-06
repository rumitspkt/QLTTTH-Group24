package daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.LinkedList;
import java.util.List;

import bases.BaseDAO;
import models.Contact;
import models.Enrollment;

public class EnrollmentDAO extends BaseDAO{
	private static final EnrollmentDAO INSTANCE = new EnrollmentDAO();

    public static EnrollmentDAO getInstance() {
        return INSTANCE;
    }

    private EnrollmentDAO() {
    }
    
    public Enrollment getEnrollment(final int id) {
        try (Connection con = databaseManager.getConnection();
            PreparedStatement stmt = con.prepareStatement(
                    "SELECT id, course, student, enrolledDate, certificate, receivedCertificateDate FROM enrollments WHERE id = ? ")) {

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
    
    public Enrollment getEnrollment(final int student, int course) {
        try (Connection con = databaseManager.getConnection();
            PreparedStatement stmt = con.prepareStatement(
                    "SELECT id, course, student, enrolledDate, certificate, receivedCertificateDate FROM enrollments WHERE student = ? and course = ? ")) {

            stmt.setInt(1, student);
            stmt.setInt(2, course);

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

    private Enrollment fromRow(final ResultSet resultSet) throws SQLException {
        return new Enrollment(resultSet.getInt("id"),
        		resultSet.getInt("course"),
        		resultSet.getInt("student"),
        		resultSet.getTimestamp("enrolledDate"),
        		resultSet.getInt("certificate"),
        		resultSet.getTimestamp("receivedCertificateDate")
        		);
    }

   
    public int storeEnrollment(final Enrollment enrollment) {
        try (Connection con = databaseManager.getConnection();
             PreparedStatement stmt = con.prepareStatement(
                     "INSERT INTO enrollments (course, student) "
                     + "VALUES (?, ?)", Statement.RETURN_GENERATED_KEYS)) {

            stmt.setInt(1, enrollment.getCourse());
            stmt.setInt(2, enrollment.getStudent());
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
    
    public boolean updateEnrollment(final int id, int certificate, Timestamp receivedCertificateDate) {
    	try(Connection con = databaseManager.getConnection();
        		PreparedStatement stmt = con.prepareStatement(
                        "UPDATE enrollments SET certificate = ?, receivedCertificateDate = ? where id = ?")) {

               stmt.setInt(1, certificate);
               stmt.setTimestamp(2, receivedCertificateDate);
               stmt.setInt(3, id);
               return stmt.executeUpdate() > 0;
        	} catch (SQLException e) {
        		e.printStackTrace();
        		return false;
        	}
    }
}
