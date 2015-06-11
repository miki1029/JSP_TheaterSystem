package woodrimsTheater;

import oracle.jdbc.pool.OracleConnectionPoolDataSource;

import javax.sql.PooledConnection;

public class DBConnection {

    // DB user info
    String dburl = "jdbc:oracle:thin:@210.94.199.20:1521:DBLAB";
    private final String user = "ST2009111979";
    private final String passwd = "ST2009111979";

    // pool
    private OracleConnectionPoolDataSource ocpds = null;
    private PooledConnection pool = null;

    // singleton
    private static final DBConnection dbConn = new DBConnection();

    private DBConnection() {
        try{
            // Create a OracleConnectionPoolDataSorce instance
            ocpds = new OracleConnectionPoolDataSource();
            // Set connection parameters
            ocpds.setURL(dburl);
            ocpds.setUser(user);
            ocpds.setPassword(passwd);
            // Create a pooled connection
            pool = ocpds.getPooledConnection();
        } catch (Exception e) {
            System.out.println("Error : Connection Failed");
            e.printStackTrace();
        }
    }

    public static synchronized DBConnection getInstance() {
        return dbConn;
    }

    public PooledConnection getPool() {
        return pool;
    }
}
