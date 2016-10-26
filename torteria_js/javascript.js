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
    type = $('.cook input[name=type]').val();
    time = $('.cook input[name=time]').val();
    alert(time + ',' + type);
  });

});

// Class Torta
function Torta(type, time){
  this.type = type;
  this.time = time;
  console.log('New torta: ' + type + ',' + time);
};

// // Class TortaBatch
// function TortaBatch(){
//   // this.crear_torta = function (name) {
//   //     this.lastName = name;
//   // };
// };

// Class Oven
function Oven(tray){
  this.tray = tray;

  this.bake_torta = function (time) {
    this.cold = [];
    this.almost_ready = [];
    this.done = [];
    this.burnt = [];

    $.each( tray, function(obj){
      console.log(obj);
    });
  };

  // this.cold? = function () {
  //     // this.lastName = name;
  // };
  // this.almost_ready? = function () {
  //     // this.lastName = name;
  // };
  // this.done? = function () {
  //     // this.lastName = name;
  // };
  // this.burnt? = function () {
  //     // this.lastName = name;
  // };
};
