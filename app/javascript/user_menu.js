window.addEventListener('load', function(){

  const pullDownButton = document.getElementById("user-name")
  const pullDownParents = document.getElementById("pull-down2")

  pullDownButton.addEventListener('click', function() {
    if (pullDownParents.getAttribute("style") == "display:block;") {
      pullDownParents.removeAttribute("style")
    } else {
      pullDownParents.setAttribute("style", "display:block;")
    }
  })
})