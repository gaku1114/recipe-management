function d () {
  document.addEventListener("click", (e) => {
    if(e.target.closest(".material-delete")) {
      const space = document.getElementById("space");
      var html = "";

      for (var i = 0; i < gon.materials_id.length; i++) {
        var html = html + `<div class="material-border">
                          <div class="materials-list">
                            <li class="material_li"><a class="material-search_link"  href="/dishes/search?q%5Bmaterials_name_cont%5D=${gon.materials_name[i]}">${gon.materials_name[i]}</a></li>
                            <li class="material-d_li"><a class="material-delete_link" data-confirm="${gon.materials_name[i]}を削除しますか？" data-method="delete" href="/dishes/${gon.dish_id}/materials/${gon.materials_id[i]}"><img class="material-delete-btn" src="/assets/delete_icon-325e6d32168fd42dbe0e35866526c3a2c2de454adb61ef7856cf573623698f83.png"></a></li>
                          </div>
                        </div>`;
      };
      space.innerHTML = html;
    }else if(!e.target.closest(".material-delete_link")) {
      const space = document.getElementById("space");
      var html = "";

      for (var i = 0; i < gon.materials_id.length; i++) {
        var html = html + `<div class="material-border">
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