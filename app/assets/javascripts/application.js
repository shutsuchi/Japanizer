// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery
//= require moment
//= require fullcalendar
//= require bootstrap-datetimepicker
//= require bootstrap-sprockets
//= require_tree .

//-------------------------- DateTimePicker-calendarForm
//var data = {'data-date-format': 'yyyy/MM/dd hh:mm' };
$(function(){
  //$('.datetimepicker').attr(data);
  $(".datetimepicker").datetimepicker({
    //format: 'YYYY/MM/DD hh:mm',
  });
});

//-------------------------- ModalWindow(Delete)

document.addEventListener("DOMContentLoaded", function() {
  let modal_open = document.getElementById('js-modal-open-btn');
  modal_open.onclick = function() {
    $('#js-overlay').fadeIn();
    document.getElementById('js-modal-close-btn').onclick = function() {
      $('#js-overlay').fadeOut();
    };
    document.getElementById("js-delete-confirmation-btn").onclick = function () {
        document.getElementById("js-item-delete-btn").click();
    };
  };
});

//-------------------------- ModalWindow(Album)

document.addEventListener("DOMContentLoaded", function() {
  let modal_open = document.getElementById('js-album-btn');
  modal_open.onclick = function() {
    $('#js-album-modal').fadeIn();
    document.getElementById('js-album-close-btn').onclick = function() {
      $('#js-album-modal').fadeOut();
    };
  };
});

//-------------------------- ModalWindow(Post)

document.addEventListener("DOMContentLoaded", function() {
  let modal_open = document.getElementById('js-post-btn');
  modal_open.onclick = function() {
    $('#js-post-modal').fadeIn();
    document.getElementById('js-post-close-btn').onclick = function() {
      $('#js-post-modal').fadeOut();
    };
  };
});
