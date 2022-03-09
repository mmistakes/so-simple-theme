
const comercial = document.getElementById("comercial");
const nonComercial = document.getElementById("noncomercial");
const individual = document.getElementById("individual")
const nonprofit = document.getElementById("nonprofit")

const community = document.getElementById("community ")
const patron = document.getElementById("patron")


const more = document.getElementById("more");
const less = document.getElementById("less");

const studio= document.getElementById("studio");

const indie= document.getElementById("indie");

comercial.addEventListener("click", function (){
  console.log("click comercial")
  comercial.classList.add("hide");
  nonComercial.classList.add("hide");
  more.classList.remove("hide");
  less.classList.remove("hide")

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

more.addEventListener("click",function(){
  console.log("more");
  more.classList.add("hide");
  less.classList.add("hide")
  studio.classList.remove('hide')
})

less.addEventListener("click",function(){
  console.log("less");
  more.classList.add("hide");
  less.classList.add("hide")
  indie.classList.remove('hide')
})
