# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(".nav-collapse").find("li").each(() ->
  a = $(this).find("a:first")[0];
  if $(a).attr("href") == location.pathname
    $(this).addClass("active");
  else
    $(this).removeClass("active");
);
