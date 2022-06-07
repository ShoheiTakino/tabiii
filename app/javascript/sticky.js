$(function() {
  $('.top-page-header').each(function (){
    const $window = $(window)
    const $header = $(this)
    const headerOffsetTop = $header.offset().top;

    $window.on('scroll', function (){
      if ($window.scrollTop() > headerOffsetTop) {
        $header.addClass('sticky');
      } else {
        $header.removeClass('sticky');
      }
    });
    $window.trigger('scroll');
  });
});