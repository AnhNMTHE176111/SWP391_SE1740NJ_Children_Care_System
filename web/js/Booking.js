
let currentStep = 1;
//////////////////////////////////////////////////////
//////////////////////////////////////////////////////////
/////////////////////////////////////////////////
// DI CHUYEN CAC TRANG
let message = "";
let selectedDateValue = "";
let selectedSlotValue = "";



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
dates.forEach(function(date) {
    date.addEventListener('click', function() {
        selectedDateValue = this.textContent || this.innerText;
    });
});

let slots = document.querySelectorAll('.grid-date');
slots.forEach(function(slot) {
    slot.addEventListener('click', function() {
        selectedSlotValue = this.textContent || this.innerText;
    });
});

function checkEmptyInputs() {
    let specialty = document.getElementById("selectedSpecialty").value;
    let doctor = document.getElementById("selectedDoctor").value;
    let isError = false;

    // Kiểm tra chuyên khoa
    if (specialty === "0") {
        document.getElementById("specialtyError").textContent = 'Vui lòng chọn chuyên khoa';
        document.getElementById("specialtyError").style.display = "block";
        isError = true;
    } else {
        document.getElementById("specialtyError").style.display = "none";
    }

    // Kiểm tra bác sĩ
    if (doctor === "0") {
        document.getElementById("doctorError").textContent = 'Vui lòng chọn bác sĩ';
        document.getElementById("doctorError").style.display = "block";
        console.log("jiji");
        isError = true;
    } else {
        document.getElementById("doctorError").style.display = "none";
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


document.addEventListener('DOMContentLoaded', function() {
    const dateSlotsContainer = document.querySelector('.date-slots');
    
    dateSlotsContainer.addEventListener('click', function(e) {
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


//function onDoctorChange(dropdown) {
//    var selectedOption = dropdown.options[dropdown.selectedIndex];
//    var doctorName = selectedOption.text;
//    var doctorId = selectedOption.value;
//
//    document.getElementById('confirm-doctor').textContent = doctorName;
//    document.getElementById('hidden-doctorId').value = doctorId;
//}



//function onDateSelect(dateValue) {
//    document.getElementById('confirm-date').textContent = dateValue;
//    document.getElementById('hidden-date').value = dateValue;
//}

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
    // Chuyển "11/10" thành "2023-10-11"
    var parts = dateStr.split('/');
    var currentYear = new Date().getFullYear();
    return currentYear + '-' + (parts[1].length < 2 ? '0' + parts[1] : parts[1]) + '-' + (parts[0].length < 2 ? '0' + parts[0] : parts[0]);
}

function updateSlotsBasedOnDoctorAndDate() {
    var selectedDoctorId = document.getElementById('selectedDoctor').value;
    var selectedDate = document.getElementById('hidden-date').value; 
    var formattedDate = convertToDateDBFormat(selectedDate);
    
    var bookedSlots = JSON.parse(document.getElementById('bookedSlotsData').getAttribute('data-booked-slots'));

    var allSlots = document.querySelectorAll('.grid-date');
    allSlots.forEach(function(slotElement) {
        slotElement.style.backgroundColor = '';
        slotElement.disabled = false;

        for (var i = 0; i < bookedSlots.length; i++) {
            var bookedSlot = bookedSlots[i];
            if (bookedSlot.DoctorId == selectedDoctorId && bookedSlot.SlotId == slotElement.value && bookedSlot.Day === formattedDate) {
                  slotElement.style.color = 'dark grey';
        slotElement.classList.add('disabled-slot'); 
                slotElement.disabled = true;
            }
        }
    });
}


function onDoctorChange(dropdown) {
    var selectedOption = dropdown.options[dropdown.selectedIndex];
    var doctorName = selectedOption.text;
    var doctorId = selectedOption.value;

    document.getElementById('confirm-doctor').textContent = doctorName;
    document.getElementById('hidden-doctorId').value = doctorId;

    // Gọi hàm cập nhật các slots dựa trên sự kết hợp của bác sĩ và ngày
    updateSlotsBasedOnDoctorAndDate();
}

function onDateSelect(dateValue) {
    document.getElementById('confirm-date').textContent = dateValue;
    document.getElementById('hidden-date').value = dateValue;

    // Gọi hàm cập nhật các slots dựa trên sự kết hợp của bác sĩ và ngày
    updateSlotsBasedOnDoctorAndDate();
}
