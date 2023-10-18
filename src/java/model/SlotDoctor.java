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
public class SlotDoctor extends Slot {

    private int slotDoctorId, doctorId, status;
    private String description;
    private Date day;

    public SlotDoctor(int slotId, String startTime, String endTime, int doctorId, int status, String description) {
        super(slotId, startTime, endTime);
        this.doctorId = doctorId;
        this.status = status;
        this.description = description;
    }

    public SlotDoctor() {
    }

    public SlotDoctor(int doctorId, int slotId, Date day) {
        this.doctorId = doctorId;
        setSlotId(slotId);
        this.day = day;

    }

    public Date getDay() {
        return day;
    }

    public void setDay(Date day) {
        this.day = day;
    }

    public int getSlotDoctorId() {
        return slotDoctorId;
    }

    public void setSlotDoctorId(int slotDoctorId) {
        this.slotDoctorId = slotDoctorId;
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

   
}
