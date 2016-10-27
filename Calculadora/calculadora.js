$(document).ready(function() {
  
  // call function init --->  $( init ); == init();
  $( init );  

  function init() {
    $('.draggable').draggable({
      containment: '#content',
      cursor: 'move',
      helper: 'clone',
      // snap: '#cardPile',
      stop: handleDragStop
    });
  };

  function handleDragStop( event, ui ) {
    if($("#cardSlots > *").length < 10){
      card_num = $(ui.helper[0]).html();
      $('#cardSlots').append("<div>" + card_num + "</div>");
      sum = parseInt($('#total_sum').html()) + parseInt(card_num);
      $('#total_sum').html(sum);
    }else{
      //return to original position

    }
  }

});