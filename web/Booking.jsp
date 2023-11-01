<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import= "DAO.DAOBooking" %>
<%@page import= "DAO.DAODoctor" %>
<%@page import= "DAO.DAOSlot" %>
<%@page import= "DAO.DAOSpecialty" %>
<%@page import= "DAO.DAOUser" %>
<%@page import= "DAO.DAOSlotDoctor" %>
<%@page import= "model.Specialty" %>
<%@page import= "model.Booking" %>
<%@page import= "model.User" %>
<%@page import= "model.Slot" %>
<%@page import= "model.Doctor" %>
<%@page import= "model.SlotDoctor" %>
<%@page import= "java.util.ArrayList" %>
<%--<%@page import= "util.SomeClassInUtilPackage" %>--%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link href="css/Booking.css" rel="stylesheet" />

        <title>Đặt Lịch Hẹn</title>
    </head>
    <body>
        <div id="serviceListData" style="display: none;"
             data-service-list='[
             <c:forEach var="slot" items="${serviceList}" varStatus="loop">
                 {"ServiceId": ${slot.getServiceId()}, "ServiceName": "${slot.getServiceName()}", "DoctorId": "${slot.getDoctorId()}"}
                 <c:if test="${not loop.last}">,</c:if>
             </c:forEach>
             ]'>
        </div>


        <div id="bookedSlotsData" style="display: none;"
             data-booked-slots='[
             <c:forEach var="slot" items="${availeSlot}" varStatus="loop">
                 {"DoctorId": ${slot.getDoctorId()}, "SlotId": ${slot.getSlotId()}, "Day": "${slot.getDay()}"}
                 <c:if test="${not loop.last}">,</c:if>
             </c:forEach>
             ]'>
        </div>
        <div class="container">
            <div class="background-img">
                <div id="step1" class="step">
                    <div class="register-text">
                        <h1 class="register"> Đăng ký khám</h1>
                        <h3 class="select-info">
                            <span class="step-num">Bước 1/3</span> - Chọn thông tin
                        </h3>
                    </div>

                    <div class="side">
                        <div>

                            <div class="form-group label-box">
                                <select
                                    id="selectedSpecialty"
                                    class="form-control select2-hidden-accessible"
                                    onchange="onSpecialtyChange(this.value)"
                                    >
                                    <option class="option-box" value="0">
                                    <ion-icon name="briefcase-outline"></ion-icon>Chọn chuyên khoa
                                    </option>
                                    <c:forEach var="specialty" items="${specialtyList}">
                                        <option
                                            class="option-box"
                                            value="${specialty.getSpecialtyId()}"
                                            data-specialty="${specialty.getSpecialtyId()}"
                                            >
                                            ${specialty.getSpecialtyName()}
                                        </option>
                                    </c:forEach>
                                </select>
                                <!--<span class="error-message" id="specialtyError"></span>-->
                            </div>

                            <div class="form-group label-box">
                                <select
                                    id="selectedDoctor"
                                    class="form-control select2-hidden-accessible"
                                    onchange="onDoctorChange(this)"
                                    >
                                    <option class="option-box" value="0">
                                    <ion-icon name="person-outline"></ion-icon>Chọn bác sĩ muốn khám
                                    </option>
                                    <c:forEach var="doctor" items="${doctorList}">
                                        <option
                                            class="option-box doctor-option"
                                            value="${doctor.getDoctorId()}"
                                            data-specialty="${doctor.getSpecialtyId()}"
                                            style="display: none"

                                            >
                                            ${doctor.getName()}
                                        </option>
                                    </c:forEach>
                                </select>
                                <!--                                <span class="error-message" id="doctorError"></span>-->
                            </div>

                            <div class="form-group label-box">

                                <select id="serviceDropdown" class="form-control select2-hidden-accessible" onchange="onDoctorChange(this)">
                                    <option class="option-box" value="0">Chọn dịch vụ</option>

                                </select>
                            </div>



                        </div>

                        <div class="date-select">

                            <h4 class="day-select">Chọn ngày khám:</h4>
                            <div class="date-slots" id="selectedDate">
                                <c:forEach var="date" items="${dateList}">
                                    <div class="date-box">
                                        <div class="date-slot" name="date" onclick="onDateSelect('${date}')">${date}</div>
                                    </div>
                                </c:forEach>
                            </div>


                            <div class="date-hidden">
                                <div class="date">
                                    <c:forEach var="slot" items="${slotList}">

                                        <button class="grid-date" name="slot" value="${slot.slotId}" onclick="onSlotSelect('${slot.startTime}', '${slot.slotId}')">${slot.startTime}</button>

                                    </c:forEach>
                                </div>
                            </div>

                        </div>
                    </div>
                    <button class="submit-button submit1">Tiếp Tục</button>
                </div>
            </div>



            <div id="step2" class="step" style="display: none">
                <h1 class="register-line">Đăng ký khám</h1>
                <div class="step-line">
                    <h3 style="position: relative; bottom: 20px">
                        <span class="step-num">Bước 2/3</span> - Thông tin khách hàng
                    </h3>

                    <div class="form-input">
                        <div>
                             <div class="aside">
            <div class="form-group">
                <label for="customer-name"></label>
                <input
                    class="input-size side-name"
                    type="text"
                    placeholder="Họ và tên (*)"
                    id="customer-name"
                    value="${(currentUser != null) ? currentUser.getLastName().concat(' ').concat(currentUser.getFirstName()) : ''}"
                    ${currentUser != null ? 'readonly' : ''}
                />
            </div>
            <div class="form-group">
                <div class="customer-gender-input">
                    <input type="radio" id="male" name="gender" value="Nam" 
                        ${currentUser != null && currentUser.getGender() == 'Nam' ? 'checked' : ''}
                 
                    />
                    <label for="male">Nam</label>

                    <input type="radio" id="female" name="gender" value="Nữ" 
                        ${currentUser != null && currentUser.getGender() == 'Nữ' ? 'checked' : ''}
                  
                    />
                    <label for="female">Nữ</label>
                </div>
            </div>

            <div class="form-group">
                <label for="bookingdob"></label>
                <input
                    class="input-size"
                    type="date"
                    placeholder="Ngày sinh (*)"
                    id="bookingdob"
                    value="${currentUser != null ? currentUser.getDob() : ''}"
                    ${currentUser != null ? 'readonly' : ''}
                />
            </div>

            <div class="form-group">
                <label for="customer-phone"></label>
                <input
                    class="input-size"
                    type="text"
                    placeholder="Số điện thoại (*)"
                    id="customer-phone"                                  
                    value="${currentUser != null ? currentUser.getPhone() : ''}"
                    ${currentUser != null ? 'readonly' : ''}
                />
            </div>

            <div class="form-group">
                <label for="customer-email"></label>
                <input
                    class="input-size"
                    type="text"
                    placeholder="Để lại email để nhận thông tin lịch hẹn"
                    id="customer-email"
                    value="${currentUser != null ? currentUser.getEmail() : ''}"
                    ${currentUser != null ? 'readonly' : ''}
                />
            </div>

                        <div class="form-group">
                            <div style="position: relative; top: 20px">
                                <label for="customer-symptoms"></label>
                                <textarea
                                    cols="30"
                                    rows="3"
                                    placeholder="Mô tả triệu chứng của bạn và nhu cầu thăm khám (*)"
                                    id="customer-symptoms"
                                    class="input-place"
                                    ></textarea>
                            </div>
                        </div>
                    </div>

                    <div class="button-line">
                        <button class="back-button" onclick="showStep(1)">Quay Lại</button>
                        <button class="submit-button" onclick="displayConfirmation(); showStep(3);" disable>
                            Tiếp Tục
                        </button>

                    </div>
                </div>
            </div>


            <div id="step3" class="step" style="display: none">
                <h1 class="register-line">Đăng ký khám</h1>

                <h3 style="position: relative; bottom: 100px">
                    <span class="step-num">Bước 3/3</span> - Xác nhận và hoàn tất
                </h3>
                <form action="/booking" method="POST">
                    <div class="confirm-content">
                        <h3>Xác nhận và hoàn tất</h3>
                        <div class="row">
                            <div class="column">
                                <input type="hidden" name="doctorId" id="hidden-doctorId" value="">
                                <input type="hidden" name="selectedSlotId" id="selectedSlotId" value="">

                                <p><strong>Chuyên Khoan:</strong> <span id="confirm-specialty"></span>
                                    <input type="hidden" name="specialty" id="hidden-specialty" value="">
                                </p>
                                <p><strong>Ngày Khám:</strong> <span id="confirm-date"></span>
                                    <input type="hidden" name="selectedDate" id="hidden-date" value="">
                                </p>
                                <p><strong>Slot thời gian:</strong> <span id="confirm-slot"></span>
                                    <input type="hidden" name="selectedSlot" id="hidden-slot" value="">
                                </p>
                                <p><strong>Bác sĩ:</strong> <span id="confirm-doctor"></span>
                                    <input type="hidden" name="selectedDoctor" id="hidden-doctor" value="">
                                </p>

                                <p><strong>Dịch vụ:</strong> <span id="confirm-service"></span>
                                    <input type="hidden" name="selectedService" id="hidden-service" value="">
                                </p>
                            </div>

                            <div class="column">
                                <p><strong>Họ và tên:</strong> <span id="confirm-name"></span>
                                    <input type="hidden" name="name" id="hidden-name" value="">
                                </p>
                                <p><strong>Giới tính:</strong> <span id="confirm-gender"></span>
                                    <input type="hidden" name="gender" id="hidden-gender" value="">
                                </p>
                                <p><strong>Ngày sinh:</strong> <span id="confirm-dob"></span>
                                    <input type="hidden" name="dob" id="hidden-dob" value="">
                                </p>
                                <p><strong>Số điện thoại:</strong> <span id="confirm-phone"></span>
                                    <input type="hidden" name="phone" id="hidden-phone" value="">
                                </p>
                                <p><strong>Email:</strong> <span id="confirm-email"></span>
                                    <input type="hidden" name="email" id="hidden-email" value="">
                                </p>
                                <p><strong>Trieệu chứng:</strong> <span id="confirm-symptoms"></span>
                                    <input type="hidden" name="symptoms" id="hidden-symptoms" value="">
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="otp-section">
                        <label for="otp-input">Nhập mã OTP đã gửi đến email của bạn:</label>
                        <input type="text" id="otp-input" name="otp" placeholder="Mã OTP">
                    </div>
                    <div class="button-line">
                        <button class="back-button" type="button" onclick="showStep(2)">Quay Lại</button>
                        <button class="submit-button" type="submit" onclick="redirectToHome()">Xác nhận</button>
                    </div>

             

                </form>

            </div>

        </div>

        <script src="js/Booking.js"></script>
        <script
            type="module"
            src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"
        ></script>
    </body>
</html>


