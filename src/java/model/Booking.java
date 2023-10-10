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

    private int stauts, customerId, medicalInfoId, slotDoctorId;

    public Booking() {
    }

    public Booking(int stauts, int customerId, int medicalInfoId, int slotDoctorId) {
        this.stauts = stauts;
        this.customerId = customerId;
        this.medicalInfoId = medicalInfoId;
        this.slotDoctorId = slotDoctorId;
    }

    public Booking(int status, int customerId, int slotDoctorId) {
        this.stauts = stauts;
        this.customerId = customerId;
        this.slotDoctorId = slotDoctorId;
    }

    public int getStauts() {
        return stauts;
    }

    public void setStauts(int stauts) {
        this.stauts = stauts;
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
