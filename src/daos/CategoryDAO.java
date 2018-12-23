package daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;

import bases.BaseDAO;
import models.Category;
import models.Contact;

public class CategoryDAO extends BaseDAO {
	private static final CategoryDAO INSTANCE = new CategoryDAO();

    public static CategoryDAO getInstance() {
        return INSTANCE;
    }

    private CategoryDAO() {
    }
    
    public Category getCategory(final int id) {
        try (Connection con = databaseManager.getConnection();
            PreparedStatement stmt = con.prepareStatement(
                    "SELECT id, title, description FROM categories WHERE id = ? ")) {

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

    private Category fromRow(final ResultSet resultSet) throws SQLException {
        return new Category(resultSet.getInt("id"), resultSet.getString("title"), resultSet.getString("description"));
    }

   
    public List<Category> getCategories() {
        try (Connection con = databaseManager.getConnection();
            PreparedStatement stmt = con.prepareStatement(
                    "SELECT id, title, description " +
                    "FROM categories ORDER BY id ASC")) {

            final List<Category> categories = new LinkedList<>();
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    categories.add(fromRow(rs));
                }
            }

            return categories;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public boolean storeCategory(final Category category) {
        try (Connection con = databaseManager.getConnection();
             PreparedStatement stmt = con.prepareStatement(
                     "INSERT INTO categories (title, description) "
                     + "VALUES (?, ?)", Statement.RETURN_GENERATED_KEYS)) {

            stmt.setString(1, category.getTitle());
            stmt.setString(2, category.getDescription());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean deleteCategory(final int id) {
    	try(Connection con = databaseManager.getConnection();
    		PreparedStatement stmt = con.prepareStatement(
                    "DELETE FROM categories where id = ?")) {

           stmt.setInt(1, id);
           return stmt.executeUpdate() > 0;
    	} catch (SQLException e) {
    		e.printStackTrace();
    		return false;
    	}
    }
    
    public boolean updateCategory(final int id, final String title, final String description) {
    	try(Connection con = databaseManager.getConnection();
        		PreparedStatement stmt = con.prepareStatement(
                        "UPDATE categories SET title = ?, description = ? where id = ?")) {

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
