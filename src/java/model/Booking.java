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
    private String day, slotm, specialty, doctor ;

    public Booking() {
    }

    public Booking(String day, String slotm, String specialty, String doctor) {
        this.day = day;
        this.slotm = slotm;
        this.specialty = specialty;
        this.doctor = doctor;
    }

    public String getDay() {
        return day;
    }

    public void setDay(String day) {
        this.day = day;
    }

    public String getSlotm() {
        return slotm;
    }

    public void setSlotm(String slotm) {
        this.slotm = slotm;
    }

    public String getSpecialty() {
        return specialty;
    }

    public void setSpecialty(String specialty) {
        this.specialty = specialty;
    }

    public String getDoctor() {
        return doctor;
    }

    public void setDoctor(String doctor) {
        this.doctor = doctor;
    }

    
   
}
