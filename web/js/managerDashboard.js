

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
    const doctorManageContainer = document.querySelector('.doctor-manager-container');
    if (analyticContainer) {
        analyticContainer.style.display = "none";

    }
    if (doctorManageContainer) {
        doctorManageContainer.style.display = "none";
    }
    if (reservationManagerContainer) {
        reservationManagerContainer.style.display = "block";
    }
});

document.getElementById('analyticsMenu').addEventListener('click', function () {
    const analyticContainer = document.querySelector('.analytic-container');
    const reservationManagerContainer = document.querySelector('.reservation-manager-container');
    const doctorManageContainer = document.querySelector('.doctor-manager-container');

    if (reservationManagerContainer) {
        reservationManagerContainer.style.display = "none";
    }
    if (doctorManageContainer) {
        doctorManageContainer.style.display = "none";
    }
    if (analyticContainer) {
        analyticContainer.style.display = "block";



    }


});

document.getElementById('doctorManager').addEventListener('click', function () {
    const analyticContainer = document.querySelector('.analytic-container');
    const reservationManagerContainer = document.querySelector('.reservation-manager-container');
    const doctorManageContainer = document.querySelector('.doctor-manager-container');

    if (reservationManagerContainer) {
        reservationManagerContainer.style.display = "none";
    }

    if (analyticContainer) {
        analyticContainer.style.display = "none";

    }
    if (doctorManageContainer) {
        doctorManageContainer.style.display = "block";
    }


});


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

//function makeEditable(btn) {
//    var row = btn.closest('tr');
//    row.style.backgroundColor = "#FFD700";
//    row.classList.add("edited");
//
//    var editables = row.querySelectorAll('.editable');
//    var hiddenInputs = row.querySelectorAll('.hidden-input');
//
//    editables.forEach(function (editable, index) {
//        editable.onclick = function () {
//            var newValue = prompt("Edit value:", hiddenInputs[index].value);
//            if (newValue !== null) {
//                hiddenInputs[index].value = newValue;
//                editable.textContent = newValue;
//            }
//        }
//    });
//}

const bookedSlotsElement = document.getElementById('bookedSlotsData');
const bookedSlotsData = JSON.parse(bookedSlotsElement.getAttribute('data-booked-slots'));

const slotIdList = document.getElementById('slotList');
const slotList = JSON.parse(slotIdList.getAttribute('data-slotList'));


console.log(bookedSlotsData)
function getSlotIdFromStartTime(startTimeValue) {
    for (let slot of slotList) {
        if (slot.StartTime === startTimeValue) {
            return slot.SlotId;
        }
    }
    console.log("Không tìm thấy ID tương ứng với startTime:", startTimeValue);
    return null;
}

function isSlotBooked(doctorId, slotId, day) {
    return bookedSlotsData.some((slot, index) => {
        const slotDoctorId = String(slot.DoctorId).trim();
        const slotSlotId = String(slot.SlotId).trim();
        const slotDay = new Date(slot.Day.trim()).toDateString();

        const inputDoctorId = String(doctorId).trim();
        const inputSlotId = String(slotId).trim();
        const inputDay = new Date(day.trim()).toDateString();

        if (slotDoctorId === inputDoctorId && slotSlotId === inputSlotId && slotDay === inputDay) {
            console.log(`Exact match found at index: ${index}`);
            console.log(`Slot details - DoctorId: ${slotDoctorId}, SlotId: ${slotSlotId}, Day: ${slotDay}`);
            console.log(`Input details - DoctorId: ${inputDoctorId}, SlotId: ${inputSlotId}, Day: ${inputDay}`);
            return true;
        }
        return false;
    });
}







//function isSlotBooked(doctorId, slotId, day) {
//    return bookedSlotsData.some(slot => {
//        // Ghi log ra một cách rõ ràng hơn
//        console.log(`Checking for DoctorId: ${slot.DoctorId}, SlotId: ${slot.SlotId}, Day: ${slot.Day}`);
//       if ${slot.DoctorId} === doctorId &&
//                ${slot.SlotId} === slotId &&
//               ${slot.Day} === day;
//       return true
//    });
//}

//function makeEditable(btn) {
//    const row = btn.closest('tr');
//    row.style.backgroundColor = "#FFD700";
//    row.classList.add("edited");
//
//    const editables = row.querySelectorAll('.editable');
//    const hiddenInputs = row.querySelectorAll('.hidden-input');
//
//    editables.forEach(function (editable, index) {
//        editable.onclick = function () {
//            let newValue = prompt("Edit value:", hiddenInputs[index].value);
//            if (newValue !== null) {
//                if (editable.getAttribute('name') === 'startTime') {
//                    // Ensure the time is in hh:00 format and between 08:00 and 16:00
//                    const timeRegex = /^([0-1][0-9]|2[0-3]):00$/;
//                    const hour = newValue.substring(0, 2);
//                    if (timeRegex.test(newValue) && hour >= '08' && hour <= '16') {
//                        const doctorId = row.querySelector('input[name="doctorId"]').value;
//                        const day = row.querySelector('input[name="day"]').value;
//                        const correspondingSlotId = getSlotIdFromStartTime(newValue);
//
//                        if (isSlotBooked(doctorId, correspondingSlotId, day)) {
//                            alert('This slot has already been booked by another doctor! Please select another one.');
//                        } else {
//                            hiddenInputs[index].value = newValue;
//                            editable.textContent = newValue;
//                            row.querySelector('input[name="slotid"]').value = correspondingSlotId;
//                        }
//                    } else {
//                        alert("Time must be in hh:00 format and between 08:00 and 16:00.");
//                    }
//                } else if (editable.getAttribute('name') === 'day') {
//                    // Ensure the date is in dd/mm/yyyy format
//                   const dateRegex = /^([0-9]{2})-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])$/;
//
//                    if (dateRegex.test(newValue)) {
//                        hiddenInputs[index].value = newValue;
//                        editable.textContent = newValue;
//                    } else {
//                        alert("Date must be in dd/mm/yyyy format.");
//                    }
//                } else {
//                    hiddenInputs[index].value = newValue;
//                    editable.textContent = newValue;
//                }
//            }
//        }
//    });

function makeEditable(btn) {
    const row = btn.closest('tr');
    row.style.backgroundColor = "#FFD700";
    row.classList.add("edited");

    const editables = row.querySelectorAll('.editable');
    const hiddenInputs = row.querySelectorAll('.hidden-input');

    editables.forEach(function (editable, index) {
        // Check if the editable onclick event has already been attached
        if (editable.getAttribute('data-editable-event-attached') === 'true') {
            return; // Skip this iteration since the event is already attached
        }

        const oldValue = hiddenInputs[index].value; // Store the old value

        editable.onclick = function () {
            let newValue = prompt("Edit value:", oldValue); // Use oldValue here
            if (newValue !== null) {
                if (editable.getAttribute('name') === 'startTime') {
                    const timeRegex = /^([0-1][0-9]|2[0-3]):00$/;
                    const hour = newValue.substring(0, 2);
                    if (timeRegex.test(newValue) && hour >= '08' && hour <= '16') {
                        const doctorId = row.querySelector('input[name="doctorId"]').value;
                        const day = row.querySelector('input[name="day"]').value;
                        const correspondingSlotId = getSlotIdFromStartTime(newValue);
                    } else {
                        alert("Time must be in hh:00 format and between 08:00 and 16:00.");
                        revertInput(hiddenInputs[index], editable, oldValue); // Revert if invalid
                    }
                } else if (editable.getAttribute('name') === 'day') {
                    const dateRegex = /^([0-9]{2})-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])$/;
                    if (dateRegex.test(newValue)) {
                        hiddenInputs[index].value = newValue;
                        editable.textContent = newValue;
                    } else {
                        alert("Date must be in yy-mm-dd format.");
                        revertInput(hiddenInputs[index], editable, oldValue); // Revert if invalid
                    }
                } else {
                    hiddenInputs[index].value = newValue;
                    editable.textContent = newValue;
                }
            } else {

                revertInput(hiddenInputs[index], editable, oldValue);
            }
        }


        editable.setAttribute('data-editable-event-attached', 'true');
    });
}

function revertInput(hiddenInput, editable, oldValue) {
    // Function to revert the input to its original value
    hiddenInput.value = oldValue;
    editable.textContent = oldValue;
}



document.getElementById("submitAllChanges").addEventListener("click", function () {
    const tableRows = document.querySelectorAll(".edited");
    const dataToSend = [];

    let hasInvalidData = false;

    tableRows.forEach(function (row) {
        const doctorId = row.querySelector('input[name="doctorId"]').value;
        const day = row.querySelector('input[name="day"]').value;
        const startTimeValue = row.querySelector('input[name="startTime"]').value;

        const correspondingSlotId = getSlotIdFromStartTime(startTimeValue);
        console.log(doctorId)
        console.log(correspondingSlotId)
        console.log(day)

        if (isSlotBooked(doctorId, correspondingSlotId, day)) {
            alert('This slot has already been booked by another doctor for the entry with startTime: ' + startTimeValue + '. Please select another one.');
            hasInvalidData = true;
            return;
        }

        const data = {
            dataType: 'bookingUpdate',
            bookingId: row.querySelector('input[name="bookingId"]').value,
            status: row.querySelector('input[name="status"]').value,
            slotId: correspondingSlotId,
            slotStatus: row.querySelector('input[name="slotStatus"]').value,
            doctorName: row.querySelector('input[name="doctorName"]').value,
            customerName: row.querySelector('input[name="customerName"]').value,
            day: day,
        };
        dataToSend.push(data);
    });

    if (!hasInvalidData) {
        saveAllChangesToDatabase(dataToSend);
    }
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
                if (result.success) {

                    alert('Update successful');
                    document.querySelectorAll(".edited").forEach(row => {
                        row.classList.remove("edited");
                        ;

                    });
                                            document.querySelector('.doctor-manager-container').classList.remove('blur-background');

                } else {
                    alert('Update failed: ' + result.message);
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('Update failed');
            });
}




function searchByUserName() {
    let input = document.getElementById('searchInputUser');
    let filter = input.value.toUpperCase();
    let table = document.querySelector('.user-list-container table');
    let tr = table.getElementsByTagName('tr');

    for (let i = 1; i < tr.length; i++) {
        let td = tr[i].getElementsByTagName('td')[6]; // 5 là cột "Customer Name"
        if (td) {
            let txtValue = td.textContent || td.innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                tr[i].style.display = "";
            } else {
                tr[i].style.display = "none";
            }
        }
    }
}

function searchByDoctorName() {
    let input = document.getElementById('searchInputDoctor');
    let filter = input.value.toUpperCase();
    let table = document.querySelector('.user-list-container table');
    let tr = table.getElementsByTagName('tr');

    for (let i = 1; i < tr.length; i++) {
        let td = tr[i].getElementsByTagName('td')[5]; // 5 là cột "Customer Name"
        if (td) {
            let txtValue = td.textContent || td.innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                tr[i].style.display = "";
            } else {
                tr[i].style.display = "none";
            }
        }
    }
}


selectedDoctorId = null;

function changeSlot(doctorId) {

    console.log("123");
    selectedDoctorId = doctorId;
    var updateForm = document.getElementById("updateForm");
    updateForm.style.display = "block";
    console.log("456");
    document.querySelector('.doctor-manager-container').classList.add('blur-background');

}



function onSlotSelect(button) {
    const slotId = button.getAttribute("data-slot-id");
    const startTime = button.textContent;
    const updateForm = button.closest('#updateForm'); // Lấy form gần nhất chứa nút được nhấn
    const selectedDate = updateForm.querySelector("#updateDate").value; // Truy xuất giá trị ngày đã chọn
    const description = updateForm.querySelector("#updateDescription").value; // Truy xuất giá trị mô tả

    const slotIndex = selectedSlots.findIndex(slot => slot.slotId === slotId);
    if (slotIndex !== -1) {
        button.classList.remove("selected-slot"); // Loại bỏ lớp khi bỏ chọn
        selectedSlots.splice(slotIndex, 1);
    } else {
        button.classList.add("selected-slot"); // Thêm lớp khi chọn
        selectedSlots.push({slotId, startTime, selectedDate, description});
    }
}


let selectedSlots = [];

function updateDoctorSlot() {
    const updateForm = document.getElementById("updateForm");
    updateForm.style.display = "none"; // Hide the form

    if (selectedSlots.length > 0) {
        const dataToSend = selectedSlots.map(slot => ({// Map over selectedSlots to create the data structure
                dataType: 'selectOffSlot',
                doctorId: selectedDoctorId,
                slotId: slot.slotId,
                slotStatus: 1,
                selectedDate: slot.selectedDate,
                description: slot.description
            }));

        console.log("Data to send:", dataToSend);
        saveAllChangesToDatabase(dataToSend);
    } else {
        console.log("No slots selected.");
    }
}


document.getElementById('addDoctor').addEventListener('click', function () {
    var overlay = document.createElement('div');

    document.querySelector('.doctor-manager-container').classList.add('blur-background');
    document.getElementById('newDoctorModal').style.display = 'block';
});

document.getElementById('closeModal').addEventListener('click', function () {
    document.getElementById('newDoctorModal').style.display = 'none';
    document.querySelector('.doctor-manager-container').classList.remove('blur-background');
    ;

});

document.getElementById('closeSlotSelect').addEventListener('click', function () {
    document.getElementById('updateForm').style.display = 'none';
    document.querySelector('.doctor-manager-container').classList.remove('blur-background');
    ;

});



document.getElementById('addDoctorForm').onsubmit = function (event) {
    event.preventDefault(); // Ngăn chặn hành vi mặc định của form submission

    const form = event.target;
    const fileInput = form.doctorAvatar.files[0];

    const reader = new FileReader();
    reader.onloadend = function () {
        const newDoctorData = {
            dataType: 'addNewDoctor',
            name: form.doctorName.value.trim(),
            gender: form.doctorGender.value,
            dateOfBirth: form.doctorDob.value,
            specializationId: parseInt(form.doctorSpecialization.value, 10),
            serviceId: parseInt(form.doctorService.value, 10),
            phoneNumber: form.doctorPhone.value.trim(),
            email: form.doctorEmail.value.trim(),
            password: form.doctorPassword.value,
            position: form.doctorPosition.value.trim(),
            address: form.doctorAddress.value.trim(),
            description: form.doctorDescription.value,
            yearsOfExperience: parseInt(form.doctorExperience.value, 10),
            avatar: reader.result
        };

        if (!newDoctorData.specializationId || !newDoctorData.serviceId) {
            alert('Please select both a specialization and a service.');
            return;
        }

        console.log(newDoctorData);

        saveAllChangesToDatabase([newDoctorData]);
    };

    if (fileInput) {
        reader.readAsDataURL(fileInput);
    } else {
        alert('Please select an avatar image.');
    }
};

function updateServicesDropdown(specialtyId) {
    const serviceListElement = document.getElementById('serviceList');
    const serviceListJSON = serviceListElement.getAttribute('data-serviceList');
    const services = JSON.parse(serviceListJSON);
    const serviceSelect = document.getElementById('doctorService');
    console.log(services);
    serviceSelect.length = 0;

    services.forEach(function (service) {
        if (service.SpecialtyId === specialtyId) {
            const option = document.createElement('option');
            option.value = service.ServiceId;
            option.textContent = service.ServiceName;
            serviceSelect.appendChild(option);
        }
    });

    var event = new Event('change');
    serviceSelect.dispatchEvent(event);
}

document.getElementById('doctorSpecialization').addEventListener('change', function () {
    console.log("let select service")
    updateServicesDropdown(this.value);
});

document.addEventListener('DOMContentLoaded', function () {
    var specialtySelect = document.getElementById('doctorSpecialization');
    if (specialtySelect.selectedIndex !== -1) { // Check if there are any options
        updateServicesDropdown(specialtySelect.value);
    }
});






















