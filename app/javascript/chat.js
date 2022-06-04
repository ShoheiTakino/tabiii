window.addEventListener('load',function(){
  const submit = document.getElementById("submit");
  submit.addEventListener("click", (e) => {
    e.preventDefault();
    const form = this.document.getElementById("form");
    const formData = new FormData(form);
    const XHR = new XMLHttpRequest();
    XHR.open("POST", "comments/posts", true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = () => {
      const list = document.getElementById("list");
      const item = XHR.response.comment;
      const html = ` 
      <div class="post__chats">
    <div class="post__time">
    ${item.created_at}<br>
    </div>
    <div class="post__chat">
    ${item.chat}<br>
   </div>
   <div class="post__chat__name">by${item.user.nickname}</div><br>
   </div> `;
   list.insertAdjacentHTML("afterend", html);
    };
  });
});
