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
//= require jquery
//= require_tree .

$(document).ready(function() {
  $('.section').on('click', '.button', function() {
    $(this).parent().find('.section-text').slideToggle();
  });
  $('.section').on('keydown', '.button', function(event) {
    if (event.keyCode === 13) {
      $(this).parent().find('.section-text').slideToggle();
    };
  });
  $('.method').on('click', 'button', function() {
    $(this).parent().find('.method-section').slideToggle();
  });
});
