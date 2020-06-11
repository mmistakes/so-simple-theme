// pricing togglers
var filtMonthly = document.getElementById("filt-monthly"),
    filtQuarterly = document.getElementById("filt-quarterly"),
    filtYearly = document.getElementById("filt-yearly"),
    switcher = document.getElementById("switcher"),
    mSwitch = document.getElementById("state-m"),
    qSwitch = document.getElementById("state-q"),
    ySwitch = document.getElementById("state-y"),
    monthlyTable = document.getElementById("monthly"),
    quarterlyTable = document.getElementById("quarterly"),
    yearlyTable = document.getElementById("yearly");
    mSwitchCaption = document.getElementById("state-m-caption");
    ySwitchCaption = document.getElementById("state-y-caption");


filtMonthly.addEventListener("click", function(){
  mSwitch.checked = true;
  // change text
  filtMonthly.classList.add("toggler--is-active");
  filtQuarterly.classList.remove("toggler--is-active");
  filtYearly.classList.remove("toggler--is-active");
  // change content
  ySwitchCaption.classList.add("transparent");
  mSwitchCaption.classList.remove("transparent");
  monthlyTable.classList.remove("hide");
  quarterlyTable.classList.add("hide");
  yearlyTable.classList.add("hide");
});

filtQuarterly.addEventListener("click", function(){
  qSwitch.checked = true;
  // change text
  filtQuarterly.classList.add("toggler--is-active");
  filtMonthly.classList.remove("toggler--is-active");
  filtYearly.classList.remove("toggler--is-active");
  // change content
  ySwitchCaption.classList.add("transparent");
  mSwitchCaption.classList.add("transparent");
  monthlyTable.classList.add("hide");
  quarterlyTable.classList.remove("hide");
  yearlyTable.classList.add("hide");
});

filtYearly.addEventListener("click", function(){
  ySwitch.checked = true;
  // change text
  filtYearly.classList.add("toggler--is-active");
  filtQuarterly.classList.remove("toggler--is-active");
  filtMonthly.classList.remove("toggler--is-active");
  // change content
  ySwitchCaption.classList.remove("transparent");
  mSwitchCaption.classList.add("transparent");
  monthlyTable.classList.add("hide");
  quarterlyTable.classList.add("hide");
  yearlyTable.classList.remove("hide");
});

mSwitch.addEventListener("click", function(){
  // change text
  filtMonthly.classList.add("toggler--is-active");
  filtQuarterly.classList.remove("toggler--is-active");
  filtYearly.classList.remove("toggler--is-active");
  // change content
  ySwitchCaption.classList.add("transparent");
  mSwitchCaption.classList.remove("transparent");
  monthlyTable.classList.remove("hide");
  quarterlyTable.classList.add("hide");
  yearlyTable.classList.add("hide");
});

qSwitch.addEventListener("click", function(){
  // change text
  filtMonthly.classList.remove("toggler--is-active");
  filtQuarterly.classList.add("toggler--is-active");
  filtYearly.classList.remove("toggler--is-active");
  // change content
  ySwitchCaption.classList.add("transparent");
  mSwitchCaption.classList.add("transparent");
  monthlyTable.classList.add("hide");
  quarterlyTable.classList.remove("hide");
  yearlyTable.classList.add("hide");
});

ySwitch.addEventListener("click", function(){
  // change text
  filtMonthly.classList.remove("toggler--is-active");
  filtQuarterly.classList.remove("toggler--is-active");
  filtYearly.classList.add("toggler--is-active");
  // change content
  ySwitchCaption.classList.remove("transparent");
  mSwitchCaption.classList.add("transparent");
  monthlyTable.classList.add("hide");
  quarterlyTable.classList.add("hide");
  yearlyTable.classList.remove("hide");
});
