
    
    

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
let ctx = document.getElementById('reservationChart').getContext('2d');
let reservationData = {
    labels: ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'], // ví dụ cho mỗi ngày trong tuần
    datasets: [{
        label: 'Number of Reservations',
        data: [12, 19, 3, 5, 2, 3, 7], // dữ liệu mẫu
        backgroundColor: 'rgba(75, 192, 192, 0.2)',
        borderColor: 'rgba(75, 192, 192, 1)',
        borderWidth: 1
    },
    {
          label: 'Number of Customer',
        data: [1, 9, 3, 5, 2, 3, 7], // dữ liệu mẫu
        backgroundColor: 'rgba(255, 99, 132, 0.2)',
        borderColor: 'rgba(75, 192, 192, 1)',
        borderWidth: 1
        
    }
    ]
};

let chartOptions = {
    scales: {
        y: {
            beginAtZero: true
        }
    }
};

let reservationChart = new Chart(ctx, {
    type: 'circle',
    data: reservationData,
    options: chartOptions
});
