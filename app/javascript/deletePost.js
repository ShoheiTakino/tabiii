window.addEventListener('load',function(deletePost){
  const deletePostConfirmation = document.getElementById("post__destroy");
    deletePostConfirmation.addEventListener("click", ( ) => {
      const deletePostAlert = window.alert('投稿を削除しました')
    });
});
