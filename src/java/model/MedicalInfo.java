/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author dmx
 */
public class MedicalInfo extends Feedback{
    private int medicalInfoId, rattingId;
    private String dateOfVisit, dateOfRevisit, symptons, diagnosis, treatmentPlan;

    public MedicalInfo() {
    }

    public MedicalInfo(int medicalInfoId, int rattingId, String dateOfVisit, String dateOfRevisit, String symptons, String diagnosis, String treatmentPlan) {
        this.medicalInfoId = medicalInfoId;
        this.rattingId = rattingId;
        this.dateOfVisit = dateOfVisit;
        this.dateOfRevisit = dateOfRevisit;
        this.symptons = symptons;
        this.diagnosis = diagnosis;
        this.treatmentPlan = treatmentPlan;
    }

    public MedicalInfo(String dateOfVisit, String dateOfRevisit, String symptons, String diagnosis, String treatmentPlan, int ratingId, int medicalInfoId, Float ratingValue, String comment) {
        super(ratingId, medicalInfoId, ratingValue, comment);
        this.dateOfVisit = dateOfVisit;
        this.dateOfRevisit = dateOfRevisit;
        this.symptons = symptons;
        this.diagnosis = diagnosis;
        this.treatmentPlan = treatmentPlan;
    }

    
    
    @Override
    public int getMedicalInfoId() {
        return medicalInfoId;
    }

    @Override
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

    @Override
    public String toString() {
        return "MedicalInfo{" + "medicalInfoId=" + medicalInfoId + ", rattingId=" + rattingId + ", dateOfVisit=" + dateOfVisit + ", dateOfRevisit=" + dateOfRevisit + ", symptons=" + symptons + ", diagnosis=" + diagnosis + ", treatmentPlan=" + treatmentPlan + '}';
    }

    
}
