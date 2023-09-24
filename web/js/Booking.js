
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


function toggleSlot(element) {
  element.classList.toggle("selected");
}

showStep(1);

const dateSelect = document.querySelector(".date-hidden");
const day1 = document.querySelector(".date1");
const day2 = document.querySelector(".date2");
const day3 = document.querySelector(".date3");


const daysList = [day1, day2, day3];
daysList.forEach(function (el) {
  let display = true;
  el.addEventListener("click", function () {
    if (display) {
      dateSelect.style.display = "block";
      display = !display;
    } else {
      dateSelect.style.display = "none";
      display = !display;
    }
  });
});




