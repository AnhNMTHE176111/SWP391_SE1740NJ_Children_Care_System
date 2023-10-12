
document.getElementById('btn-show-filter').addEventListener('click', (e) => {
    showPopup(e);
    document.getElementById('filter-container').style.display = 'flex';
})
document.getElementById('addNewUser').addEventListener('click', (e) => {
    showPopup(e);
    document.getElementById('add-newuser-container').style.display = 'flex';
})
document.getElementById('cancel-btn').addEventListener('click', (e) => {
    closePopup(e);
})
document.getElementById('cancel-filter-btn').addEventListener('click', (e) => {
    closePopup(e);
})

function showPopup(e) {
    e.preventDefault();
    let popupItem = document.getElementsByClassName('popup')[0];
    document.body.style.overflow = 'hidden';
    popupItem.style.display = 'block';
}

function closePopup(e) {
    e.preventDefault();
    let popupItem = document.getElementsByClassName('popup')[0];
    document.body.style.overflow = 'scroll';
    popupItem.style.display = 'none';
}

