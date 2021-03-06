package car.erp.utils.jdbcUtils.connect;

import org.springframework.beans.factory.annotation.Value;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class JDBCConnectionUtils {

    @Value("${jdbc.driverClassName}")
    private static String DRIVER_CLASS_NAME;

    @Value("${jdbc.url}")
    private static String URL;

    @Value("${jdbc.userName}")
    private static String USER_NAME;

    @Value("${jdbc.password}")
    private static String PASSWORD;

    private static Connection conn = null;

    private static PreparedStatement pst = null;

    public static PreparedStatement getPreparedStatement(String sql){
        try {
            Class.forName(DRIVER_CLASS_NAME);
            conn = DriverManager.getConnection(URL,USER_NAME,PASSWORD);
            pst = conn.prepareStatement(sql);
        } catch (ClassNotFoundException
                | SQLException e) {
            e.printStackTrace();
        }
        return pst;
    }

    public static void closeConnection(){
        try {
            if (null != conn){
                conn.close();
            }
            if (null != pst){
                pst.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
