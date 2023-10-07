
document.getElementById('btn-show-filter').addEventListener('click', (e) => {
    e.preventDefault();
    let popupItem = document.getElementsByClassName('popup')[1];
    document.body.style.overflow = 'hidden';
    document.getElementById('filter-container').style.display = 'flex';
    popupItem.style.display = 'block';
})
document.getElementById('addNewUser').addEventListener('click', (e) => {
    e.preventDefault();
    let popupItem = document.getElementsByClassName('popup')[1];
    document.body.style.overflow = 'hidden';
    document.getElementById('add-newuser-container').style.display = 'flex';
    popupItem.style.display = 'block';
})
document.getElementById('cancel-btn').addEventListener('click', (e) => {
    e.preventDefault();
    let popupItem = document.getElementsByClassName('popup')[1];
    document.body.style.overflow = 'hidden';
    popupItem.style.display = 'none';
})