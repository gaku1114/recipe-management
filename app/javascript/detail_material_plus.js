function pluss () {
  document.addEventListener("click", (e) => {
    if(e.target.closest(".detail-material-plus")) {
      const formSpace = document.getElementById("detail-materials-top");
      const materialFormHtml = `<form class="detail-material-form" action="/dishes/${gon.dish_id}/materials" accept-charset="UTF-8" method="post">
                                  <input type="text" class="detail-material-new-name" placeholder="材料を追加する"  id="material_name" name="material[name]" autofocus="autofocus">
                                  <input type="submit" name="commit" value="追加" class="detail-material-new-btn" data-disable-with="追加">
                                </form>`;
      formSpace.innerHTML = materialFormHtml;
    }else if(!e.target.closest(".detail-material-form") && gon.materials != '') {
      const formSpace = document.getElementById("detail-materials-top");
      const plusBtnHtml = `<div class="detail-materials-header">
                            材料
                          </div>
                          <div class="detail-material-plus">
                            <img class="detail-material-plus-btn" src="/assets/add-5499f76785743d53b6b5f198756a4df4ee609d4c0b59280985086a8fc9868cb6.png">
                          </div>
                          <div class="detail-material-delete">
                            <img class="detail-material-minus-btn" src="/assets/minus-60983214532a44e0b159f6ff68a702aafae485029fbbf86e34643b3cd84b3e1a.png">
                          </div>`;
      formSpace.innerHTML = plusBtnHtml;
    }else if(!e.target.closest(".detail-material-form") && gon.materials == ''){
      const formSpace = document.getElementById("detail-materials-top");
      const plusBtnHtml = `<div class="detail-materials-header">
                            材料
                          </div>
                          <div class="detail-material-plus">
                            <img class="detail-material-plus-btn" src="/assets/add-5499f76785743d53b6b5f198756a4df4ee609d4c0b59280985086a8fc9868cb6.png">
                          </div>`;
      formSpace.innerHTML = plusBtnHtml;
    }
  })
}

window.addEventListener("load", pluss);