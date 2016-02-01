$(document).ready(function() {
  $("#friends_sidebar").toggle();
  $("#friends_toggle").on("click", function(event){
    $("#friends_sidebar").toggle();
    if($("#friends_toggle").text() == "Show Friends Bar")
    {
      $("#friends_toggle").text("Hide Friends Bar");
    }
    else
    {
      $("#friends_toggle").text("Show Friends Bar");
    }
  });
});
