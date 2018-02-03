
var source   = $("#entry-template").html();
var template = Handlebars.compile(source);

var context = { title: "Собаке Качалова" };
var html    = template(context);

$(document).ready(function() {
    $('pre code').each(function(i, block) {
        hljs.highlightBlock(block);
    });
});

var ToC =
"<nav role='navigation' class='table-of-contents'>" +
"<ul class=\"multi\">";

var newLine, self, title, link;

$(".site-main h3").each(function() {

    self = $(this);
    title = self.text();
    link = "#" + self.attr("id");

    newLine = "<li><a href='" + link + "'>" + title + "</a></li>";

    ToC += newLine;

});

ToC += "</ul></nav>";

$(".toc").prepend(ToC);

var here = location.href.split('/').slice(3);

newLine = '<li><a href="../">Home</a></li>';

for( var i = 0; i < here.length; i++ ) {
    var part = here[i];
    var text = part.toUpperCase();

    var link = '/' + here.slice( 0, i + 1 ).join('/');

    if ( /(HTML)*$/.test(text) ){
        text = text.split('.')[0];
    }

    newLine += "<li><a href='" + link + "'>" + text + "</a></li>";
}

$(".breadcrumbs").prepend(newLine);
