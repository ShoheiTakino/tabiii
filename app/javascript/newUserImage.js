document.addEventListener('DOMContentLoaded', function(){
  const userForm = document.getElementById('new_user__create');
  const userNew = document.getElementById('new_user_image');
  if (!userForm) return null;
  const fileNew = document.querySelector('input[type="file"][name="user[profile_image]"]');
  fileNew.addEventListener('change', function(e){
    const alreadyPreview = document.querySelector('.new__user__profile');
    if (alreadyPreview) {
      alreadyPreview.remove();
    };
    const imageTake = e.target.files[0];
    const imageUrl = window.URL.createObjectURL(imageTake);

    const previewWrapper = document.createElement('div');
    previewWrapper.setAttribute('class', 'new__user__preview');
    const previewImage = document.createElement('img');
    previewImage.setAttribute('class', 'new__user__profile');
    previewImage.setAttribute('src', imageUrl)

    previewWrapper.appendChild(previewImage);
    userNew.appendChild(previewImage);
  });
});