function count (){
  const articleText = document.getElementById("edit_count_text")
  articleText.addEventListener("keyup", () => {
    const countVal = articleText.value.length;
    const countNum = document.getElementById("edit_count_number");
    countNum.innerHTML = `${countVal}文字`;

    //const charNum = document.getElementById("count_number");
    //charNum.innerHTML = "0文字";
  })
};

window.addEventListener('load', count);