package DAO;

import dal.DBContext;
import static java.nio.file.Files.list;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.xml.bind.ParseConversionEvent;
import model.Post;

/**
 *
 * @author dmx
 */
public class DAOPost extends DBContext {

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

    public Post getPostbyID(String id) {
        List<Post> list = new ArrayList<>();
        String query = "select * from Post where PostId = ?";
        try {
            PreparedStatement pstm = cnn.prepareStatement(query);
            pstm.setString(1, id);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                return new Post(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7));
            }
        } catch (SQLException e) {
            System.out.println("SQL <getPostById>: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("<getPostById>: " + e.getMessage());
        }
        return null;
    }

    public Post getViewed() {
        List<Post> list = new ArrayList<>();
        String query = "select TOP 1 * from Post order by Viewer desc";
        try {
            PreparedStatement pstm = cnn.prepareStatement(query);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                return new Post(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7));
            }
        } catch (SQLException e) {
            System.out.println("SQL <getViewed>: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("<getViewed>: " + e.getMessage());
        }
        return null;
    }

//    public List<Post> getPostByName(String text) {
//        List<Post> list = new ArrayList<>();
//        DAOPost Postdao = new DAOPost();
//
//        ArrayList<Post> listP = Postdao.getListPost();
//        ArrayList<Post> listSearch = new ArrayList<>();
//
//        for (Post post : listP) {
//            if (post.getTitle().contains(text)) {
//                listSearch.add(post);
//            }
//        }
//        return listSearch;
//    }
    public List<Post> getPostByName(String text) {
        List<Post> list = new ArrayList<>();
        String query = "select * from Post where title like ?";
        try {

            PreparedStatement pstm = cnn.prepareStatement(query);
            pstm.setString(1, "%" + text + "%");
            rs = pstm.executeQuery();
            while (rs.next()) {
                list.add(new Post(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }


    public static void main(String[] args) {
        DAOPost daoPost = new DAOPost();
//    ArrayList<Post> postList = daoPost.getListPost();
        List p = daoPost.getPostByName("man");
        System.out.println(p);
//    if (postList != null && !postList.isEmpty()) {
//        for (Post post : postList) {
//            System.out.println("ID: " + post.getPostId());
//            System.out.println("Title: " + post.getTitle());
//            System.out.println("Avatar: " + post.getAvatar());
//            System.out.println("Content: " + post.getContent());
//            System.out.println("Viewer: " + post.getViewer());
//            System.out.println("Rate: " + post.getRate());
//        }
//    } else {
//        System.out.println("Empty Data");
//    }
    }

}
