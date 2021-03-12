document.addEventListener("turbolinks:load", function() {$(function() {
  $(".tab li").click(function() {
    var num = $(".tab li").index(this);
    $(".tabContent").removeClass('active');
    $(".tabContent").eq(num).addClass('active');
    $(".tab li").removeClass('active');
    $(this).addClass('active')
  });
  });
})

document.addEventListener("turbolinks:load", function() {$(function() {
  function readURL(input) {
      if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
  $('#img_prev').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
      }
  }
  $("#file_image").change(function(){
      readURL(this);
  });
  });
})

document.addEventListener("turbolinks:load", function() {$(function() {
  $(function(){
    $('.menu-btn').click(function() {
      $('.menu').toggleClass('is-active');
    });
  }());
  });
})

document.addEventListener("turbolinks:load", function() {$(function() {
  $(function(){
    $('.settings-btn').click(function() {
      $('.show-settings').toggleClass('show-active');
    });
  }());
  });
})