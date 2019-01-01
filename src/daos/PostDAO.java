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
	
	public Post getPostDetail(final int id) {
		try (Connection con = databaseManager.getConnection();
				PreparedStatement stmt = con.prepareStatement(
						"SELECT posts.id,posts.posterUrl,posts.lecturer,posts.date,posts.views,posts.title,posts.summary,posts.content,posts.STATUS,categories.title AS category,CONCAT(users.firstName,' ',users.lastName) AS lecturerName FROM posts JOIN classificationOfPosts ON posts.id=classificationOfPosts.post JOIN categories ON classificationOfPosts.category=categories.id JOIN users ON posts.lecturer=users.id WHERE posts.id=?")) {

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

	private Post fromRow(final ResultSet resultSet) throws SQLException {
		return new Post(resultSet.getInt("id"), resultSet.getString("posterUrl"), resultSet.getInt("lecturer"),
				resultSet.getTimestamp("date"), resultSet.getInt("views"), resultSet.getString("title"),
				resultSet.getString("summary"), resultSet.getString("content"), resultSet.getString("status"));
	}
	
	private Post fromRowDetail(final ResultSet resultSet) throws SQLException {
		return new Post(resultSet.getInt("id"), resultSet.getString("posterUrl"), resultSet.getInt("lecturer"),
				resultSet.getTimestamp("date"), resultSet.getInt("views"), resultSet.getString("title"),
				resultSet.getString("summary"), resultSet.getString("content"), resultSet.getString("status"), resultSet.getString("category"), resultSet.getString("lecturerName"));
	}
	
	

	public List<Post> getPosts() {
		try (Connection con = databaseManager.getConnection();
				PreparedStatement stmt = con.prepareStatement(
						"SELECT posts.id,posts.posterUrl,posts.lecturer,posts.date,posts.views,posts.title,posts.summary,posts.content,posts.STATUS,categories.title AS category,CONCAT(users.firstName,' ',users.lastName) AS lecturerName "
						+ "FROM posts "
						+ "JOIN classificationOfPosts ON posts.id=classificationOfPosts.post "
						+ "JOIN categories ON classificationOfPosts.category=categories.id "
						+ "JOIN users ON posts.lecturer=users.id")) {

			final List<Post> posts = new LinkedList<>();
			try (ResultSet rs = stmt.executeQuery()) {
				while (rs.next()) {
					posts.add(fromRowDetail(rs));
				}
			}

			return posts;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public List<Post> getLatestPosts() {
		try (Connection con = databaseManager.getConnection();
				PreparedStatement stmt = con.prepareStatement(
						"SELECT posts.id,posts.posterUrl,posts.lecturer,posts.date,posts.views,posts.title,posts.summary,posts.content,posts.STATUS,categories.title AS category,CONCAT(users.firstName,' ',users.lastName) AS lecturerName "
						+ "FROM posts "
						+ "JOIN classificationOfPosts ON posts.id=classificationOfPosts.post "
						+ "JOIN categories ON classificationOfPosts.category=categories.id "
						+ "JOIN users ON posts.lecturer=users.id where posts.status='ACCEPTED' order by date DESC limit 4")) {

			final List<Post> posts = new LinkedList<>();
			try (ResultSet rs = stmt.executeQuery()) {
				while (rs.next()) {
					posts.add(fromRowDetail(rs));
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
						"SELECT id, posterUrl, lecturer, date, views, title, summary, content, status "
								+ "FROM posts WHERE lecturer = ? ORDER BY id ASC")) {

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

//	public List<Post> getPostsByStatus(String status) {
//		try (Connection con = databaseManager.getConnection();
//				PreparedStatement stmt = con.prepareStatement(
//						"SELECT id, posterUrl, lecturer, date, views, title, summary, content, status "
//								+ "FROM posts WHERE status = ? ORDER BY id ASC")) {
//
//			stmt.setString(1, status);
//
//			final List<Post> posts = new LinkedList<>();
//			try (ResultSet rs = stmt.executeQuery()) {
//				while (rs.next()) {
//					posts.add(fromRow(rs));
//				}
//			}
//
//			return posts;
//		} catch (SQLException e) {
//			e.printStackTrace();
//			return null;
//		}
//	}
//
//	public List<Post> getPostsByCategory(int category) {
//		try (Connection con = databaseManager.getConnection();
//				PreparedStatement stmt = con.prepareStatement(
//						"SELECT id, posterUrl, lecturer, date, views, title, summary, content, status "
//								+ "FROM posts WHERE id IN (SELECT post FROM classificationOfPosts WHERE category = ? )")) {
//
//			stmt.setInt(1, category);
//
//			final List<Post> posts = new LinkedList<>();
//			try (ResultSet rs = stmt.executeQuery()) {
//				while (rs.next()) {
//					posts.add(fromRow(rs));
//				}
//			}
//
//			return posts;
//		} catch (SQLException e) {
//			e.printStackTrace();
//			return null;
//		}
//	}
	
	public List<Post> getPostsByStatus(String status) {
		try (Connection con = databaseManager.getConnection();
				PreparedStatement stmt = con.prepareStatement(
						"SELECT posts.id,posts.posterUrl,posts.lecturer,posts.date,posts.views,posts.title,posts.summary,posts.content,posts.STATUS,categories.title AS category,CONCAT(users.firstName,' ',users.lastName) AS lecturerName "
						+ "FROM posts "
						+ "JOIN classificationOfPosts ON posts.id=classificationOfPosts.post "
						+ "JOIN categories ON classificationOfPosts.category=categories.id "
						+ "JOIN users ON posts.lecturer=users.id "
						+ "WHERE posts.STATUS=?")) {
			stmt.setString(1, status);

			final List<Post> posts = new LinkedList<>();
			try (ResultSet rs = stmt.executeQuery()) {
				while (rs.next()) {
					posts.add(fromRowDetail(rs));
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
						"SELECT posts.id,posts.posterUrl,posts.lecturer,posts.date,posts.views,posts.title,posts.summary,posts.content,posts.STATUS,categories.title AS category,CONCAT(users.firstName,' ',users.lastName) AS lecturerName "
						+ "FROM posts "
						+ "JOIN classificationOfPosts ON posts.id=classificationOfPosts.post "
						+ "JOIN categories ON classificationOfPosts.category=categories.id "
						+ "JOIN users ON posts.lecturer=users.id "
						+ "WHERE classificationOfPosts.category=?")) {
			stmt.setInt(1, category);

			final List<Post> posts = new LinkedList<>();
			try (ResultSet rs = stmt.executeQuery()) {
				while (rs.next()) {
					posts.add(fromRowDetail(rs));
				}
			}

			return posts;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public List<Post> getPostsByCategoryAndStatus(int category, String status) {
		try (Connection con = databaseManager.getConnection();
				PreparedStatement stmt = con.prepareStatement(
						"SELECT posts.id,posts.posterUrl,posts.lecturer,posts.date,posts.views,posts.title,posts.summary,posts.content,posts.STATUS,categories.title AS category,CONCAT(users.firstName,' ',users.lastName) AS lecturerName "
						+ "FROM posts "
						+ "JOIN classificationOfPosts ON posts.id=classificationOfPosts.post "
						+ "JOIN categories ON classificationOfPosts.category=categories.id "
						+ "JOIN users ON posts.lecturer=users.id "
						+ "WHERE classificationOfPosts.category=? AND posts.STATUS=?")) {
			stmt.setInt(1, category);
			stmt.setString(2, status);

			final List<Post> posts = new LinkedList<>();
			try (ResultSet rs = stmt.executeQuery()) {
				while (rs.next()) {
					posts.add(fromRowDetail(rs));
				}
			}

			return posts;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	

	public int storePost(final Post post) {
		try (Connection con = databaseManager.getConnection();
				PreparedStatement stmt = con.prepareStatement(
						"INSERT INTO posts (posterUrl, lecturer, title, summary, content) "
								+ "VALUES (?, ?, ?, ?, ?)",
						Statement.RETURN_GENERATED_KEYS)) {

			stmt.setString(1, post.getPosterUrl());
			stmt.setInt(2, post.getLecturer());
			stmt.setString(3, post.getTitle());
			stmt.setString(4, post.getSummary());
			stmt.setString(5, post.getContent());
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
	
	public boolean classifyPost(final int post, final int category) {
		try (Connection con = databaseManager.getConnection();
				PreparedStatement stmt = con
						.prepareStatement("INSERT INTO classificationOfPosts (post,category) VALUES (?,?)")) {

			stmt.setInt(1, post);
			stmt.setInt(2, category);
			return stmt.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean deletePost(final int id) {
		try (Connection con = databaseManager.getConnection();
				PreparedStatement stmt = con.prepareStatement("DELETE FROM posts where id = ?")) {

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
		try (Connection con = databaseManager.getConnection();
				PreparedStatement stmt = con.prepareStatement("UPDATE posts SET views = ? where id = ?")) {

			stmt.setInt(1, views);
			stmt.setInt(2, id);
			return stmt.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean updatePost(int id, String status) {
		try (Connection con = databaseManager.getConnection();
				PreparedStatement stmt = con.prepareStatement("UPDATE posts SET status = ? where id = ?")) {

			stmt.setString(1, status);
			stmt.setInt(2, id);
			return stmt.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
}
