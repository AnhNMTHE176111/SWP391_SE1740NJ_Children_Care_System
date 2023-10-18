
    
    

//let ctx = document.getElementById('reservationChart');
//ctx.shadowColor = 'rgba(0,0,0,0,3)';
//ctx.shadowBlUR = 10;
//ctx.shadowOffsetX = 4;
//ctx.shadowOffsetY = 4;
//
//var chart = new Chart(ctx,{
//    type: 'bar',
//    data:{
//         labels: ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'],
//          datasets: [{
//        label: 
//        ["Number of Reservations", "Customer "],
//        data: [12, 19, 3, 5, 2, 3, 7], // dữ liệu mẫu
//        backgroundColor: 'rgba(75, 192, 192, 0.2)',
//        borderColor: 'rgba(75, 192, 192, 1)',
//        borderWidth: 3,
//        fill: true
//    }]
//    },
//    option: {
//        responsive: true,
//        scales:{
//            y: {
//                beginAtZero: true,
//                max: 100
//            }
//        }
//    }
//    
//    
//});
//    
//});
//let ctx = document.getElementById('reservationChart').getContext('2d');
//let reservationData = {
//    labels: ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'],
//    datasets: [{
//        label: 'Number of Reservations',
//        data: [12, 19, 3, 5, 2, 3, 7], // dữ liệu mẫu
//        backgroundColor: 'rgba(75, 192, 192, 0.2)',
//        borderColor: 'rgba(75, 192, 192, 1)',
//        borderWidth: 1
//    },
//    {
//          label: 'Number of Customer',
//        data: [1, 9, 3, 5, 2, 3, 7], // dữ liệu mẫu
//        backgroundColor: 'rgba(255, 99, 132, 0.2)',
//        borderColor: 'rgba(75, 192, 192, 1)',
//        borderWidth: 1
//        
//    }
//    ]
//};
//
//let chartOptions = {
//    scales: {
//        y: {
//            beginAtZero: true
//        }
//    }
//};
//
//let reservationChart = new Chart(ctx, {
//    type: 'line',
//    data: reservationData,
//    options: chartOptions
//});

//let ctx = document.getElementById('reservationChart').getContext('2d');
//
//
//let reservationData = {
//   labels: ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'],
//    datasets: [{
//        data: [12, 19, 3, 5, 2, 3, 7], 
//        backgroundColor: [
//            'rgba(255, 99, 132, 0.6)',
//            'rgba(75, 192, 192, 0.6)',
//            'rgba(255, 206, 86, 0.6)',
//            'rgba(54, 162, 235, 0.6)',
//            'rgba(153, 102, 255, 0.6)',
//           'rgba(255, 159, 64, 0.6)',
//            'rgba(131, 90, 241, 0.6)'
//       ]
//   }]
//};
//
//let chartOptions = {
//    responsive: false,
//maintainAspectRatio: false};
//
//
//let reservationChart = new Chart(ctx, {
//    type: 'doughnut', // Biểu đồ hình tròn
//   data: reservationData,
//    options: chartOptions
//});

//let ctx = document.getElementById('reservationChart').getContext('2d');
//
//let reservationData = {
//    labels: ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'],
//    datasets: [{
//        label: 'Number of Bookings',
//        data: [10, 15, 20, 5, 12, 7, 8], // Dữ liệu cứng cho số lượng Booking theo ngày
//        backgroundColor: 'rgba(131, 90, 241, 0.3)', // Màu nền dưới đường biểu đồ
//        borderColor: 'rgba(131, 90, 241, 0.7)',     // Màu đường biểu đồ
//        borderWidth: 2,   // Độ dày của đường biểu đồ
//        fill: true        // Điều này sẽ tạo ra một khu vực màu nền dưới đường biểu đồ
//    }]
//};
//
//let chartOptions = {
//    responsive: false,
//    maintainAspectRatio: false,
//    scales: {
//        yAxes: [{
//            ticks: {
//                beginAtZero: true   // Bắt đầu trục y từ 0
//            }
//        }]
//    }
//};
//1
//let reservationChart = new Chart(ctx, {
//    type: 'line',
//    data: reservationData,
//    options: chartOptions
//});

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
      Monday: { count: 0, date: "" },
      Tuesday: { count: 0, date: "" },
      Wednesday: { count: 0, date: "" },
      Thursday: { count: 0, date: "" },
      Friday: { count: 0, date: "" },
      Saturday: { count: 0, date: "" },
      Sunday: { count: 0, date: "" },
    };
  }

  if (weeklyReservations[weekKey][day]) {
    weeklyReservations[weekKey][day].count++;
    weeklyReservations[weekKey][day].date = booking.Day;
  }
}

// Create dropdown options for weeks
let weekSelector = document.getElementById('weekSelector');
for (let weekKey in weeklyReservations) {
    let option = document.createElement('option');
    option.value = weekKey;
    option.textContent = weekKey;
    weekSelector.appendChild(option);
}

let container = document.getElementById('chartsContainer');

// Create a single canvas for the chart
const canvasElement = document.createElement('canvas');
canvasElement.id = 'myChart';
canvasElement.width = 400;
canvasElement.height = 400;
container.appendChild(canvasElement);
const ctx = canvasElement.getContext('2d');
let myChart;

// Function to update the chart
function updateChart(weekKey) {
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
weekSelector.addEventListener('change', function() {
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

let ctx2 = document.getElementById('statusPieChart').getContext('2d');

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

document.getElementById('reservationManager').addEventListener('click', function() {
    const reservationsContainer = document.getElementById('reservationsContainer');
    const chartContainer = document.getElementById('container');

    reservationsContainer.style.display = "block";
    chartContainer.style.display = "none";
});

document.getElementById('analyticsMenu').addEventListener('click', function() {
    const reservationsContainer = document.getElementById('reservationsContainer');
    const chartContainer = document.getElementById('container');

    reservationsContainer.style.display = "none";
    chartContainer.style.display = "block";
});

function makeEditable(btn) {
    var row = btn.parentNode.parentNode;
    row.style.backgroundColor = "#FFD700"; 

    var editables = row.querySelectorAll('.editable');
    var hiddenInputs = row.querySelectorAll('.hidden-input');

    editables.forEach(function(editable, index) {
        editable.onclick = function() {
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






