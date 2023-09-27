
let currentStep = 1;
// Lấy các phần tử HTML của các bước
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
//function toggleSlot(element) {
//    element.classList.toggle("selected");
//}

showStep(1);
//const daysList = document.querySelectorAll(".date-slot[name='date']");
//const slotList = document.querySelectorAll(".grid-date[name='slot']");
//const dateSelect = document.querySelector(".date-hidden");
//daysList.forEach(function (el) {
//    let display = true;
//    el.addEventListener("click", function () {
//        if (slotSelected) {
//            // Ngăn hiển thị danh sách slot nếu đã chọn slot
//            return;
//        }
//        if (display) {
//            console.log("hihi")
//            dateSelect.style.display = "block";
//            display = !display;
//        } else {
//            dateSelect.style.display = "none";
//            display = !display;
//        }
//    });
//});
//
//
//slotList.forEach(function (slot) {
//    slot.addEventListener("click", function () {
//       
//        slotList.forEach(function (otherSlot) {
//            otherSlot.classList.remove("selected");
//        });
//
//        slot.classList.add("selected");
//        const selectedDateSlot = slot.closest(".date-box");
//
//        daysList.forEach(function (date) {
//            date.classList.remove("selected");
//        });
//        if (selectedDateSlot) {
//            const selectedDate = selectedDateSlot.querySelector(".date-slot[name='date']");
//            if (selectedDate) {
//                selectedDate.classList.add("selected");
//            }
//        }
//         slotSelected = true;
//    });
//});

let slotSelected = false; // Biến để kiểm tra xem slot đã được chọn chưa
let selectedSlot = null; // Biến để lưu trữ slot đã chọn
let selectedDateSlot = null; // Biến để lưu trữ ngày đã chọn

const daysList = document.querySelectorAll(".date-slot[name='date']");
const slotList = document.querySelectorAll(".grid-date[name='slot']");
const dateSelect = document.querySelector(".date-hidden");

daysList.forEach(function (el) {
    let display = true;
    el.addEventListener("click", function () {
        if (slotSelected) {
            // Ngăn hiển thị danh sách slot nếu đã chọn slot
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
            // Nếu đã chọn slot, hủy lựa chọn (deselect)
            slot.classList.remove("selected");
            slotSelected = false;

            // Loại bỏ lựa chọn của ngày
            if (selectedDateSlot) {
                selectedDateSlot.classList.remove("selected");
            }

            // Đặt lại biến lưu trữ
            selectedSlot = null;
            selectedDateSlot = null;
            return;
        }

        // Loại bỏ lựa chọn của tất cả các slot khác
        slotList.forEach(function (otherSlot) {
            otherSlot.classList.remove("selected");
        });

        // Chọn slot hiện tại
        slot.classList.add("selected");
        selectedSlot = slot;

        // Tìm ngày tương ứng của slot đã chọn
        const selectedDate = slot.getAttribute("data-date");
        selectedDateSlot = document.querySelector(`.date-slot[name='date'][data-date='${selectedDate}']`);

        // Loại bỏ lựa chọn của ngày
        daysList.forEach(function (date) {
            date.classList.remove("selected");
        });

        // Chọn ngày tương ứng với slot đã chọn
        if (selectedDateSlot) {
            selectedDateSlot.classList.add("selected");
        }

        slotSelected = true; // Đặt biến slotSelected thành true để đánh dấu đã chọn slot
    });
});


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
            // Ngăn hiển thị danh sách slot nếu đã chọn slot
            return;
        console.log("Đã nhấp vào ngày " + (index + 1));
        // ...
    });
});


