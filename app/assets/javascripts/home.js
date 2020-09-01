//-------------------------- Navopen-toppage
$(function() {
  $('#js-toggle-menu').click(function() {
    $('.search-select-boxes__toggle-menu').slideToggle();
  });
});
$(function() {
  $('#js-toggle-menu2').click(function() {
    $('.search-select-boxes__toggle-menu2').slideToggle();
  });
});
$(function() {
  $('#js-toggle-menu3').click(function() {
    $('.search-select-boxes__toggle-menu3').slideToggle();
  });
});
$(function() {
  $('#js-toggle-menu-rank').click(function() {
    $('.search-select-boxes__toggle-menu-rank').slideToggle();
  });
});

//-------------------------- Navopen-aboutpage
function toggleNav() {

  document.addEventListener("DOMContentLoaded", function() {
    document.getElementById('js-menu-btn').addEventListener('click', function() {
      document.body.classList.toggle('nav-open');
    });
    document.getElementById('js-black-bg').addEventListener('click', function() {
      document.body.classList.remove('nav-open');
    });
    document.getElementById('js-close').addEventListener('click', function() {
      document.body.classList.remove('nav-open');
    });
  });

}
toggleNav();


//-------------------------- Slide-show
$(document).ready(function() {

  // id generator
  function idGenerator() {
    $(".slides-img").each(function(index, el) {
      $(this).attr("id", "slide_" + index);
    });
    $(".dots__single").each(function(index, el) {
      $(this).attr("id", "dot_" + index);
    });
  }

  // id extractor
  // at the end it focuses the current dot
  function dotsFocus() {
    $("[id^='dot_']").removeClass("dots-current");
    var id = $(".slides-img:eq(1)").attr("id");
    var n = Number(id.substr(-1));
    if (n === 0) {
      n = $(".slides-img").length;
    }
    $("#dot_" + (n - 1)).addClass("dots-current");
  }
  // slide up caption
  function captionSlideUp(d, e) {
    var $cap1 = $(".slide-caption:eq(1)");
    $cap1.animate(
      {
        bottom: "20%",
        opacity: 1
      },
      {
        duration: d,
        easing: e,
        complete: dotsFocus()
      }
    );
  }

  // slide down caption
  function captionSlideDown(d, e) {
    $(".slide-caption").animate(
      {
        bottom: "5%",
        opacity: 0
      },
      {
        duration: d,
        easing: e
      }
    );
  }

  // slide movement
  function slideMove(t) {
    if (t === "prev") {
      return $(".slides-img")
        .first()
        .before($(".slides-img").last());
    }
    if (t === "next") {
      return $(".slides-img")
        .last()
        .after($(".slides-img").first());
    }
  }

  // slide images
  function slideIt(l, d, e, t) {
    var $slides = $(".slides");
    captionSlideDown(150, "linear");
    $slides.animate(
      {
        left: l
      },
      {
        duration: d,
        easing: e,
        complete: function() {
          $slides.css("left", "-100%");
          slideMove(t);
          captionSlideUp(1700, "swing");
        }
      }
    );
  }

  // slide with dots
  function dotsControl(d, e) {
    $(".dots__single").click(function() {
      var currentId = parseInt(
        $(".dots-current")
          .attr("id")
          .substr(-1)
      );
      var clickId = parseInt(
        $(this)
          .attr("id")
          .substr(-1)
      );
      var max = $(".dots__single").length - 1;
      var half = Math.floor($(".dots__single").length / 2);
      var diff;
      if (currentId > clickId) {
        diff = currentId - clickId;
        if (diff === max) {
          diff = 1;
          l = "-200%";
          t = "next";
        } else if (diff <= half) {
          l = "0%";
          t = "prev";
        } else {
          diff--;
          l = "-200%";
          t = "next";
        }
      }
      if (currentId < clickId) {
        diff = clickId - currentId;
        if (diff === max) {
          diff = 1;
          l = "0%";
          t = "prev";
        } else if (diff <= half) {
          l = "-200%";
          t = "next";
        } else {
          diff--;
          l = "0%";
          t = "prev";
        }
      }
      for (var i = 0; i < diff; i++) {
        slideIt(l, d, e, t);
      }
    });
  }

  // slideshow
  function slideShow(d, e) {
    $("#prev").click(function() {
      var t = $(this).attr("id");
      slideIt("0%", d, e, t);
    });
    $("#next").click(function() {
      var t = $(this).attr("id");
      slideIt("-200%", d, e, t);
    });
    dotsControl(d, e);
  }

  idGenerator();
  captionSlideUp(1700, "swing");
  slideShow(800, "swing");
});
