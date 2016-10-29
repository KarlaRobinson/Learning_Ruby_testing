$( document ).ready(function() {

  $("#boards").on('mousedown', '.close', function(e) {
    e.stopPropagation();
    $(this).parent().parent().remove();
  });

  $('#boards').on("dblclick", function(here) {
    position(here);
  });

  $("#boards").on("dblclick", '.post-it', function(e) {
    e.stopPropagation();
  });

  //bring post-it to front on mousedown
  $('#boards').on("mousedown", '.post-it', function() {
    $(this).parent().append(this);
  })

  $('input').on("click", function(){
    getBoardName();
  });

  $('#boards').on("mousedown", '.post-it', function() {
    $(this).parent().append(this);
  })
});

var post_id = 0;
var board_id = 0;

var Board = function( name ) {
    this.id = board_id
    this.name = name; 
    this.post_its = [];

    function initialize() {
    };
    initialize();
};

var PostIt = function(id, text) {
    this.id = id
    this.text = text
    this.html = "<div id='master" + id + "' class='post-it draggable'><div class='header'><div class='close'>X</div></div><div class='content' contenteditable='true'>" + text + "</div></div>"
};

function drag() {
    $('.draggable').draggable({
      containment: '#board',
      cursor: 'move',
      cancel: 'div.content'
    });
};

////////////  NEW BOARD ////////////////////////////

function getBoardName(name) {
   var name = prompt("Board name:", "School");
   create_board(name);
};

function create_board(name) {
  board_id ++;
  this["board" + board_id] = new Board(name);
  $('#board-nav').append("<li id='board" + board_id + "-nav'>" + name + "</li>");
  $('#boards').append("<div id='board" + board_id + "'></div>")
  new_post_it(518, 32, "HI", this["board" + board_id]);
  drag();
};

////////////  NEW POST IT ////////////////////////////
function position(here) {
          var x = here.clientX; // Get the horizontal coordinate
          var y = here.clientY; // Get the vertical coordinate
          new_post_it(x, y, board1);
};

function new_post_it(x, y, text, board) {
          post_id ++;
          post_it = new PostIt(post_id, text)
          board.post_its.push(post_it);
          $("#board" + board_id).append(post_it.html)
          $("#master" + post_it.id).css('top', y +'px');
          $("#master" + post_it.id).css('left', x +'px');
          drag();
};


