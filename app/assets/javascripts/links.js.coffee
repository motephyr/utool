# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$("[class='btn btn-link']").each(() ->
  a = $(this)[0];
  if $(a).attr("href") == decodeURI(location.pathname + location.search)
    $(this).addClass("active");
  else
    $(this).removeClass("active");
);