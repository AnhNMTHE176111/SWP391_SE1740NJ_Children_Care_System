/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author dmx
 */
public class Specialty {
    private int SpecialtyId;
    private String SpecialtyName, Description;

    public Specialty() {
    }

    public Specialty(int SpecialtyId, String SpecialtyName, String Description) {
        this.SpecialtyId = SpecialtyId;
        this.SpecialtyName = SpecialtyName;
        this.Description = Description;
    }

    public int getSpecialtyId() {
        return SpecialtyId;
    }

    public void setSpecialtyId(int SpecialtyId) {
        this.SpecialtyId = SpecialtyId;
    }

    public String getSpecialtyName() {
        return SpecialtyName;
    }

    public void setSpecialtyName(String SpecialtyName) {
        this.SpecialtyName = SpecialtyName;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }
    
    
}
