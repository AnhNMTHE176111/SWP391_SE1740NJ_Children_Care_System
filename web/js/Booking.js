
let currentStep = 1;
//////////////////////////////////////////////////////
//////////////////////////////////////////////////////////
/////////////////////////////////////////////////
// DI CHUYEN CAC TRANG
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
    if (currentStep === 1) {
        showStep(2);
        step1.style.display = "none";
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
});


showStep(1);

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
    });
});




//////////////////////////////////////////////////////
//////////////////////////////////////////////////////////
/////////////////////////////////////////////////
// CHON CHUYEN KHOA
function onSpecialtyChange(selectedValue) {

    var doctorOptions = document.querySelectorAll(".doctor-option");
    doctorOptions.forEach(function (option) {
        option.style.display = "none";
    });
    var selectedSpecialtyDoctors = document.querySelectorAll(".doctor-option[data-specialty='" + selectedValue + "']");
    selectedSpecialtyDoctors.forEach(function (option) {
        option.style.display = "block";
    });
    document.getElementById("selectedDoctor").value = "0";
}

daysList.forEach(function (daysList, index) {
    daysList.addEventListener("click", function () {
         if (slotSelected) 

            return;
        console.log("Đã nhấp vào ngày " + (index + 1));
        // ...
    });
});


