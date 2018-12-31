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
import models.Score;

public class ScoreDAO extends BaseDAO{
	private static final ScoreDAO INSTANCE = new ScoreDAO();

    public static ScoreDAO getInstance() {
        return INSTANCE;
    }

    private ScoreDAO() {
    }
    

    private Score fromRow(final ResultSet resultSet) throws SQLException {
        return new Score(resultSet.getInt("id"),
        		resultSet.getString("firstName"), 
        		resultSet.getString("lastName"),
        		resultSet.getTimestamp("birthDay"),
        		resultSet.getString("address"),
        		resultSet.getFloat("firstScore"),
        		resultSet.getFloat("secondScore"),
        		resultSet.getInt("enrollmentId")
        		);
    }

   
    public List<Score> getScoreByCourse(int id) {
        try (Connection con = databaseManager.getConnection();
            PreparedStatement stmt = con.prepareStatement(
	                    "SELECT users.id,users.firstName,users.lastName,users.birthDay,users.address,scores.firstScore,scores.secondScore, enrollments.id as enrollmentId "
	                    + "FROM users INNER JOIN enrollments ON users.id=enrollments.student INNER JOIN scores ON enrollments.id=scores.enrollment "
	                    + "WHERE enrollments.course = ? ORDER BY users.firstName")) {

        	stmt.setInt(1, id);
        	
            final List<Score> scores = new LinkedList<>();
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                	scores.add(fromRow(rs));
                }
            }

            return scores;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public boolean storeScore(final Score score) {
        try (Connection con = databaseManager.getConnection();
             PreparedStatement stmt = con.prepareStatement(
                     "INSERT INTO scores (firstScore, secondScore, enrollment) "
                     + "VALUES (?, ?, ?)", Statement.RETURN_GENERATED_KEYS)) {
        	stmt.setFloat(1, score.getFirstScore());
        	stmt.setFloat(2, score.getSecondScore());
        	stmt.setInt(3, score.getEnrollment());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean updateScore(final int enrollment, final float firstScore, final float secondScore) {
    	try(Connection con = databaseManager.getConnection();
        		PreparedStatement stmt = con.prepareStatement(
                        "UPDATE scores SET firstScore = ?, secondScore = ? where enrollment = ?")) {

               stmt.setFloat(1, firstScore);
               stmt.setFloat(2, secondScore);
               stmt.setInt(3, enrollment);
               return stmt.executeUpdate() > 0;
        	} catch (SQLException e) {
        		e.printStackTrace();
        		return false;
        	}
    }
}
