$(function(){
  $(".accordion-trigger").on("click" ,function(){
      $(this).next().slideToggle();
  });
});   