
$(document).ready(function() {
  $('pre code').each(function(i, block) {
    hljs.highlightBlock(block);
  });
});

var ToC =
"<nav role='navigation' class='table-of-contents'>" +
    "<h2>On this page:</h2>" +
"<ul>";

var newLine, self, title, link;

$("#main_content h2").each(function() {

    self = $(this);
    title = self.text();
    link = "#" + self.attr("id");

    newLine = "<li><a href='" + link + "'>" + title + "</a></li>";

    ToC += newLine;

});

ToC += "</ul></nav>";

$(".toc").prepend(ToC);