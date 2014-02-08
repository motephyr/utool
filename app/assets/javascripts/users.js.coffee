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

$("[class='btn btn-link']").each(() ->
  a = $(this)[0];
  if $(a).attr("href") == decodeURI(location.pathname + location.search)
    $(this).addClass("active");
  else
    $(this).removeClass("active");
);


#如何在js.coffee依身分決定可排列？
$("#sortable").sortable({
  start:(event, ui) ->
    ui.item.startPos = ui.item.index();
    
  stop:(event, ui ) -> 
    id = $(ui.item).attr('id').split("_")[1]
    position = ui.item.index()
    $.post "/links/list_insert.json?id=#{id}&position=#{position}", -> (data)
});
$("#sortable").disableSelection();
