package edu.poly.app.domain;

import java.util.Date;

public class FavoriteUserReport {
    private String userID;
    private String fullname;
    private String email;
    private Date likeDate;

    public FavoriteUserReport() {
    }

    public FavoriteUserReport(String userID, String fullname, String email, Date likeDate) {
        this.userID = userID;
        this.fullname = fullname;
        this.email = email;
        this.likeDate = likeDate;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getLikeDate() {
        return likeDate;
    }

    public void setLikeDate(Date likeDate) {
        this.likeDate = likeDate;
    }
}
