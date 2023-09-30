$(document).ready(function () {
    let delayReferenceCheck = 500;
    if ($('#nav-tab a:first-child').find('input').val() == 'Reference Check') {
        delayReferenceCheck = 0;
    }
    setTimeout(function () {
        $.ajax({
            url: "/Home/PhotoStack",
            type: "GET",
            dataType: "html",
            success: function (data) {
                $('._PhotostackPartial').html(data);
            }, complete: function () {

            }
        });
    }, delayReferenceCheck);
    let delayReferenceCheck1 = 1000;
    if ($('#nav-tab a:first-child').find('input').val() == 'Reference Check') {
        delayReferenceCheck1 = 0;
    }

    setTimeout(function () {
        $.ajax({
            url: "/Home/eventlistPartial",
            type: "GET",
            dataType: "html",
            success: function (data) {
                $('._eventlistPartial').html(data);
            }, complete: function () {

            }
        });
    }, delayReferenceCheck1);

    let delayReferenceCheck2 = 1000;
    if ($('#nav-tab a:first-child').find('input').val() == 'Reference Check') {
        delayReferenceCheck2 = 0;
    }

    setTimeout(function () {
        $.ajax({
            url: "/Home/PrivateTentsPanel",
            type: "GET",
            dataType: "html",
            success: function (data) {
                $('._PrivateTentsPanel').html(data);
            }, complete: function () {

            }
        });
    }, delayReferenceCheck2);

    let delayReferenceCheck3 = 2000;
    if ($('#nav-tab a:first-child').find('input').val() == 'Reference Check') {
        delayReferenceCheck3 = 0;
    }

    setTimeout(function () {
        $.ajax({
            url: "/Home/FoodPanel",
            type: "GET",
            dataType: "html",
            success: function (data) {
                $('._FoodPanel').html(data);
            }, complete: function () {

            }
        });
    }, delayReferenceCheck3);


    let delayReferenceCheck4 = 2000;
    if ($('#nav-tab a:first-child').find('input').val() == 'Reference Check') {
        delayReferenceCheck4 = 0;
    }

    setTimeout(function () {
        $.ajax({
            url: "/Home/DressupandPhotographyPanel",
            type: "GET",
            dataType: "html",
            success: function (data) {
                $('._DressupandPhotographyPanel').html(data);
            }, complete: function () {

            }
        });
    }, delayReferenceCheck4);

    let delayReferenceCheck5 = 3000;
    if ($('#nav-tab a:first-child').find('input').val() == 'Reference Check') {
        delayReferenceCheck5 = 0;
    }

    setTimeout(function () {
        $.ajax({
            url: "/Home/ActivitiesPanel",
            type: "GET",
            dataType: "html",
            success: function (data) {
                $('._ActivitiesPanel').html(data);
            }, complete: function () {

            }
        });
    }, delayReferenceCheck5);

    let delayReferenceCheck6 = 3000;
    if ($('#nav-tab a:first-child').find('input').val() == 'Reference Check') {
        delayReferenceCheck6 = 0;
    }

    setTimeout(function () {
        $.ajax({
            url: "/Home/EntertainmentPanel",
            type: "GET",
            dataType: "html",
            success: function (data) {
                $('._EntertainmentPanel').html(data);
            }, complete: function () {

            }
        });
    }, delayReferenceCheck6);


    let delayReferenceCheck7 = 3000;
    if ($('#nav-tab a:first-child').find('input').val() == 'Reference Check') {
        delayReferenceCheck7 = 0;
    }

    setTimeout(function () {
        $.ajax({
            url: "/Home/InformationPanel",
            type: "GET",
            dataType: "html",
            success: function (data) {
                $('._InformationPanel').html(data);
            }, complete: function () {

            }
        });
    }, delayReferenceCheck7);
})