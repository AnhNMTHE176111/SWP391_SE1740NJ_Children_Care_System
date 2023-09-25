
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import= "DAO.DAOBooking" %>
<%@page import= "DAO.DAODoctor" %>
<%@page import= "DAO.DAOSlot" %>
<%@page import= "model.Booking" %>
<%@page import= "model.Slot" %>
<%@page import= "model.Doctor" %>
<%@page import= "java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link href="css/Booking.css" rel="stylesheet" />

        <title>Đặt Lịch Hẹn</title>
    </head>
    <body>
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
                                    id="selectedPlaceId"
                                    class="form-control select2-hidden-accessible"
                                    >
                                    <option class="option-box" value="2">Chọn cơ sở khám</option>
                                    <option class="option-box" value="3">
                                        BV ĐKQT Vinmec Central Park (Hồ Chí Minh)
                                    </option>
                                    <option class="option-box" value="1">
                                        BV ĐKQT Vinmec Times City (Hà Nội)
                                    </option>

                                </select>
                            </div>
                            <div class="form-group label-box">
                                <select
                                    id="selectedSpecialty"
                                    class="form-control select2-hidden-accessible"
                                    onchange="showDoctors(this.value)"
                                    >
                                    <option class="option-box" value="0">
                                    <ion-icon name="briefcase-outline"></ion-icon>Chọn chuyên khoa
                                    </option>
                                    <c:forEach var="specialty" items="${specialtyList}">
                                        <option class="option-box" value="1">
                                            ${specialty.specialty}
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>

                            <!-- Thẻ select bác sĩ -->
                            <div class="form-group label-box">
                                <select
                                    id="selectedDoctor"
                                    class="form-control select2-hidden-accessible"
                                    >
                                    <option class="option-box" value="0">
                                    <ion-icon name="person-outline"></ion-icon>Chọn bác sĩ muốn khám
                                    </option>
                                </select>
                            </div>

                            <!-- Div để hiển thị danh sách bác sĩ -->
                            <div id="doctorList"></div>
                        </div>

                        <div class="date-select">
                            <h4 class="day-select">Chọn ngày khám:</h4>
                            <div class="date-slots">
                                <div class="date-box date1">
                                    <div class="date-slot">Ngày 1</div>
                                </div>
                                <div class="date-box date2">
                                    <div class="date-slot">Ngày 2</div>
                                </div>
                                <div class="date-box date3">
                                    <div class="date-slot">Ngày 3</div>
                                </div>
                                <div class="date-box date4">
                                    <div class="date-slot">Ngày 4</div>
                                </div>

                                <!-- Thêm các hộp và ô slot ngày khác nếu cần -->
                            </div>

                            <div class="date-hidden">
                                <div class="date">
                                    <c:forEach var="slot" items="${slotList}">
                                        <button class="grid-date">${slot.startTime}</button>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                    <button class="submit-button submit1">Tiếp Tục</button>
                </div>
            </div>

            <!-- Bước 2: Thông tin khách hàng -->

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
                                        />
                                </div>
                                <div class="form-group">
                                    <div class="customer-gender-input">
                                        <input type="radio" id="male" value="1" />
                                        <label for="male" class="">Nam</label>
                                        <input type="radio" id="female" value="0" />
                                        <label for="female" class="">Nữ</label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="bookingdob"></label>
                                <input
                                    class="input-size"
                                    type="text"
                                    placeholder="Ngày sinh (*)"
                                    id="bookingdob"
                                    readonly="readonly"
                                    />
                            </div>
                            <div class="form-group">
                                <label for="customer-phone"></label>
                                <input
                                    class="input-size"
                                    type="text"
                                    placeholder="Số điện thoại (*)"
                                    id="customer-phone"
                                    />
                            </div>
                            <div class="form-group">
                                <label for="customer-email"></label>
                                <input
                                    class="input-size"
                                    type="text"
                                    placeholder="Để lại email để nhận thông tin lịch hẹn"
                                    id="customer-email"
                                    />
                            </div>
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
                        <button class="submit-button" onclick="showStep(3)">
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
                <div class="confirm-content">
                    <h3>Xác nhận và hoàn tất</h3>
                    <p>Thông tin xác nhận sẽ được hiển thị ở đây.</p>
                </div>
            </div>
        </div>

        <script src="js/Booking.js"></script>
        <script
            type="module"
            src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"
        ></script>
    </body>
</html>


