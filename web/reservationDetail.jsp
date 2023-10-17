<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Doctor's Treatment Report</title>
        <style>
            body {
                font-family: Arial, sans-serif;
            }
            .report-container {
                max-width: 60%;
                margin: 0 auto;
                padding: 20px;
                border: 1px solid #f5e9e9;
                background-color: #f9f9f9;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            .section-heading {
                font-size: 24px;
                font-weight: bold;
                margin-top: 20px;
            }
            .subsection {
                margin-top: 10px;
                margin-left: 20px;
            }
            .subsection h2 {
                font-size: 20px;
                font-weight: bold;
            }
            .subsection p {
                font-size: 16px;
            }
        </style>
    </head>
    <jsp:include page="header.jsp"></jsp:include>
        <body>

            <!-- Report Container -->
            <div class="report-container">

                <!-- Group 1: Patient Information -->
                <div class="section-heading">Patient Information</div>
                <div class="subsection">
                    <h2>Patient Name:</h2>
                    <p>${khachHang.getFirstName()} ${khachHang.getLastName()}</p>
                    <h2>Contact Information:</h2>
                    <p>Address: ${khachHang.getAddress()}</p>
                    <p>Phone: ${khachHang.getPhone()}</p>
                    <p>Date of Birth: ${khachHang.getDob()}</p>
                    <p>Avatar: ${khachHang.getAvatar()}</p>
                </div>

            <!-- Group 2: Slot and Medical Details -->
            <div class="section-heading">Appointment Details</div>
            <div class="subsection">
                <h2>Slot Information:</h2>
                <p>Slot ID: ${slotId}</p>
                <p>Doctor ID: ${doctorId}</p>
                <p>Slot Doctor ID: ${slotDoctorId}</p>
                <p>Start Time: ${rightSlot.getStartTime()}</p>
                <p>End Time: ${rightSlot.getEndTime()}</p>
            </div>

            <div class="subsection">
                <h2>Medical Information:</h2>
                <p>Date of Visit: ${med.getDateOfVisit()}</p>
                <p>Date of Revisit: ${med.getDateOfRevisit()}</p>
                <p>Symptoms: ${med.getSymptons()}</p>
                <p>Diagnosis: ${med.getDiagnosis()}</p>
                <p>Treatment Plan: ${med.getTreatmentPlan()}</p>
                <p>Rating Value: ${med.getRatingValue()}</p>
                <p>Doctor's Comment: ${med.getComment()}</p>
            </div>
        </div>

        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
