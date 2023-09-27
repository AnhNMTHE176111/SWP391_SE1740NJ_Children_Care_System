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
    let popupItem = document.getElementsByClassName('popup')[0];
    document.body.style.overflow = 'hidden';
    popupItem.style.display = popupItem.style.display === 'block' ? 'none' : 'block';
}

function closePopup() {
    let popupItem = document.getElementsByClassName('popup')[0];
    document.body.style.overflow = 'auto';
    popupItem.style.display = popupItem.style.display === 'block' ? 'none' : 'block';
}