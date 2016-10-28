$( document ).ready(function() {

  $( "#board" ).on('click', '.close', function() {
    $(this).parent().parent().remove();
  });

  $('#board').dblclick(function(here) {
    // if(){
      position(here);
    // }
    // console.log($(this).attr('id'));
  });

  $('.post-it').dblclick(function(here) {
    here.stopPropagation();
  });

  $('.header').mousedown(function() {
        // id = $($(this).parent()[0]).attr('id').slice(-1);
        // console.log(id);
        $($(this).parent()[0]).css('z-index', '1')
  })

});

var post_id = 1;

$(function() {
  // Esta es la función que correrá cuando este listo el DOM 
  board = new Board('#board');
  // make exisiting sticky draggable
  $('.draggable').draggable({
    containment: '#board',
    cursor: 'move'
  });
});

var Board = function( selector ) {
    // Aqui denerá ir el código que tenga que ver con tu tablero 
    
    // Utiliza esta sintaxis para referirte al selector que representa al tablero.
    // De esta manera no dependerás tanto de tu HTML.  
    var $elem = $( selector );
    this.post_its = []

    function initialize() {
      // Que debe de pasar cuando se crea un nuevo tablero
    };
    initialize();
};

var PostIt = function(id) {
    // Aquí va el código relacionado con un post-it
    $('.draggable').draggable({
      containment: '#board',
      cursor: 'move'
    });

    this.id = id
    this.html = "<div id='master" + id + "' class='post-it draggable'><div class='header'><div class='close'>X</div></div><div class='content' contenteditable='true'>...</div></div>"
};


////////////  NEW POST IT ////////////////////////////
function position(here) {
          var x = here.clientX; // Get the horizontal coordinate
          var y = here.clientY; // Get the vertical coordinate
          // console.log("x: " + x + " y: " + y);
          new_post_it(x, y);
}

function new_post_it(x, y) {
          post_id ++;
          post_it = new PostIt(post_id)
          board.post_its.push(post_it);
          placeDiv(x, y, post_it);
          // console.log(x, y)
};

function placeDiv(x_pos, y_pos, post_it) {
          $('#board').append(post_it.html)
          var div = $("#master" + post_it.id);
          // div.css('position', 'absolute');
          div.css('top', y_pos+'px');
          div.css('left', x_pos+'px');

          $('.draggable').draggable({
            containment: '#board',
            cursor: 'move'
          });
}



