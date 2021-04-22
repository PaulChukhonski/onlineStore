package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Product;
import db.DBConnection;

@WebServlet("/Admin")
public class AdminController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    HttpSession session;

    ArrayList<Product> productList = new ArrayList<>();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String page = request.getParameter("page");

        if(page == null) {
            request.getRequestDispatcher("admin/login.jsp").forward(request, response);
        }

        if(page.equals("admin-login-form")) {
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            if(email.equals("admin@gmail.com") && password.equals("helloAdmin")) {
                session = request.getSession();
                session.setAttribute("session", session);

                request.getRequestDispatcher("admin/index.jsp").forward(request, response);
            }
            else {
                request.setAttribute("msg", "Invalid email or password");
                request.setAttribute("email", email);
                request.setAttribute("productList", productList);
                request.getRequestDispatcher("admin/login.jsp").forward(request, response);

            }
        }

        if(page.equals("index")) {
            DBConnection db = new DBConnection();
            try {
                productList = db.selectAllProducts();
            } catch (SQLException e) {
                e.printStackTrace();
            }

            request.setAttribute("productList", productList);
            request.getRequestDispatcher("admin/index.jsp").forward(request, response);
        }

        if(page.equals("login")) {
            request.getRequestDispatcher("admin/login.jsp").forward(request, response);
        }

        if(page.equals("logout")) {
            session = request.getSession();
            session.invalidate();

            request.getRequestDispatcher("admin/login.jsp").forward(request, response);
        }

        if(page.equals("add-product")) {
            request.getRequestDispatcher("admin/addProduct.jsp").forward(request, response);
        }

        if(page.equals("edit-product")) {
            String id = request.getParameter("id");
            DBConnection db = new DBConnection();
            Product p = null;
            try {
                p = db.selectProductById(id);
            } catch (SQLException e) {
                e.printStackTrace();
            }

            request.setAttribute("p", p);
            request.getRequestDispatcher("admin/editProduct.jsp").forward(request, response);
        }

        if(page.equals("edit_product")){
            String productId = request.getParameter("productId");
            String name = request.getParameter("name");
            String price = request.getParameter("price");
            String category = request.getParameter("category");
            String image = request.getParameter("image");

            try {
                Double.parseDouble(price);
            } catch (Exception e) {
                request.setAttribute("msg", "Invalid price");
                request.setAttribute("productId", productId);
                request.setAttribute("name", name);
                request.setAttribute("price", price);
                request.setAttribute("category", category);
                request.setAttribute("image", image);
                request.getRequestDispatcher("admin/editProduct.jsp").forward(request, response);
            }

            if(category.equals("laptop") || category.equals("smartphone")) {
                Product p = new Product(Integer.parseInt(productId), name, Double.parseDouble(price), category, image);
                DBConnection db = new DBConnection();
                try {
                    db.updateProduct(p);
                } catch (SQLException e) {
                    e.printStackTrace();
                }

                request.setAttribute("productList", productList);
                request.getRequestDispatcher("admin/index.jsp").forward(request, response);
            } else {
                request.setAttribute("msg", "Invalid category");
                request.setAttribute("name", name);
                request.setAttribute("price", price);
                request.setAttribute("category", category);
                request.setAttribute("image", image);
                request.getRequestDispatcher("admin/addProduct.jsp").forward(request, response);
            }
        }

        if(page.equals("add_product")){
            String name = request.getParameter("name");
            String price = request.getParameter("price");
            String category = request.getParameter("category");
            String image = request.getParameter("image");

            try {
                Double.parseDouble(price);
            } catch (Exception e) {
                request.setAttribute("msg", "Invalid price");
                request.setAttribute("name", name);
                request.setAttribute("price", price);
                request.setAttribute("category", category);
                request.setAttribute("image", image);
                request.getRequestDispatcher("admin/addProduct.jsp").forward(request, response);
            }

            if(category.equals("laptop") || category.equals("smartphone")) {
                Product p = new Product(name, Double.parseDouble(price), category, image);
                DBConnection db = new DBConnection();
                try {
                    db.insertProduct(p);
                } catch (SQLException e) {
                    e.printStackTrace();
                }

                request.setAttribute("productList", productList);
                request.getRequestDispatcher("admin/index.jsp").forward(request, response);
            } else {
                request.setAttribute("msg", "Invalid category");
                request.setAttribute("name", name);
                request.setAttribute("price", price);
                request.setAttribute("category", category);
                request.setAttribute("image", image);
                request.getRequestDispatcher("admin/addProduct.jsp").forward(request, response);
            }
        }

        if(page.equals("delete")) {
            String id = request.getParameter("id");
            DBConnection db = new DBConnection();
            try {
                db.deleteProduct(id);
            } catch (SQLException e) {
                e.printStackTrace();
            }

            request.setAttribute("productList", productList);
            request.getRequestDispatcher("admin/index.jsp").forward(request, response);
        }

        if(page.equals("admin-search")) {
            String searchName = request.getParameter("searchName");
            DBConnection db = new DBConnection();
            try {
                productList = db.selectAllProducts();
            } catch (SQLException e) {
                e.printStackTrace();
            }

            request.setAttribute("productList", productList);
            request.setAttribute("searchName", searchName);
            request.getRequestDispatcher("admin/search.jsp").forward(request, response);
        }
    }
}