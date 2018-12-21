package daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletContext;

import models.Contact;
import utils.DatabaseManager;

public class ContactDAO {
	private static final ContactDAO INSTANCE = new ContactDAO();
    private DatabaseManager databaseManager;

    public static ContactDAO getInstance() {
        return INSTANCE;
    }

    private ContactDAO() {
    }
    
    public void initDatabaseManager(ServletContext context) {
    	if(databaseManager == null) {
    		String dbUsername = context.getInitParameter("dbUsername");
    		String dbPassword = context.getInitParameter("dbPassword");
    		String dbHost = context.getInitParameter("dbHost");
    		int dbPort = Integer.valueOf(context.getInitParameter("dbPort"));
    		String dbName = context.getInitParameter("dbName");
    		this.databaseManager = new DatabaseManager(dbUsername, dbPassword, dbName, dbHost, dbPort);
    	}
    }
    
    public Contact getContact(final int contactId) {
        try (Connection con = databaseManager.getConnection();
            PreparedStatement stmt = con.prepareStatement(
                    "SELECT id, name, phoneNumber FROM contacts WHERE id = ? ")) {

            stmt.setInt(1, contactId);

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

    private Contact fromRow(final ResultSet resultSet) throws SQLException {
        return new Contact(resultSet.getInt("id"), resultSet.getString("name"), resultSet.getString("phoneNumber"));
    }

   
    public List<Contact> getAllContacts() {
        try (Connection con = databaseManager.getConnection();
            PreparedStatement stmt = con.prepareStatement(
                    "SELECT id, name, phoneNumber " +
                    "FROM contacts ORDER BY id ASC")) {

            final List<Contact> contacts = new LinkedList<>();
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    contacts.add(fromRow(rs));
                }
            }

            return contacts;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public boolean storeContact(final Contact contact) {
        try (Connection con = databaseManager.getConnection();
             PreparedStatement stmt = con.prepareStatement(
                     "INSERT INTO contacts (name, phoneNumber) "
                     + "VALUES (?, ?)", Statement.RETURN_GENERATED_KEYS)) {

            stmt.setString(1, contact.getName());
            stmt.setString(2, contact.getPhoneNumber());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean deleteContact(final int id) {
    	try(Connection con = databaseManager.getConnection();
    		PreparedStatement stmt = con.prepareStatement(
                    "DELETE FROM contacts where id = ?")) {

           stmt.setInt(1, id);
           return stmt.executeUpdate() > 0;
    	} catch (SQLException e) {
    		e.printStackTrace();
    		return false;
    	}
    }
    
    public boolean updateContact(final int id, final String name, final String phoneNumber) {
    	try(Connection con = databaseManager.getConnection();
        		PreparedStatement stmt = con.prepareStatement(
                        "UPDATE contacts SET name = ?, phoneNumber = ? where id = ?")) {

               stmt.setString(1, name);
               stmt.setString(2, phoneNumber);
               stmt.setInt(3, id);
               return stmt.executeUpdate() > 0;
        	} catch (SQLException e) {
        		e.printStackTrace();
        		return false;
        	}
    }
}
