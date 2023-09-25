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
    let popupItem = document.getElementsByClassName('change-profile-container')[0];
    document.body.style.backgroundColor = '#e2e2e2';
    popupItem.style.display = popupItem.style.display === 'block' ? 'none' : 'block';
}

function closePopup() {
    let popupItem = document.getElementsByClassName('change-profile-container')[0];
    document.body.style.backgroundColor = '#fff';
    popupItem.style.display = popupItem.style.display === 'block' ? 'none' : 'block';
}