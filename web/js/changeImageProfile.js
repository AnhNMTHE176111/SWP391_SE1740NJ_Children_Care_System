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
    console.log('click');
     let popupItem = document.getElementsByClassName('popup')[0];
     console.log('click');
     document.body.style.overflow = 'hidden';
     document.getElementById('change-profile-container').style.display = 'block';
     popupItem.style.display = 'block';
}

function closePopup() {
    let popupItem = document.getElementsByClassName('popup')[0];
    document.body.style.overflow = 'auto';
    document.getElementById('change-profile-container').style.display = 'none';
    popupItem.style.display = 'none';
}