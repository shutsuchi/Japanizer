//---------------------------------------------------//
//                      Album                        //
//---------------------------------------------------//

//-------------------------- Album-NewPage-Image
$(document).on('click', '.image_upload', function(){

  var preview = $('<div class="image-preview__wapper"><img class="preview"></div></div>');
  $ul = $('#previews')
  $li = $(this).parents('li');
  $label = $(this).parents('.upload-label');
  $inputs = $ul.find('.image_upload');

  $('.image_upload').on('change', function (e) {
    var reader = new FileReader();


    reader.readAsDataURL(e.target.files[0]);

    reader.onload = function(e){
      $(preview).find('.preview').attr('src', e.target.result);
    }

    $li.append(preview);

    $li.removeClass('input');
    $li.addClass('image-preview');
    $lis = $ul.find('.image-preview');
    $('#previews li').css({
      'width': '114px'
    })
  });
});
