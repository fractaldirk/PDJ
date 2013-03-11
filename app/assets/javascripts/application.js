// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require home

$(document).ready(
  function() {
    setInterval(function() {
      $('.accepted_songs').load('/home/reload');
  }, 3000);
});

$(document).ready(
  function() {
    setInterval(function() {
      $('.latest_songs').load('/home/reloadlatestsongs');
  }, 3000);
});

$(document).ready(
  function() {
    setInterval(function() {
      $('.top_songs').load('/home/reloadtopsongs');
  }, 3000);
});

$(document).ready(
  function() {
    setInterval(function() {
      $('.marquee').load('/home/marquee');
  }, 3000);
});

$(document).ready(
  function() {
    setInterval(function() {
      $('.activity').load('/home/activity');
  }, 3000);
});
