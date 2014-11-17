var height = window.innerHeight;

$(document).ready(function(){
  $('.full-frame-hero').css('height', height);

});


setTimeout(setOffStep1, 100);
setTimeout(setOffStep2, 2000);
setTimeout(setOffStep3, 6000);

function setOffStep1(){
  $('.image-slide').removeClass('hidden');
}

function setOffStep2(){
  $('.ghost-message').ghostType();
  $('.image-slide').addClass('hidden');
  $('.ghost-message').parent().removeClass('hidden');
}

function setOffStep3(){
  $('.returned-url').parent().removeClass('hidden');
  $('.ghost-message').parent().addClass('hidden');
}
