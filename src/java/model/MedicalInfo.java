/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author dmx
 */
public class MedicalInfo {
    private int medicalInfoId, rattingId;
    private String dateOfVisit, dateOfRevisit, symptons, diagnosis, treatmentPlan;

    public MedicalInfo() {
    }

    public int getMedicalInfoId() {
        return medicalInfoId;
    }

    public void setMedicalInfoId(int medicalInfoId) {
        this.medicalInfoId = medicalInfoId;
    }

    public int getRattingId() {
        return rattingId;
    }

    public void setRattingId(int rattingId) {
        this.rattingId = rattingId;
    }

    public String getDateOfVisit() {
        return dateOfVisit;
    }

    public void setDateOfVisit(String dateOfVisit) {
        this.dateOfVisit = dateOfVisit;
    }

    public String getDateOfRevisit() {
        return dateOfRevisit;
    }

    public void setDateOfRevisit(String dateOfRevisit) {
        this.dateOfRevisit = dateOfRevisit;
    }

    public String getSymptons() {
        return symptons;
    }

    public void setSymptons(String symptons) {
        this.symptons = symptons;
    }

    public String getDiagnosis() {
        return diagnosis;
    }

    public void setDiagnosis(String diagnosis) {
        this.diagnosis = diagnosis;
    }

    public String getTreatmentPlan() {
        return treatmentPlan;
    }

    public void setTreatmentPlan(String treatmentPlan) {
        this.treatmentPlan = treatmentPlan;
    }

    
}
