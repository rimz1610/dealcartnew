if (($(".popup-img").length > 0) || ($(".mfp-iframe").length > 0) || ($(".mfp-img-single").length > 0)) {
    $(".popup-img").magnificPopup({
        type: "image",
        gallery: {
            enabled: true,
        }
    });
    $(".mfp-img-single").magnificPopup({
        type: "image",
        gallery: {
            enabled: false,
        }
    });
    $('.mfp-iframe').magnificPopup({
        disableOn: 700,
        type: 'iframe',
        preloader: false,
        fixedContentPos: false
    });
    $('.mfp-youtube, .mfp-vimeo, .mfp-gmaps').magnificPopup({
        disableOn: 200,
        type: 'iframe',
        mainClass: 'mfp-fade',
        removalDelay: 160,
        preloader: false,
        fixedContentPos: false,
        iframe: {
            patterns: {
                youtube: {
                    src: '//www.youtube.com/embed/%id%?autoplay=1&rel=0'
                }
            }
        }
    });
    $('.mfp-youtube, .mfp-vimeo').on('click', function (e) {
        return false;
    });
};