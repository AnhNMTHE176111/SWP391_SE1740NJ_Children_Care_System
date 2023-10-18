/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author dmx
 */
public class Booking {
    private String bookingId, bookingStatus, customerId, symptomps, bookingDate, bookingTime, doctorName, bookingCreateDate, bookingCreateTime ;

    public Booking() {
    }

    public Booking(String bookingId, String bookingStatus, String customerId, String symptomps, String bookingDate, String bookingTime, String doctorName, String bookingCreateDate, String bookingCreateTime) {
        this.bookingId = bookingId;
        this.bookingStatus = bookingStatus;
        this.customerId = customerId;
        this.symptomps = symptomps;
        this.bookingDate = bookingDate;
        this.bookingTime = bookingTime;
        this.doctorName = doctorName;
        this.bookingCreateDate = bookingCreateDate;
        this.bookingCreateTime = bookingCreateTime;
    }

    public String getBookingId() {
        return bookingId;
    }

    public String getBookingStatus() {
        return bookingStatus;
    }

    public String getCustomerId() {
        return customerId;
    }

    public String getSymptomps() {
        return symptomps;
    }

    public String getBookingDate() {
        return bookingDate;
    }

    public String getBookingTime() {
        return bookingTime;
    }

    public String getDoctorName() {
        return doctorName;
    }

    public String getBookingCreateDate() {
        return bookingCreateDate;
    }

    public String getBookingCreateTime() {
        return bookingCreateTime;
    }

    public void setBookingId(String bookingId) {
        this.bookingId = bookingId;
    }

    public void setBookingStatus(String bookingStatus) {
        this.bookingStatus = bookingStatus;
    }

    public void setCustomerId(String customerId) {
        this.customerId = customerId;
    }

    public void setSymptomps(String symptomps) {
        this.symptomps = symptomps;
    }

    public void setBookingDate(String bookingDate) {
        this.bookingDate = bookingDate;
    }

    public void setBookingTime(String bookingTime) {
        this.bookingTime = bookingTime;
    }

    public void setDoctorName(String doctorName) {
        this.doctorName = doctorName;
    }

    public void setBookingCreateDate(String bookingCreateDate) {
        this.bookingCreateDate = bookingCreateDate;
    }

    public void setBookingCreateTime(String bookingCreateTime) {
        this.bookingCreateTime = bookingCreateTime;
    }
    
    

    
   
}
