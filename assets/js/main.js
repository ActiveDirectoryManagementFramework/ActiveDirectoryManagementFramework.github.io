var sectionHeight = function() {
    var total    = $(window).height(),
        $section = $('section').css('height','auto');
  
    if ($section.outerHeight(true) < total) {
      var margin = $section.outerHeight(true) - $section.height();
      $section.height(total - margin - 20);
    } else {
      $section.css('height','auto');
    }
}
var navigationBuilder = function(data) {
    document.getElementById("backToParent").innerHtml = "<a href='" + data.backto.Link + "'>" + data.backto.Label + "</a>";
    $("nav p").each(function(){
        $(this).innerHtml = "<a href='" + data.backto.Link + "'>" + data.backto.Label + "</a>";
    })
    var i;
    for (i = 0; i < data.fellows.length; i++) {
        $("nav ul").append("<li class='tag-h2'><a href='" + data.fellows[i].Link + "'>" + data.fellows[i].Label + "</a></li>");
    }

    sectionHeight();
}
  
$(window).resize(sectionHeight);

$(function() {
    sectionHeight();

    $('img').on('load', sectionHeight);
})
  
$(function() {
    var results = null;
    $.ajax({
        type: 'GET',
        url: 'nav.json',
        dataType: 'json',
        success: navigationBuilder,
        async: true
    });
});