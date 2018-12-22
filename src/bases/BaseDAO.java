package bases;

import javax.servlet.ServletContext;

import utils.DatabaseManager;

public abstract class BaseDAO {
	protected DatabaseManager databaseManager;
	
	public final void initDatabaseManager(ServletContext context) {
    	if(databaseManager == null) {
    		String dbUsername = context.getInitParameter("dbUsername");
    		String dbPassword = context.getInitParameter("dbPassword");
    		String dbHost = context.getInitParameter("dbHost");
    		int dbPort = Integer.valueOf(context.getInitParameter("dbPort"));
    		String dbName = context.getInitParameter("dbName");
    		this.databaseManager = new DatabaseManager(dbUsername, dbPassword, dbName, dbHost, dbPort);
    	}
    }
}
