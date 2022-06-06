document.addEventListener('DOMContentLoaded', function(){
  const editForm = document.getElementById('icon_edit');
  const editNew = document.getElementById('icon__edit__area');
  if (editForm) return null;
  
  const editField = document.querySelector('input[type="file"][name="user[profile_image]"]');
  editField.addEventListener('change', function(e){

    const alreadyPreview = document.querySelector('.edit__user__image');
    if (alreadyPreview) {
      alreadyPreview.remove();
    };
    const file = e.target.files[0];
    const blob = window.URL.createObjectURL(file);

    const previewWrapper = document.createElement('div');
    previewWrapper.setAttribute('class', 'edit__user__image');
    const previewImage = document.createElement('img');
    previewImage.setAttribute('class', 'preview__image');
    previewImage.setAttribute('src', blob);

    previewWrapper.appendChild(previewImage);
    editNew.appendChild(previewWrapper);
  });
});