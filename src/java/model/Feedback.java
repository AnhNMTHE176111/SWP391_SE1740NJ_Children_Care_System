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
    private int ratingId, medicalInfoId;
    private String ratingValue;
    private String comment;

    public Feedback() {
    }

    public Feedback(int ratingId, int medicalInfoId, String ratingValue, String comment) {
        this.ratingId = ratingId;
        this.medicalInfoId = medicalInfoId;
        this.ratingValue = ratingValue;
        this.comment = comment;
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
