<!DOCTYPE html>
<html lang="vi">

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>CloudCampus Dashboard</title>
        <link rel="stylesheet" href="css/managerDashboard.css" />
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script src="js/managerDashboard.js" defer></script>
    </head>

    <body>
        <div class="dashboard">
            <div class="sidebar">
                <div class="profile">
                    <img src="path_to_headmaster_image.jpg" alt="Headmaster" />
                    <p>Headmaster</p>
                </div>
                <ul>
                    <li class="active">Dashboard</li>
                    <li>Reservation List</li>
                    <li>Posts List</li>
                    <li>Sliders List</li>
                    <li>Services List</li>
                    <li>Customers List</li>
                    <li>Feedbacks List</li>
                    <!-- ... add other items ... -->
                </ul>
            </div>

            <div class="main-content">
                <h1>Dashboard</h1>
                <!-- Statistic boxes -->
                <div class="stats">
                    <div class="stat">43<br />Total Students</div>
                    <div class="stat">6<br />Total Teachers</div>
                    <div class="stat">2<br />Total Parents</div>
                    <div class="stat">0<br />Attend Students</div>
                </div>

                <!-- Chart -->
                <div class="chart-section">
                    <h2>Reservation List</h2>
                    <canvas id="reservationChart"></canvas>
                </div>


                <!-- Ph?n thông tin ng?n v? l?p h?c -->
                <div class="short-info">
                    <h2>Class Short Information</h2>
                    <table>
                        <thead>
                            <tr>
                                <th>Class Name</th>
                                <th>Student Amount</th>
                                <th>Daily Attendance %</th>
                                <th>Yearly Attendance %</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Class 1</td>
                                <td>6</td>
                                <td>50%</td>
                                <td>50%</td>
                            </tr>
                            <tr>
                                <td>Class 2</td>
                                <td>7</td>
                                <td>100%</td>
                                <td>100%</td>
                            </tr>
                            <tr>
                                <td>Class 3</td>
                                <td>4</td>
                                <td>75%</td>
                                <td>75%</td>
                            </tr>
                            <!-- ... thêm các hàng khác ... -->
                        </tbody>
                    </table>
                </div>

                <!-- Ph?n h?p tin nh?n -->
                <div class="message-box">
                    <h2>Message Box</h2>
                    <!-- N?i dung c?a h?p tin nh?n -->
                </div>

            </div>
        </div>
    </body>

</html>
