<%-- Document : reservation Created on : Oct 7, 2023, 6:16:35 PM Author : Admin --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f0f0f0;
                margin: 0;
                padding: 0;
            }

            /* Header Styles */
            h1 {
                text-align: center;
                padding: 40px;
            }

            /* Table Styles */
            table {
                width: 80%;
                margin: 0 auto;
                border-collapse: collapse;
                background-color: white;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }

            th, td {
                border: 1px solid #ccc;
                padding: 10px;
                text-align: left;
            }

            th {
                background-color: #f2f2f2;
            }

            /* Status Styles */
            /*            table {
            margin-left: 140px;
            width: 80%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid black;
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }*/
            .active {
                background-color: #4CAF50;
                color: white;
                padding: 5px;
                border-radius: 5px;
            }

            .inactive {
                background-color: #FF5733;
                color: white;
                padding: 5px;
                border-radius: 5px;
            }

            /* Form Styles */
            form {
                display: inline;
            }

            select {
                padding: 5px;
            }

            /* Button Styles */
            input[type="submit"] {
                background-color: #007BFF;
                color: white;
                padding: 5px 10px;
                border: none;
                cursor: pointer;
            }

            /* Hover Effect for Table Rows */
            tbody tr:hover {
                background-color: #f2f2f2;
            }

            .pending {
                background-color: #FFA500; /* Pumpkin orange color */
                color: white;
                padding: 5px;
                border-radius: 5px;
            }

        </style>
    </head>
    <jsp:include page="header.jsp"></jsp:include>

        <body>

            <h1 style="margin-left: 100px;padding: 40px;">List Reservation </h1>
            <div class="col-12 d-flex justify-content-center">
                <div class="col-2">

                </div>

            <c:choose>
                <c:when test="${module eq 'all'}">
                    <div class="col-8 d-flex justify-content-between">
                        <h3>All Appointment</h3>
                        <div class="col-3 form-group d-flex justify-content-around align-content-center">
                            <label for="dateFilter1" class="btn" style="font-weight: bolder">Date: </label>
                            <input type="date" id="dateFilter1" class="form-control" value="${date}"/>
                            <button type="submit" class="btn btn-outline-secondary" onclick="handleFilterDate()">Find</button>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="col-8 d-flex justify-content-between">
                        <h3>Upcoming Appointment</h3>
                        <div class="col-2 form-group">
                            <select name="dateFilter" id="dateFilter" title="abc" class="form-control">
                                <option ${date eq "all" ? "selected" : ''} value="all">All</option>
                                <option ${date eq "today" ? "selected" : ''} value="today">Today</option>
                                <option ${date eq "tommorow" ? "selected" : ''} value="tommorow">Tommorow</option>              
                            </select>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>

        </div>
        <div class="col-12 d-flex justify-content-center">
            <div class="col-2 d-flex justify-content-center">
                <ul class="col-10 d-flex flex-column justify-content-start">
                    <li class="mb-4 p-3 btn btn-outline-primary ${module eq "all" ? '' : 'active' }"
                        onclick="changeLocation('/reservation')">Upcoming Appointment</li>
                    <li class="mb-4 p-3 btn btn-outline-primary ${module eq "all" ? 'active' : '' }"
                        onclick="changeLocation('/reservation?module=all')">All Appointment</li>
                </ul>
            </div>
            <table id="sortableTable" class="col-8 table table-hover">
                <thead class="thead-dark">
                    <tr>
                        <td>${specialty} </td>
                        <td>
                            <div id="statusDisplay_${count}">
                                <script>
                                    const statusDisplay_${count} = document.getElementById('statusDisplay_${count}');

                                    if (${item.getStatus()} == 1) {
                                        statusDisplay_${count}.innerHTML = '<div class="pending">Submit</div>';
                                    } else if (${item.getStatus()} == 2) {
                                        statusDisplay_${count}.innerHTML = '<div class="inactive">Cancel</div>';
                                    } else {
                                        statusDisplay_${count}.innerHTML = '<div class="active">Success</div>';
                                    }
                                </script>
                            </div>
                        </td>
                        <td>${item.getStartTime()} </td>
                        <td>${item.getEndTime()} </td>
                        <td>${item.getDay()} </td>
                        <td>${item.getDescription()} </td>
                <form action="reservation" method="POST" >
                    <input type="hidden" name="slotId" value="${item.getSlotId()}">
                    <input type="hidden" name="doctorId" value="${item.getDoctorId()}">
                    <td><input type="submit" value="Read more" ></td>
                </form>    
                <form action="changeStatus" method="POST" >
                    <td>
                        <select name="status" id="status">
                            <option value="3">Success</option>
                            <option value="2">Cancel</option>
                        </select>                    
                        <input type="hidden" name="slotId" value="${item.getSlotId()}">
                        <input type="hidden" name="doctorId" value="${item.getDoctorId()}">
                        <input type="submit" value="Change" >
                    </td>

                </form>   
            </tr>
        </c:forEach>
    </tbody>
</table>
<script>
    let ascending = true;

    function getStatusValue(status) {
        return parseInt(status) === 1 ? 'Active' : 'Inactive';
    }

    function sortTable(columnIndex) {
        const table = document.getElementById('sortableTable');
        const rows = Array.from(table.rows).slice(1); // Exclude header row

        rows.sort((rowA, rowB) => {
            let valueA, valueB;

            switch (columnIndex) {
                case 0: // ID column
                    valueA = parseInt(rowA.cells[columnIndex].textContent);
                    valueB = parseInt(rowB.cells[columnIndex].textContent);
                    break;

                case 2: // Status column
                    valueA = getStatusValue(rowA.cells[columnIndex].textContent);
                    valueB = getStatusValue(rowB.cells[columnIndex].textContent);
                    break;

                case 3: // Start time column
                case 4: // End time column
                    valueA = new Date(rowA.cells[columnIndex].textContent);
                    valueB = new Date(rowB.cells[columnIndex].textContent);
                    break;

                case 5: // Description column
                    valueA = rowA.cells[columnIndex].textContent;
                    valueB = rowB.cells[columnIndex].textContent;
                    break;

                default:
                    // Unsupported column index
                    return 0;

                        <th>Name of specialty</th>
                        <th onclick="sortTable(2)">Status</th>
                        <th onclick="sortTable(3)">Start time</th>
                        <th onclick="sortTable(4)">End time</th>
                        <th onclick="sortTable(6)">Day</th>
                        <th onclick="sortTable(7)">Description</th>
                        <th>Details</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="item" items="${slotDoc}">
                        <tr>
                            <td style="font-weight: bolder">${item.getServiceName()} </td>
                            <td>
                                <div id="statusDisplay_${item.getSlotId()}">
                                    <script>
                                        const statusDisplay_${ item.getSlotId()} = document.getElementById('statusDisplay_${item.getSlotId()}');
                                        const status_${ item.getSlotId()} = ${ item.getStatus() };  // Replace with your actual status value

                                        if (status_${ item.getSlotId() } === 1) {
                                            statusDisplay_${ item.getSlotId() }.innerHTML = '<div class="active btn btn-success">Success</div>';
                                        } else if (status_${ item.getSlotId() } === 2) {
                                            statusDisplay_${ item.getSlotId() }.innerHTML = '<div class="active btn btn-success">Success</div>';
                                        } else {
                                            statusDisplay_${ item.getSlotId() }.innerHTML = '<div class="inactive btn btn-danger">Cancel</div>';
                                        }
                                    </script>
                                </div>
                            </td>
                            </td>
                            <td>${item.getStartTime()} </td>
                            <td>${item.getEndTime()} </td>
                            <td>${item.getDay()} </td>
                            <td>${item.getDescription()} </td>
                    <form action="reservation" method="POST">
                        <input type="hidden" name="slotId" value="${item.getSlotId()}">
                        <input type="hidden" name="doctorId" value="${item.getDoctorId()}">
                        <td><button type="submit" class="btn btn-warning">Read More</button></td>
                    </form>
                    <form action="changeStatus" method="POST">
                        <input type="hidden" name="date" value="${date}">
                        <input type="hidden" name="module" value="${module}">
                        <input type="hidden" name="slotId" value="${item.getSlotId()}">
                        <input type="hidden" name="status" value="${item.getStatus()}">
                        <input type="hidden" name="doctorId" value="${item.getDoctorId()}">
                        <td><button type="submit" class="btn btn-primary">Change</button></td>
                    </form>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <script>

            function changeLocation(link) {
                console.log('click');
                window.location.href = link;
            }
            let ascending = true;

            function getStatusValue(status) {
                return parseInt(status) === 1 ? 'Active' : 'Inactive';
            }

            function sortTable(columnIndex) {
                const table = document.getElementById('sortableTable');
                const rows = Array.from(table.rows).slice(1); // Exclude header row

                rows.sort((rowA, rowB) => {
                    let valueA, valueB;

                    switch (columnIndex) {
                        case 0: // ID column
                            valueA = parseInt(rowA.cells[columnIndex].textContent);
                            valueB = parseInt(rowB.cells[columnIndex].textContent);
                            break;

                        case 2: // Status column
                            valueA = getStatusValue(rowA.cells[columnIndex].textContent);
                            valueB = getStatusValue(rowB.cells[columnIndex].textContent);
                            break;

                        case 3: // Start time column
                        case 4: // End time column
                            valueA = new Date(rowA.cells[columnIndex].textContent);
                            valueB = new Date(rowB.cells[columnIndex].textContent);
                            break;

                        case 5: // Description column
                            valueA = rowA.cells[columnIndex].textContent;
                            valueB = rowB.cells[columnIndex].textContent;
                            break;

                        default:
                            // Unsupported column index
                            return 0;
                    }

                    // Compare values based on the column type
                    if (valueA < valueB) {
                        return ascending ? -1 : 1;
                    } else if (valueA > valueB) {
                        return ascending ? 1 : -1;
                    } else {
                        return 0;
                    }
                });

                // Rearrange the rows based on the sorting
                for (const row of rows) {
                    table.tBodies[0].appendChild(row);
                }

                // Toggle sort order for the next click
                ascending = !ascending;
            }


            // Lấy tham chiếu đến dropdown
            const dateFilter = document.getElementById('dateFilter');

            // Gắn sự kiện onchange cho dropdown
            dateFilter.addEventListener('change', function (e) {

                // Lấy giá trị của tùy chọn đã chọn
                const selectedDate = dateFilter.value;
                console.log(selectedDate);
                // Chuyển hướng dựa trên giá trị đã chọn
                changeLocation(`/reservation?date=` + selectedDate)

            });

            function handleFilterDate() {
                const dateFilter1 = document.getElementById('dateFilter1').value;
                if (dateFilter1 == '') {
                    changeLocation(`/reservation?module=all`);
                } else {
                    changeLocation(`/reservation?module=all&date=` + dateFilter1);
                }
            }


        </script>

    </body>

    <jsp:include page="footer.jsp"></jsp:include>

</html>