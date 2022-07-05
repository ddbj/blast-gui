jQuery(function() {
    var totop = jQuery('.totop');    
    totop.hide();
    jQuery(window).scroll(function () {
        //スタートスクロール量 1000
        if (jQuery(this).scrollTop() > 200) totop.fadeIn(); else totop.fadeOut();
    });
    totop.click(function () {
        //スクロール速度 500
        jQuery('body,html').animate({scrollTop: 0}, 500); return false;
    });
});
