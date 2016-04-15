import "turbolinks"

document.addEventListener("turbolinks:request-start", function(){

  //console.log("before")
  //document.getElementsByTagName("body")[0].className = "animated shake"
});

document.addEventListener("turbolinks:load", function(){

  //console.log("load")
  //document.getElementsByTagName("body")[0].className = ""
});