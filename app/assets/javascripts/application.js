// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require_tree .

function round(value, decimals) {
  return Number(Math.round(value+'e'+decimals)+'e-'+decimals);
};

function showPart1() {
  $('.part-1').show();
  $('.part-2').hide();
  $('.part-3').hide();
  $('#nav-location').addClass('active')
  $('#nav-consumption').removeClass('active')
  $('#nav-system').removeClass('active')
}

function showPart2() {
  $('.part-1').hide();
  $('.part-2').show();
  $('.part-3').hide();
  $('#nav-location').removeClass('active')
  $('#nav-consumption').addClass('active')
  $('#nav-system').removeClass('active')
}

function showPart3() {
  $('.part-1').hide();
  $('.part-2').hide();
  $('.part-3').show();
  $('#nav-location').removeClass('active')
  $('#nav-consumption').removeClass('active')
  $('#nav-system').addClass('active')
}

function calculateArraySize() {
  var monthlyConsumption = [];
  $(".data-table").find("input").each(function() {
    monthlyConsumption.push($(this).val());
  });
  monthlyConsumption.sort(function(a,b) {
    return a - b;
  });
  monthlyConsumption.reverse();
  var arraySize = monthlyConsumption[0] * 0.007670;
  return round(arraySize, 1);
};

$(document).ready(function() {
  $('.part-1').on('click', '.to-step-2', function() {
    showPart2()
  });
  $('.part-1').on('keydown', '.to-step-2', function() {
    if (event.keyCode === 13) {
      showPart2()
    };
  });
  $('.part-2').on('click', '.to-step-3', function() {
    $("#system-capacity").val(calculateArraySize())
    showPart3()
  });
  $('.part-2').on('keydown', '.to-step-3', function() {
    if (event.keyCode === 13) {
      showPart3()
    };
  });
  $('#nav-location').on('click', function(){
    showPart1()
  });
  $('#nav-consumption').on('click', function(){
    showPart2()
  });
  $('#nav-system').on('click', function(){
    showPart3()
  });

  $('.section').on('click', '.button', function() {
    $(this).parent().find('.section-text').slideToggle();
  });
  $('.section').on('keydown', '.button', function(event) {
    if (event.keyCode === 13) {
      $(this).parent().find('.section-text').slideToggle();
    };
  });
  //
  // $('.method').on('click', '.button', function() {
  //   $(this).parent().find('.method-section').slideToggle();
  // });
  // $('.method').on('keydown', '.button', function() {
  //   if (event.keyCode === 13) {
  //     $(this).parent().find('.method-section').slideToggle();
  //   };
  // });
});
