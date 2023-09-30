
$(window).on("load", function () {
    $('.masonry-gallery').fadeIn();
    var $container = $('.masonry-gallery').isotope({
        itemSelector: '.isotope-item',
        layoutMode: 'masonry',
        transitionDuration: '0.6s',
        filter: "*"
    });
    $('.masonry-grid').isotope({
        itemSelector: '.masonry-grid-item',
        layoutMode: 'masonry'
    });
    $('.masonry-grid-fitrows').isotope({
        itemSelector: '.masonry-grid-item',
        layoutMode: 'fitRows'
    });
    // filter items on button click
    $('.masonry-filter').on('click', 'li a', function () {
        var filterValue = $(this).attr('data-filter');
        $(".masonry-filter").find("a.active").removeClass("active");
        $(this).parent().addClass("active");
        $container.isotope({ filter: filterValue });
        return false;
    });

})
function SortByGallleryid(Sortid, MediaFor) {
    debugger
    $.ajax({
        type: 'post',
        url: '/Home/VideoSorting',
        datatype: 'HTML',
        data: { ListId: Sortid, MediaFor: MediaFor },
        success: function (data) {
            $('#PartialVideos').html(data);
        },
        error: function () {

        }
    })
}


function SortByGalllery(Sortid, MediaFor) {
    debugger
    $.ajax({
        type: 'post',
        url: '/Home/ImagesSorting',
        datatype: 'HTML',
        data: { ListId: Sortid, MediaFor: MediaFor },
        success: function (data) {
            $('#PartialImages').html(data);
        },
        error: function () {

        }
    })
}


$(document).ready(function () {
 
    $(document).on("click", ".arrowleft", function () {
        var current = $("#photostack-3").find("nav span.current");
        current.prev().trigger("click")
    })
    $(document).on("click", ".arrowright", function () {
        var current = $("#photostack-3").find("nav span.current");
        current.next().trigger("click")
    })
})



//Form Script

$('.showspecific').change(function () {
    $(this).parent().siblings(".specifydiv").toggleClass("hidden")
})
$(".hollowBtn").click(function () {
    if ($(this).hasClass("selected")) {
        $(this).parents(".BTnSelection").find(".hollowBtn").removeClass("selected")
        $(this).parents(".BTnSelection").find(".specifydiv").addClass("hidden")
    } else {
        if ($(this).hasClass("othrbtn")) {
            $(this).parents(".BTnSelection").find(".hollowBtn").removeClass("selected")
            $(this).addClass("selected")
            $(this).siblings(".specifydiv").removeClass("hidden")

        } else {
            $(this).parents(".BTnSelection").find(".hollowBtn").removeClass("selected")
            $(this).addClass("selected")
            $(this).parents(".BTnSelection").find(".specifydiv").addClass("hidden")

        }
    }
})
$(".hollowBtn1").click(function () {
    if ($(this).hasClass("selected")) {
        $(this).parents(".BTnSelection1").find(".hollowBtn1").removeClass("selected")
        $(this).parents(".BTnSelection1").find(".specifydiv").addClass("hidden")
    } else {
        if ($(this).hasClass("othrbtn")) {
            $(this).parents(".BTnSelection1").find(".hollowBtn1").removeClass("selected")
            $(this).addClass("selected")
            $(this).siblings(".specifydiv").removeClass("hidden")

        } else {
            $(this).parents(".BTnSelection1").find(".hollowBtn1").removeClass("selected")
            $(this).addClass("selected")
            $(this).parents(".BTnSelection1").find(".specifydiv").addClass("hidden")

        }
    }
})
$(".submitBtn").on('click', function () {
    
    $('#submitBtn').prop('disabled', true);
    var arrray = [];
    var FullNamecheck = true;
    var StatusAndLivestream = true;
    var Emailinputcheck = true;
    var consentcheck = true;

    if ($(".FullName").val() == "") {

        $(".FullName").siblings("small").text("Name is required *")
        FullNamecheck = false;
    } else {
        $(".FullName").siblings("small").text("");
    }
   debugger
    if ($(".Emailinput").val() == "" && $(".phonemask").val() == "") {
        $(".Emailinput").siblings("small").text("Email or Phone number is required *")
        Emailinputcheck = false;
    } else {
        $(".Emailinput").siblings("small").text("")

    }
    
    if ($("#consent").prop("checked") != true) {
        $("#consent").parent().siblings("small").text("Required *").focus()
        consentcheck = false;
    }
    else {
        $("#consent").parent().siblings("small").text("")
    }
    var Located = null;
    $(".hollowBtn.selected").each(function () {
       
        if ($(this).attr("valueAttr") == "Other") {
            Located = $('.stateInputValue').val();
        } else {

            Located = $(this).attr("valueAttr");
        }
    })
    var HearAbout = null;
    $(".hollowBtn1.selected").each(function () {
       
        if ($(this).attr("valueAttr") == "Other") {
            HearAbout = $('.socialInputValue').val();
        } else {

            HearAbout = $(this).attr("valueAttr");
        }
    })
    var statusofticket = false;
    if ($(".statusofticket").is(":checked")) {
        statusofticket = true;
    }
    var LiveStreamEvent = false;
    if ($(".LiveStreamEvent").is(":checked")) {
        LiveStreamEvent = true;
    }


    debugger
    if (statusofticket == false && LiveStreamEvent == false) {
        debugger
        $(".LiveStreamEvent").siblings("small").text("Status of Ticket or Free Livestream Event is required *")
        StatusAndLivestream = false;
    } else {
        $(".LiveStreamEvent").siblings("small").text("")

    }

    var FullName = $('.FullName').val();
    /*var LastName = $('.LastName').val();*/
    var Emailinput = $('.Emailinput').val();
    var phonemask = $('.phonemask').val();

    var fileData = new FormData();
    fileData.append("statusofticket", statusofticket);
    fileData.append("LiveStreamEvent", LiveStreamEvent);
    fileData.append("FirstName", FullName);
    //fileData.append("LastName", LastName);
    fileData.append("Email", Emailinput);
    fileData.append("phone", phonemask);
    fileData.append("Located", Located);
    fileData.append("HearAbout", HearAbout);

    if (FullNamecheck == true && Emailinputcheck == true && consentcheck == true && StatusAndLivestream == true ) {
        $.ajax({
            type: 'Post',
            data: fileData,
            contentType: false, // Not to set any content header
            processData: false,
            async: false,
            url: '/StatusUpdate/SaveStatusUpdateAndLivestream',
            beforeSend: function () {

            },
            success: function (result) {
                if (result) {
                    
                    //swal("Thanks!", "You enquiry has been received and we will get back to you.", "success");
                   
                    swal({
                        title: "Thank you.",
                        //text: "You enquiry has been received and we will get back to you.",
                        icon: "success",
                        button: "OK",
                    })
                        .then(() => {
                            window.location.href = "/Home/Index"
                        });
                   
                    
                    $('#submitBtn').prop('disabled', false);
                    //$("#UpdateandLiveStreamEvent").load(location.href + " #UpdateandLiveStreamEvent");
                }
                else {
                    alert("You enquiry has not been received. Please try Again.");
                    swal("Sorry!", "Please try Again.", "error");
                }
            },
            error: function (xhr) {
                $('#submitBtn').prop('disabled', false);
            },
            complete: function () {
            }

        });
    }
    else {
        $('#submitBtn').prop('disabled', false);
        return false;
    }


})