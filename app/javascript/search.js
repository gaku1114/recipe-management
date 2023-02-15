function search () {
  document.addEventListener("click", (e) => {
    if(!e.target.closest('#search-form-space')) {
      const formSpace = document.getElementById("search-form-wrapper");
      const clickFormHtml = `<button id="search-form-space">料理名で検索する</button>`
      formSpace.innerHTML = clickFormHtml;
    }else {
      const formSpace = document.getElementById("search-form-wrapper");
      const dishNameFormHtml = `<form class="dish_search" id="search-form" action="/dishes/search" accept-charset="UTF-8" method="get">
                                  <div class="search-field"><input placeholder="料理名で検索" type="text" name="q[dish_name_cont]" id="q_dish_name_cont"></div>
                                  <div class="search-btn"><input type="submit" name="commit" value="検索" data-disable-with="検索"></div>
                                </form>`;
      formSpace.innerHTML = dishNameFormHtml;
    }
  })
}

window.addEventListener("load", search)