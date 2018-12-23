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
import models.Message;

public class MessageDAO extends BaseDAO{
	private static final MessageDAO INSTANCE = new MessageDAO();

    public static MessageDAO getInstance() {
        return INSTANCE;
    }

    private MessageDAO() {
    }
    
    public Message getMessage(final int id) {
        try (Connection con = databaseManager.getConnection();
            PreparedStatement stmt = con.prepareStatement(
                    "SELECT id, emailOrPhone, senderName, subject, content, isRead FROM messages WHERE id = ? ")) {

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

    private Message fromRow(final ResultSet resultSet) throws SQLException {
        return new Message(resultSet.getInt("id"), 
        		resultSet.getString("emailOrPhone"), 
        		resultSet.getString("senderName"),
        		resultSet.getString("subject"),
        		resultSet.getString("content"),
        		resultSet.getInt("isRead")
        		);
    }

   
    public List<Message> getMessages() {
        try (Connection con = databaseManager.getConnection();
            PreparedStatement stmt = con.prepareStatement(
                    "SELECT id, emailOrPhone, senderName, subject, content, isRead " +
                    "FROM messages ORDER BY id ASC")) {

            final List<Message> messages = new LinkedList<>();
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                	messages.add(fromRow(rs));
                }
            }

            return messages;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public boolean storeMessage(final Message message) {
        try (Connection con = databaseManager.getConnection();
             PreparedStatement stmt = con.prepareStatement(
                     "INSERT INTO contacts (emailOrPhone, senderName, subject, content) "
                     + "VALUES (?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS)) {

            stmt.setString(1, message.getEmailOrPhone());
            stmt.setString(2, message.getSenderName());
            stmt.setString(3, message.getSubject());
            stmt.setString(4, message.getContent());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean deleteMessage(final int id) {
    	try(Connection con = databaseManager.getConnection();
    		PreparedStatement stmt = con.prepareStatement(
                    "DELETE FROM messages where id = ?")) {

           stmt.setInt(1, id);
           return stmt.executeUpdate() > 0;
    	} catch (SQLException e) {
    		e.printStackTrace();
    		return false;
    	}
    }
    
    public boolean updateMessage(final int id) {
    	try(Connection con = databaseManager.getConnection();
        		PreparedStatement stmt = con.prepareStatement(
                        "UPDATE messages SET isRead = 1 where id = ?")) {

               stmt.setInt(1, id);
               return stmt.executeUpdate() > 0;
        	} catch (SQLException e) {
        		e.printStackTrace();
        		return false;
        	}
    }
}
