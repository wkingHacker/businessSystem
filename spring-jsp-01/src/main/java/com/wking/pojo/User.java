package com.wking.pojo;

/**
 * @author Wking
 * @create 2020-12-15 15:57
 */
public class User {
    int uid;
    String username;
    String PASSWORD;
    String email;
    String telephone;

    public User() {
    }

    public User(int uid, String username, String PASSWORD, String email, String telephone) {
        this.uid = uid;
        this.username = username;
        this.PASSWORD = PASSWORD;
        this.email = email;
        this.telephone = telephone;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPASSWORD() {
        return PASSWORD;
    }

    public void setPASSWORD(String PASSWORD) {
        this.PASSWORD = PASSWORD;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    @Override
    public String toString() {
        return "User{" +
                "uid='" + uid + '\'' +
                ", username='" + username + '\'' +
                ", PASSWORD='" + PASSWORD + '\'' +
                ", email='" + email + '\'' +
                ", telephone='" + telephone + '\'' +
                '}';
    }
}
