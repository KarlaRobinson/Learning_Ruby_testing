$( document ).ready(function() {
  $('.create-oven').on('submit', function(event){
    event.preventDefault();
    $('.create-oven').css('visibility', 'hidden');
    $('.oven').css('visibility', 'visible');
    $('#history').css('visibility', 'visible');
    $('.cook').css('visibility', 'visible');
  });

  $('.cook').on('submit', function(event){
    event.preventDefault();

    if(!$('#type').val() || !$('.cook input[name=time]').val()){
      $('#timer p').html('Please fill in all values');
    }else{
      // $('#timer').css('visibility', 'visible');
      $('#timer').css('background-color', 'orange');
      $('#timer p').html('');
      type = $('#type').val();
      time = $('.cook input[name=time]').val();
      torta = new Torta(type);
      oven = new Oven(torta);
      oven.bake(time);
    }
  });

});

// Class Torta
function Torta(type){
  this.type = type;
  if(type == 'ApplePie'){
    this.time = 10;
  }else if(type == 'Chocolate'){
    this.time = 9;
  }else if(type == 'VanillaSwirl'){
    this.time = 8;
  }else if(type == 'AngelCake'){
    this.time = 3;
  }
};


// Class Oven
function Oven(torta){

  this.bake = function (bake_time) {
    count_down(bake_time, bake_time);
  };

  function count_down(bake_time, time_left){
    time_left --;
    $('#timer h4').html(time_left);
    message(bake_time, time_left);
    if(time_left > 0){
      setTimeout(count_down, 1000, bake_time, time_left);
    }else{
      $('#history').append("<li>Cake type: " + torta.type + ", Time: " + bake_time + ", Result: " + $('#timer p').html() + "</li>");
    };
  };

  function message(bake_time, time_left){
    time_passed =  bake_time - time_left
    counter = time_passed / torta.time
    if(counter <= .5){
      $('#timer p').html('Cold');
    }else if(counter > .5 && counter <= .7){
      $('#timer p').html('Almost ready');
    }else if(counter > .7 && counter <= 1){
      $('#timer p').html('Done!');
    }else{
      $('#timer p').html('Burnt :(');
    };
  };

  function time_now(){
    now = new Date();
    m = now.getMinutes()
    s = now.getSeconds()
    if(m.toString().length == 1){m = '0' + m}
    if(s.toString().length == 1){s = '0' + s}
    time = m + ':' + s;
    return time;
  };
};




