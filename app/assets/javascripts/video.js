$(function() {

  $('#videoModal').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget)
    var video_title = button.data('video-title')
    var video_id = button.data('video-id')
    var modal = $(this)
    modal.find('.modal-title').text(video_title)
    modal.find('.video-iframe').attr('src', "https://www.youtube.com/embed/" + video_id);
  })

});


