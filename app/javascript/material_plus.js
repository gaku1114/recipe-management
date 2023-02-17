function plus () {
  document.addEventListener("click", (e) => {
    if(e.target.closest(".material-plus")) {
      const formSpace = document.getElementById("materials-top");
      const materialFormHtml = `<form class="new-material-form" action="/dishes/${gon.dish_id}/materials" accept-charset="UTF-8" method="post">
                                  <input type="text" class="material-new-name" placeholder="材料を追加する"  id="material_name" name="material[name]" autofocus="autofocus">
                                  <input type="submit" name="commit" value="追加" class="material-new-btn" data-disable-with="追加">
                                </form>`;
      formSpace.innerHTML = materialFormHtml;
    }else if(!e.target.closest(".new-material-form")) {
      const formSpace = document.getElementById("materials-top");
      const plusBtnHtml = `<div class="materials-header">
                            材料
                          </div>
                          <div class="material-plus">
                            <img class="material-plus-btn" src="/assets/add-5499f76785743d53b6b5f198756a4df4ee609d4c0b59280985086a8fc9868cb6.png">
                          </div>
                          <div class="material-delete">
                            <img class="material-minus-btn" src="/assets/minus-60983214532a44e0b159f6ff68a702aafae485029fbbf86e34643b3cd84b3e1a.png">
                          </div>`;
      formSpace.innerHTML = plusBtnHtml;
    }
  })
}

window.addEventListener("load", plus);