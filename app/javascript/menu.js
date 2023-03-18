window.addEventListener('load', function(){

  const pullDownButton = document.getElementById("menu")
  const pullDownParents = document.getElementById("pull-down")

  pullDownButton.addEventListener('click', function() {
    if (pullDownParents.getAttribute("style") == "display:block;") {
      pullDownParents.removeAttribute("style")
    } else {
      pullDownParents.setAttribute("style", "display:block;")
    }
  })
})