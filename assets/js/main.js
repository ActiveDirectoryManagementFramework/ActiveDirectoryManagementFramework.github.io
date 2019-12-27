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
    document.getElementById("backToParent").innerHtml = "<a href='" + results.BackTo.Link + "'>" + results.BackTo.Label + "</a>";
    var i;
    for (i = 0; i < results.fellows.length; i++) {
        $("nav ul").append("<li class='tag-h2'><a href='" + results.fellows[i].Link + "'>" + results.fellows[i].Label + "</a></li>");
    }
  
    sectionHeight();
  });