$(function(){
  $('.sliders').each(function () {
    const $slides = $(this).find('img')
    const slideCount = $slides.length
    const currentIndexSlide = 0;

    $slides.eq(currentIndexSlide).fadeIn();
    setInterval(showNextSlide, 5000);

    function showNextSlide () {
      const nextIndexSlide = (currentIndexSlide+1)%slideCount;
      $slides.eq(currentIndexSlide).fadeOut();
      $slides.eq(nextIndexSlide).fadeIn();
      currentIndexSlide = nextIndexSlide
    }
  });
});