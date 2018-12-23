package daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;

import bases.BaseDAO;
import models.Certification;
import models.Contact;

public class CertificationDAO extends BaseDAO {
	private static final CertificationDAO INSTANCE = new CertificationDAO();

    public static CertificationDAO getInstance() {
        return INSTANCE;
    }

    private CertificationDAO() {
    }

    private Certification fromRow(final ResultSet resultSet) throws SQLException {
        return new Certification(resultSet.getInt("id"), resultSet.getString("title"), resultSet.getString("description"));
    }
    
    private Certification fromRowMoreInfo(final ResultSet resultSet) throws SQLException {
        return new Certification(resultSet.getInt("id"), 
        		resultSet.getString("firstName"), 
        		resultSet.getString("lastName"),
        		resultSet.getTimestamp("birthDay"),
        		resultSet.getString("address"),
        		resultSet.getString("title"),
        		resultSet.getTimestamp("receivedCertificateDate")
        		);
    }

   
    public List<Certification> getCertifications() {
        try (Connection con = databaseManager.getConnection();
            PreparedStatement stmt = con.prepareStatement(
                    "SELECT id, title, description " +
                    "FROM certificates ORDER BY id ASC")) {

            final List<Certification> certifications = new LinkedList<>();
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                	certifications.add(fromRow(rs));
                }
            }

            return certifications;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
    
    public List<Certification> getCertificationsByCourse(int id) {
        try (Connection con = databaseManager.getConnection();
            PreparedStatement stmt = con.prepareStatement(
                    "SELECT users.id,users.firstName,users.lastName,users.birthDay,users.address, certificates.title, enrollments.receivedCertificateDate "
                    + "FROM users INNER JOIN enrollments ON users.id=enrollments.student INNER JOIN certificates ON enrollments.certificate=certificates.id "
                    + "WHERE enrollments.course= ? ORDER BY users.firstName"
            		)) {
        	stmt.setInt(1, id);
            final List<Certification> certifications = new LinkedList<>();
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                	certifications.add(fromRowMoreInfo(rs));
                }
            }

            return certifications;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public boolean storeCertification(final Certification certification) {
        try (Connection con = databaseManager.getConnection();
             PreparedStatement stmt = con.prepareStatement(
                     "INSERT INTO certificates (title, description) "
                     + "VALUES (?, ?)", Statement.RETURN_GENERATED_KEYS)) {

            stmt.setString(1, certification.getTitle());
            stmt.setString(2, certification.getDescription());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean deleteCertification(final int id) {
    	try(Connection con = databaseManager.getConnection();
    		PreparedStatement stmt = con.prepareStatement(
                    "DELETE FROM certificates where id = ?")) {

           stmt.setInt(1, id);
           return stmt.executeUpdate() > 0;
    	} catch (SQLException e) {
    		e.printStackTrace();
    		return false;
    	}
    }
    
    public boolean updateCertification(final int id, final String title, final String description) {
    	try(Connection con = databaseManager.getConnection();
        		PreparedStatement stmt = con.prepareStatement(
                        "UPDATE certificates SET title = ?, description = ? where id = ?")) {

               stmt.setString(1, title);
               stmt.setString(2, description);
               stmt.setInt(3, id);
               return stmt.executeUpdate() > 0;
        	} catch (SQLException e) {
        		e.printStackTrace();
        		return false;
        	}
    }

}
