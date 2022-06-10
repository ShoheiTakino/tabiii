window.addEventListener('load',function(deleteCheck){
  const deleteConfirmation = document.getElementById("delete-confirmation");
    deleteConfirmation.addEventListener("click", ( ) => {
      const deletePopup = window.alert('アカウントを削除しました')
    });
});
