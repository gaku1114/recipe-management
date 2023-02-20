function dd () {
  document.addEventListener("click", (e) => {
    if(e.target.closest(".detail-material-delete")) {
      const space = document.getElementById("detail-s");
      var html = "";

      for (var i = 0; i < gon.materials_id.length; i++) {
        var html = html + `<div class="detail-material-border">
                            <div class="detail-materials-list">
                              <li class="detail-material_li">${gon.materials_name[i]}</li>
                              <li class="detail-material-d_li"><a class="detail-material-delete_link" data-confirm="${gon.materials_name[i]}を削除しますか？" data-method="delete" href="/dishes/${gon.dish_id}/materials/${gon.materials_id[i]}"><img class="detail-material-delete-btn" src="/assets/delete_icon-325e6d32168fd42dbe0e35866526c3a2c2de454adb61ef7856cf573623698f83.png"></a></li>
                            </div>
                          </div>`;
      };
      space.innerHTML = html;
    }else if(!e.target.closest(".detail-material-delete_link")) {
      const space = document.getElementById("detail-s");
      var html = "";

      for (var i = 0; i < gon.materials_id.length; i++) {
        var html = html + `<div class="detail-material-border">
                            <div class="detail-materials-list">
                              <li class="detail-material_li">${gon.materials_name[i]}</li>
                            </div>
                          </div>`;
      };
      space.innerHTML = html;
    }
  })
}

window.addEventListener("load", dd);