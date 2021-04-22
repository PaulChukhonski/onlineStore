package beans;

import java.util.ArrayList;

public class User {
    private int userId;
    private String name;
    private String email;
    private String address;
    private String password;

    public User() {
    }

    public User(String name, String email, String address, String password) {
        this.name = name;
        this.email = email;
        this.address = address;
        this.password = password;
    }

    public User(int userId, String name, String email, String address, String password) {
        this.userId = userId;
        this.name = name;
        this.email = email;
        this.address = address;
        this.password = password;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "User{" +
                "userId=" + userId +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", address='" + address + '\'' +
                ", password='" + password + '\'' +
                '}';
    }

    public Object selectAddress(ArrayList<User> userList, String email) {
        for(User u : userList) {
            if(u.getEmail().equals(email))
                return u.getAddress();
        }
        return "";
    }

    public Object selectName(ArrayList<User> userList, String email) {
        for(User u : userList) {
            if(u.getEmail().equals(email))
                return u.getName();
        }
        return "";
    }
}