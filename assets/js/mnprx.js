
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

const employees = document.getElementById('employees')

const selection = document.getElementById("tittle")

const customization  = document.getElementById('customization')
const subs =document.getElementById('subs')

const demo = document.getElementById("demo")

const dis = document.getElementById('disclaimer')
const reset = document.getElementById('reset');


comercial.addEventListener("click", function (){
  //console.log("click comercial")
  comercial.classList.add("hide");
  nonComercial.classList.add("hide");
  more.classList.remove("hide");
  less.classList.remove("hide")
  selection.innerText = 'Chosen license : Comercial Use'
  employees.classList.remove('hide')
  reset.classList.remove("hide")

})

nonComercial.addEventListener("click",function(){
  console.log("click noncomercial")

  comercial.classList.add("hide");
  nonComercial.classList.add("hide");
  individual.classList.remove("hide");
  nonprofit.classList.remove("hide")
  selection.innerText = 'Chosen license : Non-Commercial Use'
  reset.classList.remove("hide")
})

nonprofit.addEventListener("click",function(){
  console.log("click nonprofit")
  individual.classList.add("hide");
  nonprofit.classList.add("hide");
  patron.classList.remove("hide")
  subs.classList.remove('hide')
  demo.classList.remove('hide')
})

individual.addEventListener("click",function(){
  console.log("click individual");

  individual.classList.add("hide");
  nonprofit.classList.add("hide");
  community.classList.remove("hide");
  subs.classList.remove('hide')
  demo.classList.remove('hide')
})

more.addEventListener("click",function(){
  console.log("more");
  more.classList.add("hide");
  less.classList.add("hide")
  studio.classList.remove('hide')
  employees.innerHTML = 'Your company has more than 10 employees '
  customization.classList.remove('hide')
  subs.classList.remove('hide')
  demo.classList.remove('hide')
})

less.addEventListener("click",function(){
  console.log("less");
  more.classList.add("hide");
  less.classList.add("hide")
  indie.classList.remove('hide')
  employees.innerHTML = 'Your company has less than 10 '
  customization.classList.remove('hide')
  subs.classList.remove('hide')
  demo.classList.remove('hide')
})



reset.addEventListener("click",function(){
  console.log("reset");

  comercial.classList.remove("hide");
  nonComercial.classList.remove("hide");

  more.classList.add('hide');
  less.classList.add('hide')
  individual.classList.add("hide");
  nonprofit.classList.add("hide")
  patron.classList.add('hide')
  community.classList.add('hide')
  studio.classList.add('hide')
  indie.classList.add('hide')
  selection.innerText = 'Choose your license'
  employees.classList.add('hide')
  employees.innerHTML = 'How many employees does your company have?'
  customization.classList.add('hide')
  subs.classList.add('hide')
  reset.classList.add('hide')
  demo.classList.add('hide')
})