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
import models.Notification;

public class NotificationDAO extends BaseDAO{
	private static final NotificationDAO INSTANCE = new NotificationDAO();

    public static NotificationDAO getInstance() {
        return INSTANCE;
    }

    private NotificationDAO() {
    }
    

    private Notification fromRow(final ResultSet resultSet) throws SQLException {
        return new Notification(resultSet.getInt("id"), 
        		resultSet.getString("title"), 
        		resultSet.getString("content"),
        		resultSet.getString("priority"),
        		resultSet.getTimestamp("date")
        		);
    }

   
    public List<Notification> getNotifications() {
        try (Connection con = databaseManager.getConnection();
            PreparedStatement stmt = con.prepareStatement(
                    "SELECT id, title, content, priority, date " +
                    "FROM notifications ORDER BY id ASC")) {

            final List<Notification> notifications = new LinkedList<>();
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                	notifications.add(fromRow(rs));
                }
            }

            return notifications;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public boolean storeNotification(final Notification notification) {
        try (Connection con = databaseManager.getConnection();
             PreparedStatement stmt = con.prepareStatement(
                     "INSERT INTO notifications (title, content, priority, date) "
                     + "VALUES (?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS)) {

            stmt.setString(1, notification.getTitle());
            stmt.setString(2, notification.getContent());
            stmt.setString(3, notification.getContent());
            stmt.setTimestamp(4, notification.getDate());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean deleteNotification(final int id) {
    	try(Connection con = databaseManager.getConnection();
    		PreparedStatement stmt = con.prepareStatement(
                    "DELETE FROM notifications where id = ?")) {

           stmt.setInt(1, id);
           return stmt.executeUpdate() > 0;
    	} catch (SQLException e) {
    		e.printStackTrace();
    		return false;
    	}
    }
    
    public boolean updateNotification(final int id, String title, String content, String priority) {
    	try(Connection con = databaseManager.getConnection();
        		PreparedStatement stmt = con.prepareStatement(
                        "UPDATE notifications SET title = ?, content = ?, priority = ? where id = ?")) {

               stmt.setString(1, title);
               stmt.setString(2, content);
               stmt.setString(3, priority);
               stmt.setInt(4, id);
               return stmt.executeUpdate() > 0;
        	} catch (SQLException e) {
        		e.printStackTrace();
        		return false;
        	}
    }
}
