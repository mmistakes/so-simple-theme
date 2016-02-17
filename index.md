---
layout: page
title: Stan
excerpt:
search_omit: true
image:
  feature: feature/wide_ensemble.png
---

Stan is a probabilistic programming language implementing
full Bayesian statistical inference with

* MCMC sampling <span class="note">(NUTS, HMC)</span>,

approximate Bayesian inference with

* Variational inference <span class="note">(ADVI)</span>

and penalized maximum likelihood estimation with

* Optimization <span class="note">(L-BFGS)</span>.

Stan is coded in C++ and runs on all major platforms
<span class="note">(Linux, Mac, Windows)</span>.

Stan is freedom-respecting, open-source software
<span class="note">(new BSD core,  GPLv3 interfaces)</span>.

<style>
.fc-black_overlay{ 
display:none; position: fixed; z-index:1000001; top: 0%;left: 0%;width: 100%;height: 100%;
background-color: black; filter: alpha(opacity=50); cursor:pointer; opacity:0.5; 
}
.fc-white_content {
opacity:1; display:none; margin-top: -320px; margin-left: -485px; width:970px; height:640px; 
position:fixed; top:50%; left:50%; border: none;z-index:1000002;overflow: auto;
}
.fc-main-box{
opacity:1; display:none; margin:15px auto 0 auto; width:930px; position:relative; z-index:1000003;
}
.fc-widget_close{
opacity:1; content:url(http://i1338.photobucket.com/albums/o691/WeCause/X_zpse4a7e538.png); 
position:absolute; z-index=1000004; right:-16px; top:-16px; display:block; cursor:pointer; 
}
.floating_button{
display: block; margin-top: 0px; margin-left: 0px; width:auto ; height: auto; 
position:fixed; z-index:999999; overflow: auto;
}
@keyframes backfadesin {
   from { opacity:0; }
   to {opacity:.5;}
}
@-moz-keyframes backfadesin { 
    from { opacity:0; }
    to {opacity:.5;}
}
@-webkit-keyframes backfadesin { 
    from { opacity:0; }
    to {opacity:.5;}
}
@-o-keyframes backfadesin {
    from { opacity:0; }
    to {opacity:.5;}
}
@-ms-keyframes backfadesin {
    from { opacity:0; }
    to {opacity:.5;}
}
@keyframes fadesin {
   0%{ opacity:0; }
   50%{ opacity:0; }
   75% {opacity: 0; transform: translateY(20px);}
   100% {opacity: 1; transform: translateY(0);}
}
@-moz-keyframes fadesin {
   0%{ opacity:0; }
   50%{ opacity:0; }
   75% {opacity: 0; -moz-transform: translateY(20px);}
   100% {opacity: 1; -moz-transform: translateY(0);}
}
@-webkit-keyframes fadesin {
   0%{ opacity:0; }
   50%{ opacity:0; }
   75% {opacity: 0; -webkit-transform: translateY(20px);}
   100% {opacity: 1; -webkit-transform: translateY(0);}
@-o-keyframes fadesin {
   0%{ opacity:0; }
   50%{ opacity:0; }
   75% {opacity: 0; -o-transform: translateY(20px);}
   100% {opacity: 1; -o-transform: translateY(0);}
}
@-ms-keyframes fadesin {
   0%{ opacity:0; }
   50%{ opacity:0; }
   75% {opacity: 0; -ms-transform: translateY(20px);}
   100% {opacity: 1; -ms-transform: translateY(0);}
}
</style>

<script>
function open_window(cause_id) {
var  protocol=String(document.location.protocol);
var new_url;
if( /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)){
new_url="https://www.flipcause.com/widget/"+cause_id
window.open(new_url);
}
else {
document.getElementById("fc-fade").style.display="block";
document.getElementById("fc-fade").style.webkitAnimation="backfadesin 1s";
document.getElementById("fc-fade").style.animation="backfadesin 1s";
document.getElementById("fc-fade").style.mozAnimation="backfadesin 1s";
document.getElementById("fc-light").style.display="block";
document.getElementById("fc-light").style.webkitAnimation="fadesin 1.5s";
document.getElementById("fc-light").style.animation="fadesin 1.5s";
document.getElementById("fc-light").style.mozAnimation="fadesin 1.5s";
document.getElementById("fc-main").style.display="block";
document.getElementById("fc-main").style.webkitAnimation="fadesin 1.5s";
document.getElementById("fc-main").style.animation="fadesin 1.5s";
document.getElementById("fc-main").style.mozAnimation="fadesin 1.5s";
document.getElementById("fc-close").style.display="block";
document.getElementById("fc-close").style.webkitAnimation="fadesin 1.5s";
document.getElementById("fc-close").style.animation="fadesin 1.5s";
document.getElementById("fc-close").style.mozAnimation="fadesin 1.5s";
document.getElementById("fc-myFrame").style.display="block";
document.getElementById("fc-myFrame").style.webkitAnimation="fadesin 1.5s";
document.getElementById("fc-myFrame").style.animation="fadesin 1.5s";
document.getElementById("fc-myFrame").style.mozAnimation="fadesin 1.5s";
document.getElementById("fc-myFrame").src="https://www.flipcause.com/widget/"+cause_id;
}
}
function close_window() {
document.getElementById("fc-fade").style.display="none";
document.getElementById("fc-light").style.display="none";
document.getElementById("fc-main").style.display="none";
document.getElementById("fc-close").style.display="none";
document.getElementById("fc-myFrame").style.display="none";
}
</script>

<div id="fc-fade" class="fc-black_overlay" onclick="close_window()"></div>
<div id="fc-light" class="fc-white_content">
<div id="fc-main" class="fc-main-box">
<div id="fc-close" class="fc-widget_close" onclick="close_window()"> 
</div><iframe id="fc-myFrame" iframe height="580" width="925" style="border: 0; 
border-radius:5px 5px 5px 5px; box-shadow:0 0 8px rgba(0, 0, 0, 0.5);" scrolling="no" src=""></iframe></div>
</div>

Stan is associated with [NumFOCUS](http://numfocus.org) <span class="note">(501(c)3 nonprofit)</span>. 

<div style="background:#ccc; border-radius:0px 0px 0px 0px;font-weight:normal; font-family:Arial, Helvetica, sans-serif;border:none;box-shadow:none;left: 50%; margin-left:-72.5px;clear: both;display: block; width:145px;height:45px; line-height:2.8; position:relative; font-size:16px;text-align:center; cursor:pointer;color:#fff;text-decoration: none; z-index:1" onclick="open_window('NTU3Ng==')">Donate to Stan</div>

<!-- Could use direct URL:  https://www.flipcause.com/widget/give_now/NTU3Ng== -->

