document.addEventListener('DOMContentLoaded', function(){
  const postForm = document.getElementById('edit_post');
  const previewList = document.getElementById('previews_edit');
  if (!postForm) return null;

  const fileArea = document.querySelector('input[type="file"][name="post[image]"]');
  fileArea.addEventListener('change', function(e){
    const alreadyPreview = document.querySelector('.preview');
    if (alreadyPreview){
      alreadyPreview.remove();
      };
      
    const file = e.target.files[0];
    const blob = window.URL.createObjectURL(file);
    const previewWrapper = document.createElement('div');
    previewWrapper.setAttribute('class', 'preview');
    const previewImage = document.createElement('img');
    previewImage.setAttribute('class', 'preview-image');
    previewImage.setAttribute('src', blob);

    previewWrapper.appendChild(previewImage);
    previewList.appendChild(previewWrapper);
  });
});