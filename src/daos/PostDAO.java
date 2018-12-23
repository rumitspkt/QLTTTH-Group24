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
import models.Post;

public class PostDAO extends BaseDAO {
	private static final PostDAO INSTANCE = new PostDAO();

    public static PostDAO getInstance() {
        return INSTANCE;
    }

    private PostDAO() {
    }
    
    public Post getPost(final int id) {
        try (Connection con = databaseManager.getConnection();
            PreparedStatement stmt = con.prepareStatement(
                    "SELECT id, posterUrl, lecturer, date, views, title, , summary, content, status FROM posts WHERE id = ? ")) {

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

    private Post fromRow(final ResultSet resultSet) throws SQLException {
        return new Post(resultSet.getInt("id"),
        		resultSet.getString("posterUrl"),
        		resultSet.getInt("lecturer"),
        		resultSet.getTimestamp("date"),
        		resultSet.getInt("views"),
        		resultSet.getString("title"),
        		resultSet.getString("summary"),
        		resultSet.getString("content"),
        		resultSet.getString("status")
        		);
    }

   
    public List<Post> getPosts() {
        try (Connection con = databaseManager.getConnection();
            PreparedStatement stmt = con.prepareStatement(
                    "SELECT id, posterUrl, lecturer, date, views, title, , summary, content, status " +
                    "FROM posts ORDER BY id ASC")) {

            final List<Post> posts = new LinkedList<>();
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    posts.add(fromRow(rs));
                }
            }

            return posts;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
    
    public List<Post> getPostsByLecturer(int lecturer) {
        try (Connection con = databaseManager.getConnection();
            PreparedStatement stmt = con.prepareStatement(
                    "SELECT id, posterUrl, lecturer, date, views, title, summary, content, status " +
                    "FROM posts WHERE lecturer = ? ORDER BY id ASC")) {

        	stmt.setInt(1, lecturer);
        	
            final List<Post> posts = new LinkedList<>();
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    posts.add(fromRow(rs));
                }
            }

            return posts;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
    
    public List<Post> getPostsByStatus(String status) {
        try (Connection con = databaseManager.getConnection();
            PreparedStatement stmt = con.prepareStatement(
                    "SELECT id, posterUrl, lecturer, date, views, title, summary, content, status " +
                    "FROM posts WHERE status = ? ORDER BY id ASC")) {
        	
        	stmt.setString(1, status);

            final List<Post> posts = new LinkedList<>();
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    posts.add(fromRow(rs));
                }
            }

            return posts;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
    
    public List<Post> getPostsByCategory(int category) {
        try (Connection con = databaseManager.getConnection();
            PreparedStatement stmt = con.prepareStatement(
                    "SELECT id, posterUrl, lecturer, date, views, title, summary, content, status "
                    + "FROM posts WHERE id IN (SELECT post FROM classificationOfPosts WHERE category = ? )"
            		)) {
        	
        	stmt.setInt(1, category);

            final List<Post> posts = new LinkedList<>();
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    posts.add(fromRow(rs));
                }
            }

            return posts;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public boolean storePost(final Post post) {
        try (Connection con = databaseManager.getConnection();
             PreparedStatement stmt = con.prepareStatement(
                     "INSERT INTO post (posterUrl, lecturer, date, views, title, , summary, content, status) "
                     + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS)) {

            stmt.setString(1, post.getPosterUrl());
            stmt.setInt(2, post.getLecturer());
            stmt.setTimestamp(3, post.getDate());
            stmt.setInt(4, post.getViews());
            stmt.setString(5, post.getTitle());
            stmt.setString(6, post.getSummary());
            stmt.setString(7, post.getContent());
            stmt.setString(8, post.getStatus());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean deletePost(final int id) {
    	try(Connection con = databaseManager.getConnection();
    		PreparedStatement stmt = con.prepareStatement(
                    "DELETE FROM posts where id = ?")) {

           stmt.setInt(1, id);
           return stmt.executeUpdate() > 0;
    	} catch (SQLException e) {
    		e.printStackTrace();
    		return false;
    	}
    }
    
//    public boolean updatePost(int id, String posterUrl, int lecturer, Timestamp date, int views, String title, String summary, String content, String status) {
//    	try(Connection con = databaseManager.getConnection();
//        		PreparedStatement stmt = con.prepareStatement(
//                        "UPDATE posts SET p = ?, phoneNumber = ? where id = ?")) {
//
//               stmt.setString(1, name);
//               stmt.setString(2, phoneNumber);
//               stmt.setInt(3, id);
//               return stmt.executeUpdate() > 0;
//        	} catch (SQLException e) {
//        		e.printStackTrace();
//        		return false;
//        	}
//    }
    
    public boolean updatePost(int id, int views) {
    	try(Connection con = databaseManager.getConnection();
        		PreparedStatement stmt = con.prepareStatement(
                        "UPDATE posts SET views = ? where id = ?")) {

               stmt.setInt(1, views);
               stmt.setInt(2, id);
               return stmt.executeUpdate() > 0;
        	} catch (SQLException e) {
        		e.printStackTrace();
        		return false;
        	}
    }
    
    public boolean updatePost(int id, String status) {
    	try(Connection con = databaseManager.getConnection();
        		PreparedStatement stmt = con.prepareStatement(
                        "UPDATE posts SET status = ? where id = ?")) {

               stmt.setString(1, status);
               stmt.setInt(2, id);
               return stmt.executeUpdate() > 0;
        	} catch (SQLException e) {
        		e.printStackTrace();
        		return false;
        	}
    }
}
