
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
            PreparedStatement pstm = cnn.prepareStatement(sql);
            ResultSet rs = pstm.executeQuery();          
            
            while (rs.next()) {
                data.add(new Post(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7)));
            }
        } catch (SQLException e) {
            System.out.println("SQL <getListService>: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("<getListService>: " + e.getMessage());
        }
        return data;
    }
    
    public static void main(String[] args) {
    DAOPost daoPost = new DAOPost();
    ArrayList<Post> postList = daoPost.getListPost();

    if (postList != null && !postList.isEmpty()) {
        for (Post post : postList) {
            System.out.println("ID: " + post.getPostId());
            System.out.println("Title: " + post.getTitle());
            System.out.println("Avatar: " + post.getAvatar());
            System.out.println("Content: " + post.getContent());
            System.out.println("Viewer: " + post.getViewer());
            System.out.println("Rate: " + post.getRate());
        }
    } else {
        System.out.println("Empty Data");
    }
}

}
