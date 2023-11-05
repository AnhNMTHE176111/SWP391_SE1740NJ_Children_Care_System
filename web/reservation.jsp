<%-- 
    Document   : reservation
    Created on : Oct 7, 2023, 6:16:35 PM
    Author     : Admin
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            <h1 style="margin-left: 100px;padding: 40px;">List reservation  ${currentUser.getLastName()} ${currentUser.getFirstName()}</h1>

        <table id="sortableTable" >
            <thead>
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
                <c:forEach var="item" items="${slotDoc}" varStatus="loop">
                    <c:set var="count" value="${loop.index + 1}" />
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