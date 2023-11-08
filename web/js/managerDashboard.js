

let rawData = document.getElementById('bookingList').getAttribute('data-bookingList');
let bookings = JSON.parse(rawData);

function getWeekNumber(d) {
    d = new Date(Date.UTC(d.getFullYear(), d.getMonth(), d.getDate()));
    d.setUTCDate(d.getUTCDate() + 4 - (d.getUTCDay() || 7));
    const yearStart = new Date(Date.UTC(d.getUTCFullYear(), 0, 1));
    const weekNo = Math.ceil(((d - yearStart) / 86400000 + 1) / 7);
    return [d.getUTCFullYear(), weekNo];
}

function convertDateToDay(dateString) {
    const days = [
        "Sunday",
        "Monday",
        "Tuesday",
        "Wednesday",
        "Thursday",
        "Friday",
        "Saturday",
    ];
    const date = new Date(dateString);
    return days[date.getDay()];
}


let weeklyReservations = {};

for (let booking of bookings) {
    const day = convertDateToDay(booking.Day);
    const [year, week] = getWeekNumber(new Date(booking.Day));
    const weekKey = "Week " + week + " - " + year;

    if (!weeklyReservations[weekKey]) {
        weeklyReservations[weekKey] = {
            Monday: {count: 0, date: ""},
            Tuesday: {count: 0, date: ""},
            Wednesday: {count: 0, date: ""},
            Thursday: {count: 0, date: ""},
            Friday: {count: 0, date: ""},
            Saturday: {count: 0, date: ""},
            Sunday: {count: 0, date: ""},
        };
    }

    if (weeklyReservations[weekKey][day]) {
        weeklyReservations[weekKey][day].count++;
        weeklyReservations[weekKey][day].date = booking.Day;
    }
}


let weekSelector = document.getElementById('week-dropdown'); // Cập nhật ID này
for (let weekKey in weeklyReservations) {
    let option = document.createElement('option');
    option.value = weekKey;
    option.textContent = weekKey;
    weekSelector.appendChild(option);
}

let container = document.querySelector('.user-chart-container .chart-item:first-child div[style*="padding: 10px;"]');


const canvasElement = document.createElement('canvas');
canvasElement.id = 'myChart';
canvasElement.width = 400;
canvasElement.height = 400;
container.appendChild(canvasElement);
const ctx = canvasElement.getContext('2d');

let myChart;


function updateChart(weekKey) {
    // Kiểm tra xem weeklyReservations[weekKey] có tồn tại hay không
    if (!weeklyReservations[weekKey]) {
        console.error('Invalid week key:', weekKey);
        return;
    }

    const reservationData = {
        labels: Object.keys(weeklyReservations[weekKey]).map(day => day + ' (' + weeklyReservations[weekKey][day].date + ')'),
        datasets: [{
                label: 'Number of Reservations for ' + weekKey,
                data: Object.values(weeklyReservations[weekKey]).map(d => d.count),
                backgroundColor: 'rgba(75, 192, 192, 0.2)',
                borderColor: 'rgba(75, 192, 192, 1)',
                borderWidth: 1
            }]
    };

    if (myChart) {
        myChart.data = reservationData;
        myChart.update();
    } else {
        myChart = new Chart(ctx, {
            type: 'line',
            data: reservationData,
            options: {
                responsive: true,
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    }
}


// Update the chart when a different week is selected
weekSelector.addEventListener('change', function () {
    updateChart(this.value);
});

// Initial chart draw
updateChart(weekSelector.value);



console.log("Raw data:", rawData);
console.log("Parsed bookings:", bookings);
console.log("Weekly reservations:", weeklyReservations);
console.log(document.querySelectorAll('canvas')); // Kết quả này nên cho thấy một danh sách các phần tử canvas được thêm vào trang


let bookingData = JSON.parse(document.getElementById('bookingList').getAttribute('data-bookingList'));

let statusCounts = {
    1: 0,
    2: 0,
    3: 0
};

bookingData.forEach(booking => {
    if (statusCounts[booking.BookingStatus] !== undefined) {
        statusCounts[booking.BookingStatus]++;
    }
});

let ctx2 = document.getElementById('user-pie-chart').getContext('2d'); // Đổi 'statusPieChart' thành 'user-pie-chart'

let chart = new Chart(ctx2, {
    type: 'pie',
    data: {
        labels: ['Status 1', 'Status 2', 'Status 3'],
        datasets: [{
                data: [statusCounts[1], statusCounts[2], statusCounts[3]],
                backgroundColor: ['#FF9999', '#99FF99', '#9999FF']
            }]
    },
    options: {
        responsive: true,
        title: {
            display: true,
            text: 'Phân bố trạng thái'
        }
    }
});





//
//document.getElementById('btn-show-filter').addEventListener('click', (e) => {
//    e.preventDefault();
//    let popupItem = document.getElementsByClassName('popup')[0];
//    document.body.style.overflow = 'hidden';
//    document.getElementById('filter-container').style.display = 'flex';
//    popupItem.style.display = 'block';
//})
//;
//document.getElementById('addNewUser').addEventListener('click', (e) => {
//    e.preventDefault();
//    let popupItem = document.getElementsByClassName('popup')[0];
//    document.body.style.overflow = 'hidden';
//    document.getElementById('add-newuser-container').style.display = 'flex';
//    popupItem.style.display = 'block';
//});
//document.getElementById('cancel-btn').addEventListener('click', (e) => {
//    e.preventDefault();
//    let popupItem = document.getElementsByClassName('popup')[0];
//    document.body.style.overflow = 'hidden';
//    popupItem.style.display = 'none';
//});

document.getElementById('reservationManager').addEventListener('click', function () {
    const analyticContainer = document.querySelector('.analytic-container');
    const reservationManagerContainer = document.querySelector('.reservation-manager-container');

    if (analyticContainer) {
        analyticContainer.style.display = "none";
    }
    if (reservationManagerContainer) {
        reservationManagerContainer.style.display = "block";
    }
});

document.getElementById('analyticsMenu').addEventListener('click', function () {
    const analyticContainer = document.querySelector('.analytic-container');
    const reservationManagerContainer = document.querySelector('.reservation-manager-container');

    if (analyticContainer) {
        analyticContainer.style.display = "block";
    }
    if (reservationManagerContainer) {
        reservationManagerContainer.style.display = "none";
    }
});



function makeEditable(btn) {
    var row = btn.parentNode.parentNode;
    row.style.backgroundColor = "#FFD700";
    row.classList.add("edited");

    var editables = row.querySelectorAll('.editable');
    var hiddenInputs = row.querySelectorAll('.hidden-input');

    editables.forEach(function (editable, index) {
        editable.onclick = function () {
            var newValue = prompt("Edit value:", hiddenInputs[index].value);
            if (newValue !== null) {
                hiddenInputs[index].value = newValue;
                editable.textContent = newValue;
            }
        }
    });
}

//function makeEditable(btn) {
//    var row = btn.parentNode.parentNode;
//    var editables = row.querySelectorAll('.editable');
//    var hiddenInputs = row.querySelectorAll('.hidden-input');
//    var inputBoxes = row.querySelectorAll('.edit-input');
// row.style.backgroundColor = "#FFD700"; 
//    editables.forEach(function(editable, index) {
//        editable.style.display = 'none'; // Ẩn phần tử <span>
//        
//        var inputBox = inputBoxes[index];
//        if (!inputBox) {
//            inputBox = document.createElement('input');
//            inputBox.type = 'text';
//            inputBox.className = 'edit-input';
//            inputBox.onchange = function() {
//                hiddenInputs[index].value = inputBox.value;
//                editable.textContent = inputBox.value;
//            };
//            editable.parentNode.insertBefore(inputBox, editable.nextSibling);
//        }
//
//        inputBox.value = hiddenInputs[index].value;
//        inputBox.style.display = 'inline-block';
//    });
//}

document.getElementById("submitAllChanges").addEventListener("click", function () {
    var editedRows = document.querySelectorAll(".edited");
    var dataToSend = [];

    editedRows.forEach(function (row) {
        var data = {
            bookingId: row.querySelector('[name="bookingId"]').value,
            status: row.querySelector('[name="status"]').value,
            startTime: row.querySelector('[name="startTime"]').value,
            slotStatus: row.querySelector('[name="slotStatus"]').value,
            doctorName: row.querySelector('[name="doctorName"]').value,
            customerName: row.querySelector('[name="customerName"]').value,
            day: row.querySelector('[name="day"]').value,
        };
        dataToSend.push(data);
    });

    saveAllChangesToDatabase(dataToSend);
});


function saveAllChangesToDatabase(data) {
    fetch('/manageDashboard', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(data)
    })
            .then(response => response.json())
            .then(result => {
                console.log(result)
                if (result.success) {
                    alert('Update successful');
                    var editedRows = document.querySelectorAll(".edited");
                    editedRows.forEach(function (row) {
                        row.classList.remove("edited");
                        console.log("hihi");
                    });
                } else {
                    alert('Update failed: ' + result.message);
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('Update failed');
            });
}






