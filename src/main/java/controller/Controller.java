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

import beans.CartItem;
import beans.Product;
import beans.User;
import db.DBConnection;

@WebServlet("/Controller")
public class Controller extends HttpServlet {
    private static final long serialVersionUID = 1L;
    HttpSession session;

    public static ArrayList<CartItem> cartList = new ArrayList<>();

    ArrayList<Product> productList = new ArrayList<>();
    ArrayList<User> userList = new ArrayList<>();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String page = request.getParameter("page");

        if(page == null || page.equals("index")) {
            DBConnection db = new DBConnection();
            try {
                productList = db.selectAllProducts();
            } catch (SQLException e) {
                e.printStackTrace();
            }

            session = request.getSession();
            session.setAttribute("cartList", cartList);
            session.setAttribute("productList", productList);

            request.getRequestDispatcher("index.jsp").forward(request, response);
        }

        if(page.equals("laptops") || page.equals("smartphones")) {
            DBConnection db = new DBConnection();
            try {
                productList = db.selectAllProducts();
            } catch (SQLException e) {
                e.printStackTrace();
            }

            request.setAttribute("productList", productList);

            if(page.equals("laptops"))
                request.getRequestDispatcher("laptops.jsp").forward(request, response);
            if(page.equals("smartphones"))
                request.getRequestDispatcher("smartphones.jsp").forward(request, response);
        }

        if(page.equals("login")) {
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }

        if(page.equals("signup")) {
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        }

        if(page.equals("signup-form")) {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            String password_1 = request.getParameter("password_1");
            String password_2 = request.getParameter("password_2");

            if(password_1.equals(password_2)) {
                DBConnection db = new DBConnection();
                try {
                    if(!db.checkUserByEmail(email)) {
                        User user = new User(name, email, address, password_1);
                        db.insertUser(user);
                    } else {
                        request.setAttribute("msg", "An account with the same email already exists");
                        request.setAttribute("name", name);
                        request.setAttribute("address", address);
                        request.getRequestDispatcher("signup.jsp").forward(request, response);
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }

                request.setAttribute("email", email);
                request.setAttribute("msg", "Account created");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else {
                request.setAttribute("msg", "Passwords don't match");
                request.setAttribute("name", name);
                request.setAttribute("email", email);
                request.setAttribute("address", address);
                request.getRequestDispatcher("signup.jsp").forward(request, response);
            }
        }

        if(page.equals("login-form")) {
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            DBConnection db = new DBConnection();
            User user = new User();
            boolean status = false;

            try {
                status = db.checkUser(email, password);
            } catch (SQLException e) {
                e.printStackTrace();
            }

            if(status) {
                session = request.getSession();
                session.setAttribute("session", session);

                try {
                    userList = db.selectAllUsers();
                } catch (SQLException e) {
                    e.printStackTrace();
                }

                session.setAttribute("address", user.selectAddress(userList, email));
                session.setAttribute("name", user.selectName(userList, email));
                session.setAttribute("email", email);

                request.getRequestDispatcher("index.jsp").forward(request, response);
            } else {
                request.setAttribute("msg", "Invalid email or password");
                request.setAttribute("email", email);
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        }

        if(page.equals("logout")) {
            session = request.getSession();
            session.invalidate();

            session = request.getSession();
            session.setAttribute("productList", productList);

            request.getRequestDispatcher("index.jsp").forward(request, response);
        }

        if(page.equals("show-cart")) {
            request.getRequestDispatcher("cart.jsp").forward(request, response);
        }

        if(page.equals("add-to-cart")) {
            String id = request.getParameter("id");
            String action = request.getParameter("action");
            CartItem item = new CartItem();
            boolean check = item.check(cartList, id);

            if(check) {
                item.add(cartList, id);
            } else {
                item.setItemId(id);
                item.setAmount(1);
                cartList.add(item);
            }

            if(action.equals("index"))
                request.getRequestDispatcher("index.jsp").forward(request, response);
            if(action.equals("laptops"))
                request.getRequestDispatcher("laptops.jsp").forward(request, response);
            if(action.equals("smartphones"))
                request.getRequestDispatcher("smartphones.jsp").forward(request, response);
        }

        if(page.equals("success")) {
            request.getRequestDispatcher("success.jsp").forward(request, response);
			session = request.getSession();
            cartList.clear();
        }

        if(page.equals("remove")) {
            String id = request.getParameter("id");
            CartItem item = new CartItem();
            cartList = item.remove(cartList, id);

            request.getRequestDispatcher("cart.jsp").forward(request, response);
        }

        if(page.equals("search")) {
            String searchName = request.getParameter("searchName");
            DBConnection db = new DBConnection();
            try {
                productList = db.selectAllProducts();
            } catch (SQLException e) {
                e.printStackTrace();
            }

            request.setAttribute("productList", productList);
            request.setAttribute("searchName", searchName);
            request.getRequestDispatcher("search.jsp").forward(request, response);
        }
    }
}