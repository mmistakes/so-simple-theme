
const comercial = document.getElementById("comercial");
const nonComercial = document.getElementById("noncomercial");
const individual = document.getElementById("individual")
const nonprofit = document.getElementById("nonprofit")

const community = document.getElementById("community ")
const patron = document.getElementById("patron")

comercial.addEventListener("click", function (){
  console.log("click comercial")
})

nonComercial.addEventListener("click",function(){
  console.log("click noncomercial")

  comercial.classList.add("hide");
  nonComercial.classList.add("hide");
  individual.classList.remove("hide");
  nonprofit.classList.remove("hide")
})

nonprofit.addEventListener("click",function(){
  console.log("click nonprofit")
  individual.classList.add("hide");
  nonprofit.classList.add("hide");
patron.classList.remove("hide")
})

individual.addEventListener("click",function(){
  console.log("click individual");

  individual.classList.add("hide");
  nonprofit.classList.add("hide");
  community.classList.remove("hide");

})