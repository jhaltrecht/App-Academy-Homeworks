document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items
  const addLi=(e) =>{
    e.preventDefault();
    const nameInput = document.querySelector(".favorite-input")
    const nameInputVal = nameInput.value;
    nameInput.value = "";
    const li = document.createElement("li");
    li.textContent = nameInputVal;

    const ul = document.getElementById("sf-places");
    ul.appendChild(li);
  };
  // --- your code here!
const listSubmitButton=document.querySelector(".favorite-submit");
listSubmitButton.addEventListener("click", addLi);


  // adding new photos
  const togglePhotoForm = (e) => {
    const photoFormDiv = document.querySelector(".photo-form-container");
    if (photoFormDiv.className === "photo-form-container") {
      photoFormDiv.className = "photo-form-container hidden";
    } else {
      photoFormDiv.className = "photo-form-container";
    }
  };
  // --- your code here!
  const photoShowButton = document.querySelector(".photo-show-button")
  photoShowButton.addEventListener("click",togglePhotoForm)


});
