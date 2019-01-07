---
title: JavaScript - Progress Bar
tags: js
reference:

---

<style>
#myProgress {
  width: 100%;
  background-color: grey;
}

#myBar {
  width: 0%;
  height: 30px;
  background-color: #4CAF50;
  text-align: center;
  line-height: 30px;
  color: white; 
}
</style>

<div id="myProgress">
  <div id="myBar">0%</div>
</div>
<br>
<p>all: <input id="all" type="number" value="0" min="0" max="100"></p>
<p>current: <input id="current" type="number" value="0" min="0" max="100" oninput="change()"></p>

<button onclick="increment()">Inc</button>
<button onclick="decrement()">Dec</button>

<script>
function change(){
    var all = parseFloat(document.getElementById("all").value);
    var current = parseFloat(document.getElementById("current").value);
    var elem = document.getElementById("myBar");
    var current_proc = all - ( all - current );
    var result = parseInt(current_proc * 100 / all);
    if ( result <= 100 ){
        elem.innerHTML = result + '%';
        elem.style.width = result + '%';
    }
}

function increment(){
    var current = document.getElementById("current");
    current.innerHTML = current.value++;
    change();
}

function decrement(){
    var current = document.getElementById("current");
    current.innerHTML = current.value--;
    change();
}

</script>