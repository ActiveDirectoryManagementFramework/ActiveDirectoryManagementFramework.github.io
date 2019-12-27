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
        success: function(data) { results = data; },
        async: false
    });
    $("nav p").innerHtml = "<a href='" + results.BackTo.Link + "'>" + results.BackTo.Label + "</a>";
    results.fellows.each(function(){
        $("nav ul").append("<li class='tag-h2'><a href='" + $(this).Link + "'>" + $(this).Label + "</a></li>");
    })
  
    sectionHeight();
  });