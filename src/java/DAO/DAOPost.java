
package DAO;

import dal.DBContext;
import static java.nio.file.Files.list;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.xml.bind.ParseConversionEvent;
import model.Post;

/**
 *
 * @author dmx
 */
public class DAOPost extends DBContext{
    PreparedStatement pstm;
    Connection cnn;
    ResultSet rs;

    public DAOPost() {
        connect();
    }

    public void connect() {
        cnn = super.connection;
    }
    
    public ArrayList<Post> getListPost() {
        String sql = " select * from Post";
        ArrayList<Post> data = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();          
            
            while (rs.next()) {
                data.add(new Post(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7)));
            }
        } catch (SQLException e) {
            System.out.println("SQL <getListService>: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("<getListService>: " + e.getMessage());
        }
        return data;
    }
}
