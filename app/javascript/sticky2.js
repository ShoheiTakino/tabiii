$(function() {
  $('.page-header').each(function (){
    const $window2 = $(window)
    const $header2 = $(this)
    const headerOffsetTop2 = $header2.offset().top;

    $window2.on('scroll', function (){
      if ($window2.scrollTop() > headerOffsetTop2) {
        $header2.addClass('sticky');
      } else {
        $header2.removeClass('sticky');
      }
    });
    $window2.trigger('scroll');
  });
});