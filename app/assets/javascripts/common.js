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

