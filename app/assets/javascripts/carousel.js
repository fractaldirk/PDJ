$(document).ready(
   function() {
    setInterval(function() {
      $('.top_songs').load('/home/reloadtopsongs');
  }, 35000);
});
