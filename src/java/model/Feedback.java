/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author dmx
 */
public class Feedback {
    private int ratingId, medicalInfoId, bookingId;
    private String ratingValue;
    private String comment;
    private String userFirstName, userLastName, doctorFirstName, doctorLastName;

    public Feedback() {
    }

    public Feedback(int ratingId, int medicalInfoId, int bookingId, String ratingValue, String comment, String userFirstName, String userLastName) {
        this.ratingId = ratingId;
        this.medicalInfoId = medicalInfoId;
        this.bookingId = bookingId;
        this.ratingValue = ratingValue;
        this.comment = comment;
        this.userFirstName = userFirstName;
        this.userLastName = userLastName;
    }

    public Feedback(int ratingId, int medicalInfoId, int bookingId, String ratingValue, String comment, String userFirstName, String userLastName, String doctorFirstName, String doctorLastName) {
        this.ratingId = ratingId;
        this.medicalInfoId = medicalInfoId;
        this.bookingId = bookingId;
        this.ratingValue = ratingValue;
        this.comment = comment;
        this.userFirstName = userFirstName;
        this.userLastName = userLastName;
        this.doctorFirstName = doctorFirstName;
        this.doctorLastName = doctorLastName;
    }
    
    

    public Feedback(int ratingId, int medicalInfoId, String ratingValue, String comment) {
        this.ratingId = ratingId;
        this.medicalInfoId = medicalInfoId;
        this.ratingValue = ratingValue;
        this.comment = comment;
    }

    public int getBookingId() {
        return bookingId;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }

    public String getUserFirstName() {
        return userFirstName;
    }

    public void setUserFirstName(String userFirstName) {
        this.userFirstName = userFirstName;
    }

    public String getUserLastName() {
        return userLastName;
    }

    public void setUserLastName(String userLastName) {
        this.userLastName = userLastName;
    }

    public String getDoctorFirstName() {
        return doctorFirstName;
    }

    public void setDoctorFirstName(String doctorFirstName) {
        this.doctorFirstName = doctorFirstName;
    }

    public String getDoctorLastName() {
        return doctorLastName;
    }

    public void setDoctorLastName(String doctorLastName) {
        this.doctorLastName = doctorLastName;
    }
    
    
    
    
    public int getRatingId() {
        return ratingId;
    }

    public void setRatingId(int ratingId) {
        this.ratingId = ratingId;
    }

    public int getMedicalInfoId() {
        return medicalInfoId;
    }

    public void setMedicalInfoId(int medicalInfoId) {
        this.medicalInfoId = medicalInfoId;
    }

    public String getRatingValue() {
        return ratingValue;
    }

    public void setRatingValue(String ratingValue) {
        this.ratingValue = ratingValue;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    @Override
    public String toString() {
        return "Feedback{" + "ratingId=" + ratingId + ", medicalInfoId=" + medicalInfoId + ", ratingValue=" + ratingValue + ", comment=" + comment + '}';
    }
    
}