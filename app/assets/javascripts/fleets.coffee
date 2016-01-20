# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery -> 
    $( "ul.droptrue" ).sortable(
      connectWith: "ul"
      revert: true
    );
 
    $( "ul.dropfalse" ).sortable(
      connectWith: "ul"
      dropOnEmpty: false
    );
 
    $( "#sortable1, #sortable2" ).disableSelection();

    $('label.file').removeClass('file');