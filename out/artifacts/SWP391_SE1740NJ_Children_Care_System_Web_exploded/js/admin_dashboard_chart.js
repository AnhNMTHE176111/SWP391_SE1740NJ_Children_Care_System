/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/javascript.js to edit this template
 */
const ctx = document.getElementById('user-line-chart');
const dataUser = JSON.parse(document.getElementById('data-user').getAttribute('data-user'));
console.log('dataUser', dataUser);

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

const dropdown = document.querySelector('#week-dropdown');
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
dropdown.addEventListener('change', (e) => {
    const selectedWeek = e.target.value;
    const labels = labels.filter(week => week.startsWith(selectedWeek));
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
});

new Chart(document.getElementById('user-pie-chart'), {
    type: 'pie',
    data: {
        labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
        datasets: [{
                label: '# of Votes',
                data: [12, 19, 3, 5, 2, 3],
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

