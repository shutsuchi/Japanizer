//---------------------------------------------------//
//                    Common                         //
//---------------------------------------------------//

////--------------------------  検索バー表示機能実装
$(function() {
  $('#search-bar').hide();

  $('#search-icon').click(function() {
    $('#search-bar').slideToggle();
  });
});
//function toggleBar() {
//
//  document.addEventListener('DOMContentLoaded', function() {
//    bar = document.getElementById('js-search-bar');
//    icon = document.getElementById('js-search-icon');
//
//    bar.hide();
//    icon.addElementListener('click', function() {
//      $('this').slideToggle();
//    });
//  });
//}
//toggleBar();
////--------------------------  ページネーション
//$(function() {
//  search = location.search
//
//  if ( search.indexOf("?other") == 0 ) {
//    $('#tab_a').removeClass('active');
//    $('#menu_a').removeClass('active');
//
//    $('#tab_b').addClass('active');
//    $('#menu_b').addClass('active');
//  }
//
//});

