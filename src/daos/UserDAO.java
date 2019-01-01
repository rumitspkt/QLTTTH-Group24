package daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.LinkedList;
import java.util.List;

import org.apache.jasper.compiler.SmapStratum;

import bases.BaseDAO;
import models.Contact;
import models.User;

public class UserDAO extends BaseDAO {
	private static final UserDAO INSTANCE = new UserDAO();

	public static UserDAO getInstance() {
		return INSTANCE;
	}

	private UserDAO() {
	}

	public User getUser(final String username) {
		try (Connection con = databaseManager.getConnection();
				PreparedStatement stmt = con.prepareStatement(
						"SELECT id, type, username, hashPassword, firstName, lastName, birthDay, address, urlAvatar, email, maxim "
								+ "FROM users WHERE username = ? ")) {

			stmt.setString(1, username);

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
	
	public User getUser(final int id) {
		try (Connection con = databaseManager.getConnection();
				PreparedStatement stmt = con.prepareStatement(
						"SELECT id, type, username, hashPassword, firstName, lastName, birthDay, address, urlAvatar, email, maxim "
								+ "FROM users WHERE id = ? ")) {

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

	public List<User> getUsers(String type) {
		try (Connection con = databaseManager.getConnection();
				PreparedStatement stmt = con.prepareStatement(
						"SELECT id, type, username, hashPassword, firstName, lastName, birthDay, address, urlAvatar, email, maxim "
								+ "FROM users WHERE type = ? ORDER BY id ASC")) {

			stmt.setString(1, type);

			final List<User> users = new LinkedList<>();
			try (ResultSet rs = stmt.executeQuery()) {
				while (rs.next()) {
					users.add(fromRow(rs));
				}
			}

			return users;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	public List<User> getUsers() {
		try (Connection con = databaseManager.getConnection();
				PreparedStatement stmt = con.prepareStatement(
						"SELECT id, type, username, hashPassword, firstName, lastName, birthDay, address, urlAvatar, email, maxim "
								+ "FROM users ORDER BY id ASC")) {

			final List<User> users = new LinkedList<>();
			try (ResultSet rs = stmt.executeQuery()) {
				while (rs.next()) {
					users.add(fromRow(rs));
				}
			}

			return users;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	private User fromRow(final ResultSet resultSet) throws SQLException {
		return new User(resultSet.getInt("id"), resultSet.getString("type"), resultSet.getString("username"),
				resultSet.getString("hashPassword"), resultSet.getString("firstName"), resultSet.getString("lastName"),
				resultSet.getTimestamp("birthDay"), resultSet.getString("address"), resultSet.getString("urlAvatar"),
				resultSet.getString("email"), resultSet.getString("maxim"));
	}

	public boolean storeUser(final User user) {
		try (Connection con = databaseManager.getConnection();
				PreparedStatement stmt = con.prepareStatement(
						"INSERT INTO users (type, username, hashPassword, firstName, lastName, birthDay, address, urlAvatar, email, maxim) "
								+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
						Statement.RETURN_GENERATED_KEYS)) {
			stmt.setString(1, user.getType());
			stmt.setString(2, user.getUsername());
			stmt.setString(3, user.getHashPassword());
			stmt.setString(4, user.getFirstName());
			stmt.setString(5, user.getLastName());
			stmt.setTimestamp(6, user.getBirthDay());
			stmt.setString(7, user.getAddress());
			stmt.setString(8, user.getUrlAvatar());
			stmt.setString(9, user.getEmail());
			stmt.setString(10, user.getMaxim());
			return stmt.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean deleteUser(final int id) {
		try (Connection con = databaseManager.getConnection();
				PreparedStatement stmt = con.prepareStatement("DELETE FROM users where id = ?")) {

			stmt.setInt(1, id);
			return stmt.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean updateUser(int id, String hashPassword, String firstName, String lastName, String address,
			String urlAvatar, String email, String maxim) {
		try (Connection con = databaseManager.getConnection();
				PreparedStatement stmt = con.prepareStatement(
						"UPDATE users SET firstName = ?, hashPassword = ?,lastName = ?, address = ?, urlAvatar = ?, email = ?, maxim = ? where id = ?")) {

			stmt.setString(1, firstName);
			stmt.setString(2, hashPassword);
			stmt.setString(3, lastName);
			stmt.setString(4, address);
			stmt.setString(5, urlAvatar);
			stmt.setString(6, email);
			stmt.setString(7, maxim);
			stmt.setInt(8, id);
			return stmt.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

}
