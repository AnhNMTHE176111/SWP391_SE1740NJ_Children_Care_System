
let currentStep = 1;
//////////////////////////////////////////////////////
//////////////////////////////////////////////////////////
/////////////////////////////////////////////////
// DI CHUYEN CAC TRANG
let message = "";
let selectedDateValue = "";
let selectedSlotValue = "";
let changeInformation = true;


const step1 = document.getElementById("step1");
const step2 = document.getElementById("step2");
const step3 = document.getElementById("step3");
function hideAllSteps() {
    step1.style.display = "none";
    step2.style.display = "none";
    step3.style.display = "none";
}


function showStep(step) {
    hideAllSteps();
    if (step === 1) {
        step1.style.display = "block";
    } else if (step === 2) {
        step2.style.display = "block";
    } else if (step === 3) {
        step3.style.display = "block";
    }
    currentStep = step;
}


document.querySelector(".submit-button").addEventListener("click", function () {
    let isError = checkEmptyInputs();

    if (currentStep === 1) {
        if (!isError) {
            showStep(2);
            step1.style.display = "none";
        }
    } else if (currentStep === 2) {
        showStep(3);
    }
});



document.querySelector(".back-button").addEventListener("click", function () {
    if (currentStep === 2) {
        showStep(1);
    } else if (currentStep === 3) {
        showStep(2);
    }
})

let dates = document.querySelectorAll('.date-slot');
dates.forEach(function (date) {
    date.addEventListener('click', function () {
        selectedDateValue = this.textContent || this.innerText;
    });
});

let slots = document.querySelectorAll('.grid-date');
slots.forEach(function (slot) {
    slot.addEventListener('click', function () {
        selectedSlotValue = this.textContent || this.innerText;
    });
});

document.addEventListener("DOMContentLoaded", function () {
    // Gọi hàm checkEmptyInputs tại đây
    checkEmptyInputs();
});

function checkEmptyInputs() {
    let specialty = document.getElementById("selectedSpecialty").value;
    let doctor = document.getElementById("selectedDoctor").value;
    let isError = false;

    // Kiểm tra chuyên khoa
    if (specialty === "0") {
//        document.getElementById("specialtyError").textContent = 'Vui lòng chọn chuyên khoa';
//        document.getElementById("specialtyError").style.display = "block";
        isError = true;
    } else {
//        document.getElementById("specialtyError").style.display = "none";
    }

    // Kiểm tra bác sĩ
    if (doctor === "0") {
//        document.getElementById("doctorError").textContent = 'Vui lòng chọn bác sĩ';
//        document.getElementById("doctorError").style.display = "block";
        console.log("jiji");
        isError = true;
    } else {
//        document.getElementById("doctorError").style.display = "none";
    }


    if (!selectedDateValue) {
        isError = true;
    }
    if (!selectedSlotValue) {
        isError = true;
    }




    return isError;
}

//////////////////////////////////////////////////////
//////////////////////////////////////////////////////////
/////////////////////////////////////////////////
// CHON NGAY
let slotSelected = false;
let selectedSlot = null;
let selectedDateSlot = null;

const daysList = document.querySelectorAll(".date-slot[name='date']");
const slotList = document.querySelectorAll(".grid-date[name='slot']");
const dateSelect = document.querySelector(".date-hidden");




daysList.forEach(function (el) {
    let display = true;
    el.addEventListener("click", function () {
        if (slotSelected) {
            return;
        }
        if (display) {
            console.log("hihi");
            dateSelect.style.display = "block";
            display = !display;
            updateSlotsBasedOnDoctorAndDate();
        } else {
            dateSelect.style.display = "none";
            display = !display;
        }
    });
});

slotList.forEach(function (slot) {
    slot.addEventListener("click", function () {
        if (slotSelected) {
            slot.classList.remove("selected");
            slotSelected = false;

            if (selectedDateSlot) {
                selectedDateSlot.classList.remove("selected");
            }
            daysList.forEach(date => date.classList.remove('no-click'));

            selectedSlot = null;
            selectedDateSlot = null;
            selectedSlotValue = null;

            return;
        }

        slotList.forEach(function (otherSlot) {
            otherSlot.classList.remove("selected");
        });

        slot.classList.add("selected");
        selectedSlot = slot;
        const selectedDate = slot.getAttribute("data-date");
        selectedDateSlot = document.querySelector(`.date-slot[name='date'][data-date='${selectedDate}']`);

        daysList.forEach(function (date) {
            date.classList.remove("selected");
        });

        if (selectedDateSlot) {
            selectedDateSlot.classList.add("selected");
        }

        slotSelected = true;
        daysList.forEach(date => date.classList.add('no-click'));
    });
});


document.addEventListener('DOMContentLoaded', function () {
    const dateSlotsContainer = document.querySelector('.date-slots');

    dateSlotsContainer.addEventListener('click', function (e) {
        if (e.target.classList.contains('date-slot')) {
            const clickedDateSlot = e.target;
            const allDateSlots = dateSlotsContainer.querySelectorAll('.date-slot');

            if (clickedDateSlot.classList.contains('clicked')) {
                allDateSlots.forEach(slot => {
                    slot.style.opacity = 1;
                    slot.classList.remove('no-click');
                });
                clickedDateSlot.classList.remove('clicked');
            } else {
                allDateSlots.forEach(slot => {
                    if (slot !== clickedDateSlot) {
                        slot.style.opacity = 0.5;

                        slot.classList.add('no-click');
                    } else {
                        slot.style.opacity = 1;
                        slot.classList.remove('no-click');
                    }
                });
                clickedDateSlot.classList.add('clicked');
            }
        }
    });
});
function resetDateAndSlot() {

    var dateHiddenContainer = document.querySelector(".date-hidden");
    dateHiddenContainer.style.display = "none";

    var allDateSlots = document.querySelectorAll(".date-slot");
    allDateSlots.forEach(function (dateSlot) {
        dateSlot.style.opacity = "";
        dateSlot.classList.remove("clicked");
        dateSlot.classList.remove("no-click");
        dateSlot.classList.remove("selected");
    });

    // Reset các giá trị của slots
    slotList.forEach(function (slot) {
        slot.classList.remove("selected");
    });


    slotSelected = false;
    changeInformation = false;
    selectedSlot = null;
    selectedDateSlot = null;
}



//////////////////////////////////////////////////////
//////////////////////////////////////////////////////////
/////////////////////////////////////////////////
// CHON CHUYEN KHOA
function onSpecialtyChange(selectedValue) {

// Phần xử lý cho doctorOptions
    var doctorOptions = document.querySelectorAll(".doctor-option");
    doctorOptions.forEach(function (option) {
        option.style.display = "none";
    });
    var selectedSpecialtyDoctors = document.querySelectorAll(".doctor-option[data-specialty='" + selectedValue + "']");
    selectedSpecialtyDoctors.forEach(function (option) {
        option.style.display = "block";
    });
    document.getElementById("selectedDoctor").value = "0";


    // Phần xử lý cập nhật thông tin chuyên khoa
    var dropdown = document.getElementById('selectedSpecialty');
    var selectedOption = dropdown.options[dropdown.selectedIndex];
    var specialtyName = selectedOption.text;
    document.getElementById('confirm-specialty').textContent = specialtyName;
    document.getElementById('hidden-specialty').value = specialtyName;
    resetDateAndSlot();
}

daysList.forEach(function (daysList, index) {
    daysList.addEventListener("click", function () {
        if (slotSelected)
            return;
        console.log("Đã nhấp vào ngày " + (index + 1));
        // ...
    });
});
//////////////////////////////////////////////////////
//////////////////////////////////////////////////////////
/////////////////////////////////////////////////
// CHECK THONG TIN
function displayConfirmation() {
    let customerName = document.getElementById('customer-name').value;
    let gender = document.querySelector('input[name="gender"]:checked').value;
    gender = (gender === "1") ? "Nam" : "Nữ";
    let dob = document.getElementById('bookingdob').value;
    let phone = document.getElementById('customer-phone').value;
    let email = document.getElementById('customer-email').value;
    let symptoms = document.getElementById('customer-symptoms').value;
    // Set textContent for display
    document.getElementById('confirm-name').textContent = customerName;
    document.getElementById('confirm-gender').textContent = gender;
    document.getElementById('confirm-dob').textContent = dob;
    document.getElementById('confirm-phone').textContent = phone;
    document.getElementById('confirm-email').textContent = email;
    document.getElementById('confirm-symptoms').textContent = symptoms;
    // Set value for hidden input fields
    document.getElementById('hidden-name').value = customerName;
    document.getElementById('hidden-gender').value = gender;
    document.getElementById('hidden-dob').value = dob;
    document.getElementById('hidden-phone').value = phone;
    document.getElementById('hidden-email').value = email;
    document.getElementById('hidden-symptoms').value = symptoms;
}




function onSlotSelect(slotValue, slotId) {
    document.getElementById('selectedSlotId').value = slotId;
    document.getElementById('confirm-slot').textContent = slotValue;
    document.getElementById('hidden-slot').value = slotValue;
}
//////////////////////////////////////////////////////
//////////////////////////////////////////////////////////
/////////////////////////////////////////////////
// SLOT CANCELED

function convertToDateDBFormat(dateStr) {
    // Kiểm tra xem dateStr có phải là một chuỗi và có chứa dấu '/' không
    if (typeof dateStr !== "string" || !dateStr.includes('/')) {
        console.error("Invalid dateStr format:", dateStr);
        return null;
    }

    var parts = dateStr.split('/');

    // Kiểm tra xem có đủ 2 phần tử không
    if (parts.length !== 2) {
        console.error("Invalid date parts:", parts);
        return null;
    }

    var currentYear = new Date().getFullYear();
    return currentYear + '-' + (parts[1].length < 2 ? '0' + parts[1] : parts[1]) + '-' + (parts[0].length < 2 ? '0' + parts[0] : parts[0]);
}


//function updateSlotsBasedOnDoctorAndDate() {
//    var selectedDoctorId = document.getElementById('selectedDoctor').value;
//    var selectedDate = document.getElementById('hidden-date').value;
//    var formattedDate = convertToDateDBFormat(selectedDate);
//    var bookedSlots = JSON.parse(document.getElementById('bookedSlotsData').getAttribute('data-booked-slots'));
//    var allSlots = document.querySelectorAll('.grid-date');
//    allSlots.forEach(function (slotElement) {
//        slotElement.style.backgroundColor = '';
//        slotElement.disabled = false;
//        for (var i = 0; i < bookedSlots.length; i++) {
//            var bookedSlot = bookedSlots[i];
//            if (bookedSlot.DoctorId == selectedDoctorId && bookedSlot.SlotId == slotElement.value && bookedSlot.Day === formattedDate) {
//                slotElement.style.color = 'red';
//                slotElement.classList.add('disabled-slot');
//                slotElement.disabled = true;
//            }
//        }
//    });
//}

function updateSlotsBasedOnDoctorAndDate() {
    var selectedDoctorId = document.getElementById('selectedDoctor').value;
    var selectedDate = document.getElementById('hidden-date').value;
    var formattedDate = convertToDateDBFormat(selectedDate);
    var bookedSlots = JSON.parse(document.getElementById('bookedSlotsData').getAttribute('data-booked-slots'));
    var allSlots = document.querySelectorAll('.grid-date');

    var bookedSlotsMap = {};

    bookedSlots.forEach(slot => {
        var key = slot.DoctorId + "_" + slot.Day + "_" + slot.SlotId;
        bookedSlotsMap[key] = true;
    });

    allSlots.forEach(function (slotElement) {
        slotElement.style.backgroundColor = '';
        slotElement.style.color = '';
        slotElement.classList.remove('disabled-slot');
        slotElement.disabled = false;
    });

    allSlots.forEach(function (slotElement) {
        var key = selectedDoctorId + "_" + formattedDate + "_" + slotElement.value;

        if (bookedSlotsMap[key]) {
            slotElement.style.color = 'red';
            slotElement.classList.add('disabled-slot');
            slotElement.disabled = true;
        }
    });
}



function onDoctorChange(dropdown) {
    var selectedOption = dropdown.options[dropdown.selectedIndex];
    var doctorId = selectedOption.value;
    var doctorName = selectedOption.text;

    // Hiển thị tên bác sĩ trong phần confirm
    document.getElementById('confirm-doctor').textContent = doctorName;

    // Cập nhật giá trị doctorId vào input hidden
    document.getElementById('hidden-doctorId').value = doctorId;

    if (doctorId !== "0") {
        // Lấy danh sách dịch vụ cho bác sĩ tương ứng từ serviceListData
        var serviceListData = JSON.parse(document.getElementById('serviceListData').getAttribute('data-service-list'));
        var servicesForDoctor = serviceListData.filter(function (service) {
            return service.DoctorId === doctorId;
        });

        // Cập nhật dropdown dịch vụ với các dịch vụ cho bác sĩ đó
        var serviceDropdown = document.getElementById('serviceDropdown');
        serviceDropdown.innerHTML = '';

        servicesForDoctor.forEach(function (service) {
            var option = document.createElement('option');
            option.value = service.ServiceId;
            option.text = service.ServiceName;
            serviceDropdown.appendChild(option);
        });

        // Gọi hàm để cập nhật giá trị hidden service (tương tự như với doctorId)
        updateHiddenService();

    } else {
        // Nếu bác sĩ không được chọn, xóa nội dung của dropdown dịch vụ
        var serviceDropdown = document.getElementById('serviceDropdown');
        serviceDropdown.innerHTML = '';

        // Đặt thông tin bác sĩ trong phần confirm về rỗng
        document.getElementById('confirm-doctor').textContent = '';

        // Đặt giá trị hidden input về rỗng
        document.getElementById('hidden-doctor').value = '';
        document.getElementById('hidden-service').value = '';
        document.getElementById('confirm-service').textContent = '';
        document.getElementById('hidden-service').value = '';
    }

    // Gọi các hàm cần thiết khác
    resetDateAndSlot();
    updateSlotsBasedOnDoctorAndDate();
}

function updateHiddenService() {
    // Lấy selected option từ dropdown dịch vụ
    var serviceDropdown = document.getElementById('serviceDropdown');
    var selectedServiceOption = serviceDropdown.options[serviceDropdown.selectedIndex];
    var selectedServiceId = selectedServiceOption.value;

    // Cập nhật giá trị hidden service
    document.getElementById('hidden-service').value = selectedServiceId;

    // Hiển thị tên dịch vụ trong phần confirm
    var selectedServiceName = selectedServiceOption.text;
    document.getElementById('confirm-service').textContent = selectedServiceName;
}




function onDateSelect(dateValue) {
    document.getElementById('confirm-date').textContent = dateValue;
    document.getElementById('hidden-date').value = dateValue;

    updateSlotsBasedOnDoctorAndDate();
}
