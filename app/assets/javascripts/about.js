$(document).on('click', '#try-it', function (e) {
  e.preventDefault();

  $('.face').remove();

  $('#picture').faceDetection({
    complete: function (faces) {
      var marg = 20;
      for (var i = 0; i < faces.length; i++) {
        var left   = (faces[i].x - marg),
            top    = (faces[i].y - marg),
            width  = (faces[i].width  + (marg * 2)),
            height = (faces[i].height + (marg * 2));
        $('<div />', {
            'class': 'face',
            'css': {
                'left':   left   * faces[i].scaleX + 'px',
                'top':    top    * faces[i].scaleY + 'px',
                'width':  width  * faces[i].scaleX + 'px',
                'height': height * faces[i].scaleY + 'px'
            }
        })
        .insertAfter(this);
      }
    },
    error:function (code, message) {
      alert('Error: ' + message);
    }
  });
});
