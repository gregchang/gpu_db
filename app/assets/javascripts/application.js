// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require tether
//= require bootstrap

// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require tether
//= require bootstrap
//= require_tree .

$(document).ready(function () {

    // var lengthtext1;
    // var lengthtext2;
    // var widthtext1;
    // var widthtext2;
    // var heighttext1;
    // var heighttext2;
    //
    //
    // $("#model_select1").change(function () {
    //     var selected_model_name1 = $(this).find("option:selected").text();
    //     var imgurl1 = $(this).find("option:selected").attr("url");
    //     lengthtext1 = $(this).find("option:selected").attr("length");
    //     widthtext1 = $(this).find("option:selected").attr("width");
    //     heighttext1 = $(this).find("option:selected").attr("height");
    //     var backplatetext = $(this).find("option:selected").attr("backplate");
    //
    //     if (backplatetext == 1) {
    //         backplatetext = '&#x2713;';
    //     }
    //     else if (backplatetext == 0){
    //         backplatetext = '&#x2717;';
    //     }
    //
    //     if (selected_model_name1 != "") {
    //
    //         $("#specloc1").replaceWith('<p id="specloc1"><img src="' + imgurl1 + '"><p id="length1">Length: ' + lengthtext1 + ' mm</p><p id="width1">Width: ' + widthtext1 + ' mm</p><p id="height1">Height: ' + heighttext1 + ' mm</p><p>Backplate: ' + backplatetext + '</p></p>');
    //
    //     }
    // })
    //
    // $("#model_select2").change(function () {
    //     var selected_model_name2 = $(this).find("option:selected").text();
    //     var imgurl2 = $(this).find("option:selected").attr("url");
    //     lengthtext2 = $(this).find("option:selected").attr("length");
    //     widthtext2 = $(this).find("option:selected").attr("width");
    //     heighttext2 = $(this).find("option:selected").attr("height");
    //     var backplatetext = $(this).find("option:selected").attr("backplate");
    //
    //     if (backplatetext == 1) {
    //         backplatetext = '&#x2713;';
    //     }
    //     else if (backplatetext == 0){
    //         backplatetext = '&#x2717;';
    //     }
    //
    //     if (selected_model_name2 != "") {
    //
    //         $("#specloc2").replaceWith('<p id="specloc2"><img src="' + imgurl2 + '"><p id="length2">Length: ' + lengthtext2 + ' mm</p><p id="width2">Width: ' + widthtext2 + ' mm</p><p id="height2">Height: ' + heighttext2 + ' mm</p><p>Backplate: ' + backplatetext + '</p></p>');
    //
    //     }
    //
    //     if (lengthtext1 < lengthtext2) {
    //         $("#length1").css("background-color", "#00FF00");
    //     }
    //     else if (lengthtext2 < lengthtext1) {
    //         $("#length2").css("background-color", "#00FF00");
    //     }
    //
    //     if (widthtext1 < widthtext2) {
    //         $("#width1").css("background-color", "#00FF00");
    //     }
    //     else if (widthtext2 < widthtext1) {
    //         $("#width2").css("background-color", "#00FF00");
    //     }
    //
    //     if (heighttext1 < heighttext2) {
    //         $("#height1").css("background-color", "#00FF00");
    //     }
    //     else if (heighttext2 < heighttext1) {
    //         $("#height2").css("background-color", "#00FF00");
    //     }
    //
    // })

    $('#table_id').DataTable();

    $('[data-toggle="tooltip"]').tooltip({
        html: true
    });



});
