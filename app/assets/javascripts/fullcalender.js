//---------------------------------------------------//
//                      User                         //
//---------------------------------------------------//

////--------------------------  FullCalendar機能実装
$(function () {
  // 画面遷移を検知
  $(document).on('turbolinks:load', function() {

    if ($('#calendar').length) {

      function eventCalendar() {
        return $('#calendar').fullCalendar({});
      };

      function clearCalendar() {
        $('#calendar').html('');
      };

      $(document).on('turbolinks:load', function() {
        eventCalendar();
      });
      $(document).on('turbolinks:before-cache', clearCalendar);

      var uri = location.href
      if ( uri.includes('ja')) {
        $('#calendar').fullCalendar({

          firstDay : 1,

          header : {
            left : 'prev, next, today',
            center : 'title',
            right : 'month, agendaWeek, agendaDay, listMonth',
          },

          buttonText: {
            today: '今日',
            month: '月',
            week: '週',
            day: '日',
            list: '一覧'
          },

          monthNames: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月'],
          monthNamesShort: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月'],
          dayNames: ['日曜日', '月曜日', '火曜日', '水曜日', '木曜日', '金曜日', '土曜日'],
          dayNamesShort: ['日', '月', '火', '水', '木', '金', '土'],
          /*
          titleFormat: {
            month: 'yyyy年M月',
            week: "yyyy年M月d日{ ~ }{[yyyy年]}{[M月]d日}",
            day: "yyyy年M月d日'('ddd')'"
          },
          */

          editable: true,

          eventLimit: true,
          weekends: true,
          slotDuration: '00:30:00',
          snapDuration: '00:15:00',
          minTime: "00:00:00",
          maxTime: "24:00:00",
          defaultTimedEventDuration: '10:00:00',
          allDaySlot: false,
          allDayText:'allday',
          slotMinutes: 15,
          snapMinutes: 15,
          firstHour: 9,
          navLinks: true,
          selectable: true,
          selectHelper: true,
          dayClick: function(day, jsEvent, view) {
            //jsEvent.preventDefault();
            $('#inputScheduleForm').modal('show');
          },
          //eventClick: function(event) {
          //  var id = event.id
          //  var show_url = "/events/"+id
          //  location.href = show_url;
          eventClick: function(event, jsEvent, view) {
            jsEvent.preventDefault();
            $(`#inputScheduleEditForm${ event.id }`).modal('show');
          },
          eventMouseover: function(event, jsEvent, view) {
            jsEvent.preventDefault();
          },

          timeFormat: "HH:mm",
          eventColor: '#87cefa',
          eventTextColor: '#000000',
          eventRender: function(event, element) {
              element.css("font-size", "0.8em");
              element.css("padding", "5px");
          },
          events: '/events.json'
        });
      } else {
        $('#calendar').fullCalendar({

          firstDay : 1,

          header : {
            left : 'prev, next, today',
            center : 'title',
            right : 'month, agendaWeek, agendaDay, listMonth',
          },

          buttonText: {
            today: 'Today'
          },
          editable: true,

          eventLimit: true,
          weekends: true,
          slotDuration: '00:30:00',
          snapDuration: '00:15:00',
          minTime: "00:00:00",
          maxTime: "24:00:00",
          defaultTimedEventDuration: '10:00:00',
          allDaySlot: false,
          allDayText:'allday',
          slotMinutes: 15,
          snapMinutes: 15,
          firstHour: 9,
          eventClick: function(event) {
            var id = event.id
            var show_url = "/events/"+id
            location.href = show_url;
          },

          timeFormat: "HH:mm",

          eventColor: '#87cefa',

          eventTextColor: '#000000',
          eventRender: function(event, element) {
              element.css("font-size", "0.8em");
              element.css("padding", "5px");
          },
          events: '/events.json'

        });
      }
    }
  });
});


