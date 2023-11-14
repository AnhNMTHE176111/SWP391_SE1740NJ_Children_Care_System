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
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
            }

            .report-container {
                max-width: 60%;
                margin: 20px auto;
                padding: 20px;
                border: 1px solid #ccc;
                background-color: #fff;
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
                margin-bottom: 10px;
            }

            .subsection p {
                font-size: 16px;
                margin-bottom: 5px;
            }

            .active {
                background-color: green;
                color: white;
                padding: 5px;
                border-radius: 5px;
            }

            .inactive {
                background-color: red;
                color: white;
                padding: 5px;
                border-radius: 5px;
            }

            /* Style for image */
            img {
                max-width: 100%;
                height: auto;
                display: block;
                margin: 10px 0;
            }

            /* Style for the form input and select */
            input[type="date"], input[type="text"], textarea, select {
                width: 100%;
                padding: 10px;
                margin-bottom: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                box-sizing: border-box;
            }

            button {
                margin-top: 10px;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                background-color: #007BFF;
                color: white;
                cursor: pointer;
                font-size: 16px;
            }

            button:hover {
                background-color: #0056b3;
            }
            .patient-info {
                float: left;
                width: 50%;
                box-sizing: border-box;
                padding-right: 20px; /* Adjust spacing between patient info and image */
            }

            .patient-image {
                float: right;
                width: 50%;
                box-sizing: border-box;
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
                    <div class="patient-info">
                        <h2>Patient Name:</h2>
                        <p>${khachHang.getFirstName()} ${khachHang.getLastName()}</p>
                    <h2>Contact Information:</h2>
                    <p>Address: ${khachHang.getAddress()}</p>
                    <p>Phone: ${khachHang.getPhone()}</p>
                    <p>Date of Birth: ${khachHang.getDob()}</p>
                </div>
                <div class="patient-image">
                    <h2>Avatar:</h2>
                    <img src="image/profile_user/${khachHang.getAvatar()}" alt="userImg" width="300" height="200">
                </div>
            </div>


            <!-- Group 2: Slot and Medical Details -->
            <div class="section-heading">Appointment Details</div>
            <div class="subsection">
                <h2>Slot Information:</h2>
                <p>Start Time: ${rightSlot.getStartTime()}</p>
                <p>End Time: ${rightSlot.getEndTime()}</p>
                <p>Day: ${rightSlot.getDay()}</p>
            </div>

            <div class="subsection">
                <h2>Medical Information:</h2>
                <form action="staff" method="post">
                    <p>Date of Visit: ${med.getDateOfVisit()}</p>
                    <label for="dateOfRevisit">Date of Revisit:</label>
                    <input type="date" id="dateOfRevisit" name="dateOfRevisit" value="${med.getDateOfRevisit()}"><br><br>

                    <label for="symptoms">Symptoms:</label>
                    <textarea id="symptoms" name="symtoms">${med.getSymptons()}</textarea><br><br>

                    <label for="diagnosis">Diagnosis:</label>
                    <input type="text" id="diagnosis" name="diagnosis" value="${med.getDiagnosis()}" required><br><br>

                    <label for="treatmentPlan">Treatment Plan:</label>
                    <textarea id="treatmentPlan" name="treatmentPlan">${treatmentPlan}</textarea><br><br>

                    <label for="treatmentPlan">Customer Feedback:</label>
                    <textarea id="customerfeedback" name="customerfeedback" readonly="">${cusFeedback.getComment()}</textarea><br><br>
                    
                   <div class="col-12 d-flex justify-content-center" id="rx-container">
                        <table class="table table-bordered col-8">
                            <caption>Medical Prescription</caption>
                            <thead class="thead-dark">
                                <tr>
                                    <th>Medication</th>
                                    <th>Strength</th>
                                    <th>Frequency</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td colspan="3">
                                        <button type="button" class="btn btn-outline-success col-12 add-more">
                                            Add More
                                        </button>
                                    </td>
                                </tr>
                                <c:forEach items="${medicalPrescription}" var="item">
                                    <tr>
                                        <td><input type="text" class="form-control" id="rx" name="medication" value="${item.getMedication()}"></td>
                                        <td><input type="text" class="form-control" id="rx" name="strength" value="${item.getStrength()}"></td>
                                        <td><input type="text" class="form-control" id="rx" name="frequency" value="${item.getFrequency()}"></td>
                                        <td><button class="btn btn-outline-danger remove-row" type="button">X</button></td>
                                    </tr>
                                </c:forEach>

                            </tbody>
                        </table>
                    </div>

                    <input type="hidden" name="slotDoctorId" value="${slotDoctorId}">
                    <input type="hidden" name="slotId" value="${slotId}">
                    <input type="hidden" name="doctorId" value="${doctorId}">
                    <c:if test="${updateSuccess}">
                        <div class="d-flex justify-content-center col-12">
                            <div class="alert-success col-10 d-flex justify-content-center py-2">Update Success</div>
                        </div>
                    </c:if>
                    <div class="col-12 justify-content-start d-flex">
                        <div class="col-12">
                            <button style="margin-top: 20px; border-radius: 5px;" class="btn-success" type="submit" name="medId" value="${med.getMedicalInfoId()}">Update Information</button>
                            <a style=" border-radius: 5px;" class="btn btn-secondary py-2 px-4" href="/reservation"">Back</a>
                            <a class="btn btn-outline-warning mx-2" 
                               download="${fileName}" href=${filePath} >
                                Export Medical Prescription
                            </a>
                        </div>
                    </div>
                </form>
            </div>


        </div>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>
            $(document).ready(function () {
                // Xử lý khi nút "Add More" được nhấp
                $("button.add-more").click(function () {
                    var newRow = '<tr>' +
                            '<td><input type="text" class="form-control" id="rx" name="medication" required></td>' +
                            '<td><input type="text" class="form-control" id="rx" name="strength" required></td>' +
                            '<td><input type="text" class="form-control" id="rx" name="frequency" required></td>' +
                            '<td><button class="btn btn-outline-danger remove-row">X</button></td>' +
                            '</tr>';
                    $("tbody").append(newRow);
                });

                // Xử lý khi nút "X" được nhấp
                $("tbody").on("click", "button.remove-row", function () {
                    $(this).closest("tr").remove();
                });
            });
        </script>

        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
