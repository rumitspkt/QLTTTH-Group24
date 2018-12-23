package daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import bases.BaseDAO;
import models.Page;
import models.User;

public class PageDAO extends BaseDAO {
	private static final PageDAO INSTANCE = new PageDAO();

    public static PageDAO getInstance() {
        return INSTANCE;
    }

    private PageDAO() {
    }
    
    private Page fromRow(final ResultSet resultSet) throws SQLException {
        return new Page(resultSet.getString("type"), 
        		resultSet.getString("content")
        		);
    }
    
    public boolean updatePage(final String type, final String content) {
    	try(Connection con = databaseManager.getConnection();
        		PreparedStatement stmt = con.prepareStatement(
                        "UPDATE pages SET content = ? where type = ?")) {

               stmt.setString(1, content);
               stmt.setString(2, type);
               return stmt.executeUpdate() > 0;
        	} catch (SQLException e) {
        		e.printStackTrace();
        		return false;
        	}
    }
    
    public Page getPage(final String type) {
        try (Connection con = databaseManager.getConnection();
            PreparedStatement stmt = con.prepareStatement(
                    "SELECT type, content "
                    + "FROM pages WHERE type = ? ")) {

            stmt.setString(1, type);

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
}
