<<<<<<< HEAD
$(function(){
    $('.tagCloud').tagCloud();
});
=======

$(document).ready(function() {
    categoryDisplay();
});

function categoryDisplay() {
    selectCategory();
    $('.categories-item').click(function() {
        window.location.hash = "#" + $(this).attr("cate");
        selectCategory();
    });
}

function selectCategory(){
    var exclude = ["",undefined];
    var thisId = window.location.hash.substring(1);
    var allow = true;
    for(var i in exclude){
        if(thisId == exclude[i]){
            allow = false;
            break;
        }
    }

    if(allow){
        var cate = thisId;
        $("section[post-cate!='" + cate + "']").hide(200);
        $("section[post-cate='" + cate + "']").show(200);
    } else {
        $("section[post-cate!='All']").hide();
        $("section[post-cate='All']").show();
    }
}
>>>>>>> c0854a4f45e67e3799fbe293e8de39f4e107ca74
