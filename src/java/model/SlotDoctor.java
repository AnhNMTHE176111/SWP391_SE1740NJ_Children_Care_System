/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author dmx
 */
public class SlotDoctor {
    private int slotDoctorId,slotId, doctorId, status;
    private String description;

    public SlotDoctor() {
    }

    public SlotDoctor(int slotId, int doctorId, int status) {
        this.slotId = slotId;
        this.doctorId = doctorId;
        this.status = status;

    }

    public int getSlotDoctorId() {
        return slotDoctorId;
    }

    public void setSlotDoctorId(int slotDoctorId) {
        this.slotDoctorId = slotDoctorId;
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
    
}
