$( document ).ready(function() {

  $("#board").on('mousedown', '.close', function(e) {
    e.stopPropagation();
    console.log('close');
    $(this).parent().parent().remove();
  });

  $('#board').on("dblclick", function(here) {
    position(here);
  });

  $("#board").on("dblclick", '.post-it', function(e) {
    e.stopPropagation();
  });

  //bring post-it to front on mousedown
  $('#board').on("mousedown", '.post-it', function() {
    $(this).parent().append(this);
  })
});

var post_id = 2;

$(function() {
  // Esta es la función que correrá cuando este listo el DOM 
  board = new Board('#board');
  // make exisiting sticky draggable
  drag();
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
    this.id = id
    this.html = "<div id='master" + id + "' tabindex='" + id + "' class='post-it draggable'><div class='header'><div class='close'>X</div></div><div class='content' contenteditable='true'>...</div></div>"
};

function drag() {
    $('.draggable').draggable({
      containment: '#board',
      cursor: 'move',
      cancel: 'div.content'
    });
};

////////////  NEW POST IT ////////////////////////////
function position(here) {
          var x = here.clientX; // Get the horizontal coordinate
          var y = here.clientY; // Get the vertical coordinate
          new_post_it(x, y);
};

function new_post_it(x, y) {
          post_id ++;
          post_it = new PostIt(post_id)
          board.post_its.push(post_it);
          placeDiv(x, y, post_it);
};

function placeDiv(x_pos, y_pos, post_it) {
          $('#board').append(post_it.html)
          var div = $("#master" + post_it.id);
          div.css('top', y_pos+'px');
          div.css('left', x_pos+'px');
          drag();
};



