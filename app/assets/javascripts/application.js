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


// FullCalendar機能実装
$(function () {
  // 画面遷移を検知
  $(document).on('turbolinks:load', function() {
    // lengthを呼び出すことで、#calendarが存在していた場合は、trueの処理がなされ、ない場合はnillを返す
    if ($('#calendar').length) {
      // FullCalendar読み込み
      function eventCalendar() {
        return $('#calendar').fullCalendar({});
      };
      // FullCalendar削除-turbolinkの高速ページ遷移による複数回表示を避けるため
      function clearCalendar() {
        $('#calendar').html('');
      };
      // カレンダー呼び出し
      $(document).on('turbolinks:load', function() {
        eventCalendar();
      });
      $(document).on('turbolinks:before-cache', clearCalendar);

      // 月曜始まり
      $('#calendar').fullCalendar({
        firstDay : 1,
      // ヘッダー整形
        header : {
          left : 'prev, next, today',
          center : 'title',
          right : 'month, agendaWeek, agendaDay, listMonth',
        },
      });

      // イベント表示
      $('#calendar').fullCalendar({
          events: '/events.json'
      });
    }
  });
});


// DateTimePicker-calendarForm
var data = {'data-date-format': 'YYYY-MM-DD hh:mm' };
$(function(){
  $('.datetimepicker').attr(data);
  $('.datetimepicker').datetimepicker({
    format: 'YYYY-MM-DD hh:mm',
  });
});
