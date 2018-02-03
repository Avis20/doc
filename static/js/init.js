
$(function() {
    
    $("#wrapper").load("/doc/source/templates/header.html", function() {
        var template    = Handlebars.compile( $("#entry-template").html() ),
            content     = $("#content").html(),
            date        = $("#data").attr("date"),
            title       = $("#data").attr("title"),
            html        = template({ title: title, author: "Orlov Yaroslav", date: date, content: content });

        $("#content").html(html);
        $("#date").remove();

        $(".toc").load("/doc/pages/tree.html", function(){
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
        });

    });

    $('pre code').each(function(i, block) {
        hljs.highlightBlock(block);
    });

});

