function d () {
  document.addEventListener("click", (e) => {
    if(e.target.closest(".material-delete")) {
      const space = document.getElementById("space");
      var html = "";

      for (var i = 0; i < gon.materials_id.length; i++) {
        var html = html + `<div id="material-border">
                            <div id="materials-list">
                              <li class="material_li_sub">${gon.materials_name[i]}</li>
                              <li class="material-d_li"><a class="material-delete_link"  data-method="delete" href="/dishes/${gon.dish_id}/materials/${gon.materials_id[i]}">削除</a></li>
                            </div>
                          </div>`;
      };
      space.innerHTML = html;
    }else if(!e.target.closest(".material-delete_link")) {
      const space = document.getElementById("space");
      var html = "";

      for (var i = 0; i < gon.materials_id.length; i++) {
        var html = html + `<div id="material-border">
                            <div class="materials-list">
                              <li class="material_li"><a class="material-search_link" href="/dishes/search?q%5Bmaterials_name_cont%5D=${gon.materials_name[i]}">${gon.materials_name[i]}</a></li>
                            </div>
                          </div>`;
      };
      space.innerHTML = html;
    }
  })
}

window.addEventListener("load", d);