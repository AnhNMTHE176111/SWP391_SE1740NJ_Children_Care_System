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
            table {
                width: 100%;
                border-collapse: collapse;
            }
            th, td {
                border: 1px solid black;
                padding: 10px;
                text-align: left;
            }
            th {
                background-color: #f2f2f2;
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
        </style>
    </head>
    <jsp:include page="header.jsp"></jsp:include>
        <body>
            <h1 style="margin-left: 100px;padding: 40px;">List reservation  ${currentUser.getLastName()} ${currentUser.getFirstName()}</h1>

        <table id="sortableTable">
            <thead>
                <tr>
                    <th onclick="sortTable(0)">ID</th>
                    <th>Name of specialty</th>
                    <th onclick="sortTable(2)">Status</th>
                    <th onclick="sortTable(3)">Start time</th>
                    <th onclick="sortTable(4)">End time</th>
                    <th onclick="sortTable(5)">Description</th>
                    <th>Details</th>

                </tr>
            </thead>
            <tbody>
                <c:forEach var="item" items="${slotDoc}" >
                    <tr>
                        <td>${item.getSlotId()} </td>
                        <td>${specialty} </td>
                        <td>
                            <div id="statusDisplay_${item.getSlotId()}">
                                <script>
                                    const statusDisplay_${item.getSlotId()} = document.getElementById('statusDisplay_${item.getSlotId()}');
                                    const status_${item.getSlotId()} = ${item.getStatus()};  // Replace with your actual status value

                                    if (status_${item.getSlotId()} === 1) {
                                        statusDisplay_${item.getSlotId()}.innerHTML = '<div class="active">Active</div>';
                                    } else {
                                        statusDisplay_${item.getSlotId()}.innerHTML = '<div class="inactive">Inactive</div>';
                                    }
                                </script>
                            </div>
                        </td>


                        </td>
                        <td>${item.getStartTime()} </td>
                        <td>${item.getEndTime()} </td>
                        <td>${item.getDescription()} </td>
                <form name="reservation" method="POST">
                    <input type="hidden" name="slotId" value="${item.getSlotId()}">
                    <input type="hidden" name="doctorId" value="${item.getDoctorId()}">
                    <td><input type="submit" value="Read more"></td>
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
 



//    let ascending = true;
//
//    function sortTable(columnIndex) {
//        const table = document.getElementById('sortableTable');
//        const rows = Array.from(table.rows).slice(1); // Exclude header row
//
//        rows.sort((rowA, rowB) => {
//            const cellA = rowA.cells[columnIndex].textContent;
//            const cellB = rowB.cells[columnIndex].textContent;
//
//            // Parse dates in "YYYY-MM-DD HH:MM:SS" format and compare
//            const dateA = new Date(cellA);
//            const dateB = new Date(cellB);
//
//            return ascending ? dateA - dateB : dateB - dateA;
//        });
//
//        // Rearrange the rows based on the sorting
//        for (const row of rows) {
//            table.tBodies[0].appendChild(row);
//        }
//
//        // Toggle sort order for the next click
//        ascending = !ascending;
//    }
</script>

</body>

<jsp:include page="footer.jsp"></jsp:include>
</html>