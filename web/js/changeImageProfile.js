function previewProfileImage(input) {
    if (input.files && input.files[0]) {
        const reader = new FileReader();

        reader.onloadend = function (e) {
            document.querySelector('#image-user').src = reader.result;
        };

        reader.readAsDataURL(input.files[0]);
    }
}

function showPopup() {
    
}