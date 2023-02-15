function search () {
  document.addEventListener("click", (e) => {
    if(e.target.closest("#dish-name-search")) {
      const formSpace = document.getElementById("search-form-wrapper");
      const dishNameFormHtml = `<form class="dish_search" id="name-search-form" action="/dishes/search" accept-charset="UTF-8" method="get">
                                  <div><input placeholder="料理名で検索" type="text" name="q[dish_name_cont]" id="q_dish_name_cont"  class="search-field"></div>
                                  <div><input type="submit" name="commit" value="検索" data-disable-with="検索" id="name-search-btn" class="search-btn"></div>
                                </form>`;
      formSpace.innerHTML = dishNameFormHtml;
    }else if(e.target.closest("#material-search")) {
      const formSpace = document.getElementById("search-form-wrapper");
      const materialFormHtml = `<form class="dish_search" id="material-search-form" action="/dishes/search" accept-charset="UTF-8" method="get">
                                  <div><input placeholder="商品名" type="text" name="q[materials_name_cont]" id="q_materials_name_cont"  class="search-field"></div>
                                  <div><input type="submit" name="commit" value="検索" data-disable-with="検索"  class="search-btn"></div>
                                </form>`;
      formSpace.innerHTML = materialFormHtml;
    }else if(!e.target.closest("#name-search-form") && !e.target.closest("#material-search-form")) {
      const formSpace = document.getElementById("search-form-wrapper");
      const searchBtnHtml = `<button id="dish-name-search">料理名で検索する</button>
                              <button id="material-search">材料で検索する</button>`;
      formSpace.innerHTML = searchBtnHtml;
    }
  })
}

window.addEventListener("load", search);