package db;

import beans.Product;
import beans.User;
import controller.Controller;

import java.sql.*;
import java.util.ArrayList;

public class DBConnection {
    private final String username = "root";
    private final String password = "010400";
    private final String name = "onlinestore";
    private final String extra = "?serverTimezone=UTC&autoReconnect=true&useSSL=false";
    private final String url = "jdbc:mysql://localhost:3306/" + name + extra;
    private final String driver = "com.mysql.cj.jdbc.Driver";

    ArrayList<Product> productList = new ArrayList<>();
    ArrayList<User> userList = new ArrayList<>();

    private Connection connection;

    private void dbConnect() {
        try {
            Class.forName(driver);
            connection = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void dbClose() {
        try {
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean checkUser(String email, String password) throws SQLException {
        dbConnect();
        boolean flag = false;

        String sql = "Select * from user where email=? and password=?";
        PreparedStatement st = connection.prepareStatement(sql);
        st.setString(1, email);
        st.setString(2, password);
        ResultSet rs = st.executeQuery();

        while(rs.next()) {
            flag = true;
            break;
        }

        dbClose();
        return flag;
    }

    public boolean checkUserByEmail(String email) throws SQLException {
        dbConnect();
        boolean flag = false;

        String sql = "Select * from user where email=?";
        PreparedStatement st = connection.prepareStatement(sql);
        st.setString(1, email);
        ResultSet rs = st.executeQuery();

        while(rs.next()) {
            flag = true;
            break;
        }

        dbClose();
        return flag;
    }

    public void insertUser(User user) throws SQLException {
        dbConnect();
        String sql = "Insert into user(name,email,address,password) values(?,?,?,?)";
        PreparedStatement st = connection.prepareStatement(sql);

        st.setString(1, user.getName());
        st.setString(2, user.getEmail());
        st.setString(3, user.getAddress());
        st.setString(4, user.getPassword());
        st.executeUpdate();

        dbClose();
    }

    public ArrayList<User> selectAllUsers() throws SQLException {
        dbConnect();
        String sql = "Select * from user";
        PreparedStatement st = connection.prepareStatement(sql);
        ResultSet rs = st.executeQuery();

        while(rs.next()) {
            int userId = rs.getInt("userId");
            String name = rs.getString("name");
            String email = rs.getString("email");
            String address = rs.getString("address");
            String password = rs.getString("password");

            User u = new User(userId, name, email, address, password);
            userList.add(u);
            u = null;
        }

        dbClose();
        return userList;
    }

    public ArrayList<Product> selectAllProducts() throws SQLException {
        dbConnect();
        String sql = "Select * from product";
        PreparedStatement st = connection.prepareStatement(sql);

        ResultSet rs = st.executeQuery();

        while(rs.next()) {
            int productId = rs.getInt("productId");
            String name = rs.getString("name");
            double price = rs.getDouble("price");
            String category = rs.getString("category");
            String image = rs.getString("image");

            Product p = new Product(productId, name, price, category, image);
            productList.add(p);
            p = null;
        }

        dbClose();
        return productList;
    }

    public void deleteProduct(String id) throws SQLException {
        dbConnect();
        String sql = "Delete from product where productId=?";
        PreparedStatement st = connection.prepareStatement(sql);
        st.setString(1, id);
        st.executeUpdate();
        dbClose();
    }

    public Product selectProductById(String id) throws SQLException {
        dbConnect();
        String sql = "select * from product where productId=?";
        PreparedStatement st = connection.prepareStatement(sql);
        st.setString(1, id);
        ResultSet rst = st.executeQuery();
        Product p = new Product();

        while(rst.next()){
            p.setProductId(rst.getInt("productId"));
            p.setName(rst.getString("name"));
            p.setPrice(rst.getDouble("price"));
            p.setCategory(rst.getString("category"));
            p.setImage(rst.getString("image"));
        }

        dbClose();
        return p;
    }

    public void updateProduct(Product p) throws SQLException {
        dbConnect();
        String sql = "update product set name=?,price=?,category=?,image=? where productId=?";
        PreparedStatement st = connection.prepareStatement(sql);
        st.setString(1, p.getName());
        st.setDouble(2, p.getPrice());
        st.setString(3, p.getCategory());
        st.setString(4, p.getImage());
        st.setInt(5, p.getProductId());
        st.executeUpdate();
        dbClose();
    }

    public void insertProduct(Product p) throws SQLException {
        dbConnect();
        String sql = "Insert into product(name,price,category,image) values(?,?,?,?)";
        PreparedStatement st = connection.prepareStatement(sql);
        st.setString(1, p.getName());
        st.setDouble(2, p.getPrice());
        st.setString(3, p.getCategory());
        st.setString(4, p.getImage());
        st.executeUpdate();
        dbClose();
    }
}