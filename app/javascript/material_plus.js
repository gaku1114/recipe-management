function plus () {
  document.addEventListener("click", (e) => {
    if(e.target.closest("#material-plus")) {
      const formSpace = document.getElementById("materials-top");
      const materialFormHtml = `<form class="new-material-form" action="/dishes/${gon.dish_id}/materials" accept-charset="UTF-8" method="post">
                                  <input type="text" class="material-new-name" placeholder="材料を追加する"  id="material_name" name="material[name]">
                                  <input type="submit" name="commit" value="追加" class="material-new-btn" data-disable-with="追加">
                                </form>`;
      formSpace.innerHTML = materialFormHtml;
    }else if(!e.target.closest(".new-material-form")) {
      const formSpace = document.getElementById("materials-top");
      const plusBtnHtml = `<div class="materials-header">
                            材料
                          </div>
                          <div id="material-plus">
                            <img class="material-plus-btn" src="/assets/plus-btn-827740be4d4aa347456020d5c3020363f75fdb56f143ff3bfb5aa665f51d8d84.png">
                          </div>`;
      formSpace.innerHTML = plusBtnHtml;
    }
  })
}

window.addEventListener("load", plus);