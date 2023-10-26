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
public class SlotDoctor extends Slot{
    private int slotId, doctorId, status;
    private String description;
<<<<<<< Updated upstream
    private int day;
    
    public SlotDoctor( int slotId, String startTime,String endTime,  int doctorId, int status, String description) {
=======
    private Date day;

    public SlotDoctor(int slotId, String startTime, String endTime, int doctorId, int status, String description, Date day) {
>>>>>>> Stashed changes
        super(slotId, startTime, endTime);
        this.slotId = slotId;
        this.doctorId = doctorId;
        this.status = status;
        this.description = description;
        this.day = day;
    }

    public SlotDoctor() {
    }

    public SlotDoctor(int slotId, int doctorId, int status, String description) {
        this.slotId = slotId;
        this.doctorId = doctorId;
        this.status = status;
        this.description = description;
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

    public int getDay() {
        return day;
    }

    public void setDay(int day) {
        this.day = day;
    }

    @Override
    public String toString() {
        return "SlotDoctor{" + "slotId=" + slotId + ", doctorId=" + doctorId + ", status=" + status + ", description=" + description + ", day=" + day + '}';
    }
    
}
