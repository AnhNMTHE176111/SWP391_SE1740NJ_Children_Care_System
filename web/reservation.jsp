<%-- Document : reservation Created on : Oct 7, 2023, 6:16:35 PM Author : Admin --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
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
        </style>
    </head>
    <jsp:include page="header.jsp"></jsp:include>

        <body>

            <h1 style="margin-left: 100px;padding: 40px;">List Reservation </h1>
            <div class="col-12 d-flex justify-content-center">
                <div class="col-2">

                </div>
                <div class="col-8 d-flex justify-content-between">
                    <h3>Upcoming Appointment</h3>
                    <div class="col-2 form-group">
                        <select name="dateFilter" id="" class="form-control">
                            <option value="all">All</option>
                            <option value="today">Today</option>
                            <option value="tommorow">Tommorow</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="col-12 d-flex justify-content-center">
                <div class="col-2 d-flex justify-content-center">
                    <ul class="col-10 d-flex flex-column justify-content-start">
                        <li class=${"mb-4 p-3 btn btn-outline-primary " + (module eq "upcoming" ? "active" : "" )} onclick="changeLocation('/reservation?module=upcoming')">Upcoming Appointment</li>
                        <li class=${"mb-4 p-3 btn btn-outline-primary " + (module eq "all" ? "active" : "" )} onclick="changeLocation('/reservation?module=all')">All Appointment</li>
                    </ul>
                </div>
                <table id="sortableTable" class="col-8 table table-hover">
                    <thead class="thead-dark">
                        <tr>
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
                            <td>${item.getServiceName()} </td>
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




        </script>

    </body>

    <jsp:include page="footer.jsp"></jsp:include>

</html>