

// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui.min
//= require angular.min
//= require angular-route.min
//= require angular-resource.min
//= require angular-dragdrop.min
//= require dida
//= require bootstrap
//= require bootstrap-select
//= require bootstrap-datepicker
//= require fittext
//= require underscore
//= require restangular
//= require home

//= require s3_direct_upload

//= require fullcalendar.min

//= require calendar

//= require gcal
//= require turbolinks
//= require_tree ./angular
//= require_tree .

var do_on_load = function() {

  $('#s3_uploader').S3Uploader(
  {
    remove_completed_progress_bar: false,
    progress_bar_target: $('#uploads_container'),
    allow_multiple_files: false
  }
  );

  $('#s3_uploader').bind('s3_upload_failed', function(e, content) {
    return alert(content.filename + ' failed to upload due to a timeout.');
  });

  $('#s3_uploader').bind('s3_upload_complete', function(e, content) {

    $('#post_direct_upload_url').val(content.url);
    $('#post_attached_file_file_name').val(content.filename);
    $('#post_attached_file_file_path').val(content.filepath);
    $('#post_attached_file_file_size').val(content.filesize);
    $('#post_attached_file_content_type').val(content.filetype);
  });

};

$(document).ready(do_on_load);
$(window).bind('page:change', do_on_load);