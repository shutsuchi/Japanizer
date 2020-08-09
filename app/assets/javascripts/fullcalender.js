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

      $('#calendar').fullCalendar({

        firstDay : 1,

        header : {
          left : 'prev, next, today',
          center : 'title',
          right : 'month, agendaWeek, agendaDay, listMonth',
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
  });
});


//-------------------------- DateTimePicker-calendarForm
var data = {'data-date-format': 'YYYY-MM-DD hh:mm' };
$(function(){
  $('.datetimepicker').attr(data);
  $('.datetimepicker').datetimepicker({
    format: 'YYYY-MM-DD hh:mm',
  });
});

