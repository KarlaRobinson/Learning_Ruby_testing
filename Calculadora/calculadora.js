// $(document).ready(function() {
  
//   // call function init --->  $( init ); == init();
//   $( init );  

//   function init() {
//     $('.draggable').draggable({
//       containment: '#content',
//       cursor: 'move',
//       helper: 'clone',
//       // snap: '#cardPile',
//       stop: handleDragStop
//     });
//   };

//   function handleDragStop( event, ui ) {
//     if($("#cardSlots > *").length < 10){
//       card_num = $(ui.helper[0]).html();
//       $('#cardSlots').append("<div>" + card_num + "</div>");
//       sum = parseInt($('#total_sum').html()) + parseInt(card_num);
//       $('#total_sum').html(sum);
//     }else{
//       //return to original position
//     }
//   }

// });

$(document).ready(function() {
  // call function init --->  $( init ); == init();
  counter = 0;
  sum = 0;
  pile1 = new Pile();
  pile2 = new Pile();
  $( create_cards );
  $( display_cards );
  $( init );
});

  function Card(num){
    this.num = num;
    this.struc = "<div class='draggable'>" + num + "</div>";
  };

  function Pile(){
    this.cards = [];
  };

  function create_cards(){
    for (i = 0; i < 10; i++) {
      pile1.cards.push(new Card(i));
    }
  };

  function display_cards(){
    pile1.cards.forEach(function(card) {
      $('#cardPile').append(card.struc);
    });
  };

  function init() {
    $('.draggable').draggable({
      containment: '#content',
      cursor: 'move',
      helper: 'clone',
      stop: handleDragStop
    });
  };

  function handleDragStop( event, ui ) {
    counter ++;
    if(counter < 11){
      card_num = $(ui.helper[0]).html();
      card = new Card(card_num);
      $('#cardSlots').append(card.struc);
      sum += parseInt(card_num);
      $('#total_sum').html(sum);
    }else{
      //return to original position
    }
  }







