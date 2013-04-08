# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


jQuery ->

  Morris.Line
    element: 'songs_chart'
    data: $('#songs_chart').data('songs')
    xkey: ['created_at']
    ykeys: ['id']
    labels: ['Points']
