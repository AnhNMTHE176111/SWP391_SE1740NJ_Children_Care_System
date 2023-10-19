
const ctx = document.getElementById('user-line-chart');
const dataUser = JSON.parse(document.getElementById('data-user').getAttribute('data-user'));
let weekInput = document.getElementById('week-dropdown');
console.log('dataUser', dataUser);

// when page loads, this is the first data show
overViewDataChart();

// when input changes
weekInput.addEventListener('change', (e) => {

    const existingChart = Chart.getChart('user-line-chart');

    // Destroy the existing chart, if it's found
    if (existingChart) {
        existingChart.destroy();
    }

    const weekValue = e.target.value; // Get the week input value (e.g., "2023-W45")
    if (weekValue === '') {
        overViewDataChart()
    }
    else {
        // Split the input value into year and week number
        const [year, weekNumber] = weekValue.split('-W');

        // Calculate the start and end dates of the week
        const startOfWeek = new Date(year); // January 1st of the selected year
        startOfWeek.setDate(startOfWeek.getDate() + (weekNumber - 1) * 7 + 1); // Adjust to the first day of the selected week

        const endOfWeek = new Date(startOfWeek);
        endOfWeek.setDate(endOfWeek.getDate() + 6); // Adjust to the last day of the week

        console.log('startOfWeek', startOfWeek);
        console.log('endOfWeek', endOfWeek);

        // Tạo mảng labels và data
        const labels = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
        const data = [0, 0, 0, 0, 0, 0, 0]; // Khởi tạo mảng dữ liệu với giá trị ban đầu là 0 cho mỗi ngày trong tuần

        dataUser.filter((user) => {
            const createdAt = new Date(user.createdAt);
            if (createdAt < endOfWeek && createdAt > startOfWeek) {
                return user;
            }
        }).forEach((user) => {
            const createdAt = new Date(user.createdAt);
            const dayOfWeek = createdAt.getDay(); // Lấy thứ trong tuần (0 = Sunday, 1 = Monday, ..., 6 = Saturday)
            data[dayOfWeek]++; // Tăng giá trị cho ngày tương ứng
        });

        new Chart(ctx, {
            type: 'line',
            data: {
                labels: labels,
                datasets: [{
                    label: '# of Users Created',
                    data: data,
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    }
})

new Chart(document.getElementById('user-pie-chart'), {
    type: 'pie',
    data: {
        labels: ['Dịch vụ phẫu thuật cơ xương khớp', 'Dịch vụ x-ray', 'Dịch vụ dinh dưỡng tư vấn', 'Dịch vụ chẩn đoán dinh dưỡng', 'Dịch vụ kiểm tra răng', 'Dịch vụ phục hình răng'],
        datasets: [{
            label: '# of Votes',
            data: [93250000 + 93250000, 397000 + 397000, 200000 + 200000, 450000 + 450000, 100000, 22500000],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
});

function overViewDataChart() {
    const userCountByDate = {};

    dataUser.forEach(user => {
        const date = user.createdAt;
        const week = date.slice(0, 10);
        if (!userCountByDate[week]) {
            userCountByDate[week] = 0;
        }
        userCountByDate[week]++;
    });

    const labels = Object.keys(userCountByDate).sort();
    const data = labels.map(week => userCountByDate[week]);

    new Chart(ctx, {
        type: 'line',
        data: {
            labels: labels,
            datasets: [{
                label: '# of Users Created',
                data: data,
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
}

// dropdown.addEventListener('change', (e) => {
//     const selectedWeek = e.target.value;
//     const labels = labels.filter(week => week.startsWith(selectedWeek));
//     const data = labels.map(week => userCountByDate[week]);

//     new Chart(ctx, {
//         type: 'line',
//         data: {
//             labels: labels,
//             datasets: [{
//                     label: '# of Users Created',
//                     data: data,
//                     borderWidth: 1
//                 }]
//         },
//         options: {
//             scales: {
//                 y: {
//                     beginAtZero: true
//                 }
//             }
//         }
//     });
// });
