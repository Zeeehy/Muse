package com.muse.db;

import java.sql.*;
import javax.naming.*;
import javax.sql.*;

public class MuseDB {
	static DataSource ds;
	
	static{
		Context initContext;
		try {
			initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
	    	ds = (DataSource)envContext.lookup("jdbc/myoracle");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
	}
	
	public static Connection getConn() throws Exception{
		return ds.getConnection();
	}
}

