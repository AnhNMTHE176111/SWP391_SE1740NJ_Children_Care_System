/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author dmx
 */
public class Booking {

    private int bookingId, bookingStatus, customerId, medicalInfoId, slotDoctorId, slotId, doctorId, status;
    private String description, doctorName, customerName, startTime, diagnosis, bookingDate, bookingTime, bookingCreateDate, bookingCreateTime, serviceName;
  
    private Date day;
    public Booking() {
    }


    public Booking(int stauts, int customerId, int medicalInfoId, int slotDoctorId) {
        this.status = stauts;
        this.customerId = customerId;
        this.medicalInfoId = medicalInfoId;
        this.slotDoctorId = slotDoctorId;
    }

    public Booking(int status, int customerId, int slotDoctorId) {
        this.status = status;
        this.customerId = customerId;
        this.slotDoctorId = slotDoctorId;
    }

    public Booking(int bookingId, int status ,Date day) {
        this.bookingId = bookingId;
        this.status = status;
        this.day = day;
    }
    
    public Booking(int bookingId, int bookingStatus, String starTime, int status,  String doctorName, String customerName, Date day){
        this.bookingId = bookingId;
        this.bookingStatus = bookingStatus;
        this.startTime = starTime;
        this.status = status;
        this.doctorName = doctorName;
        this.customerName = customerName;
        this.day = day;
    }
    
    public Booking(int bookingId, int bookingStatus, int customerId, String diagnosis, String bookingDate, String bookingTime, String doctorName, String serviceName, String bookingCreateDate, String bookingCreateTime) {
        this.bookingId = bookingId;
        this.bookingStatus = bookingStatus;
        this.customerId = customerId;
        this.diagnosis = diagnosis;
        this.bookingDate = bookingDate;
        this.bookingTime = bookingTime;
        this.doctorName = doctorName;
        this.serviceName = serviceName;
        this.bookingCreateDate = bookingCreateDate;
        this.bookingCreateTime = bookingCreateTime;
    }

    public String getDoctorName() {
        return doctorName;
    }

    public void setDoctorName(String doctorName) {
        this.doctorName = doctorName;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;

    
    }

    public String getServiceName() {
        return serviceName;
    }
    

    public String getDiagnosis() {
        return diagnosis;
    }

    public String getBookingDate() {
        return bookingDate;
    }

    public String getBookingTime() {
        return bookingTime;
    }

 
    public String getBookingCreateTime() {
        return bookingCreateTime;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }
  
    public void setDiagnosis(String diagnosis) {
        this.diagnosis = diagnosis;
    }

    public void setBookingDate(String bookingDate) {
        this.bookingDate = bookingDate;
    }

    public void setBookingTime(String bookingTime) {
        this.bookingTime = bookingTime;
    }



    public void setBookingCreateDate(String bookingCreateDate) {
        this.bookingCreateDate = bookingCreateDate;
    }

    public void setBookingCreateTime(String bookingCreateTime) {
        this.bookingCreateTime = bookingCreateTime;
    }

    public String getBookingCreateDate() {
        return bookingCreateDate;
    }
    
    

    
    
    

    public int getBookingId() {
        return bookingId;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }
    
    

    public int getSlotId() {
        return slotId;
    }

    public void setSlotId(int slotId) {
        this.slotId = slotId;
    }

    public int getDoctorId() {
        return doctorId;
    }

    public void setDoctorId(int doctorId) {
        this.doctorId = doctorId;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getDay() {
        return day;
    }

    public void setDay(Date day) {
        this.day = day;
    }

    public int getBookingStatus() {
        return bookingStatus;
    }

    public void setBookingStatus(int bookingStatus) {
        this.bookingStatus = bookingStatus;
    }
    
    

   

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public int getMedicalInfoId() {
        return medicalInfoId;
    }

    public void setMedicalInfoId(int medicalInfoId) {
        this.medicalInfoId = medicalInfoId;
    }

    public int getSlotDoctorId() {
        return slotDoctorId;
    }

    public void setSlotDoctorId(int slotDoctorId) {
        this.slotDoctorId = slotDoctorId;
    }

}
