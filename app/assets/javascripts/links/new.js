(function($) {
  $('#link_url').preview({key: '6e70a5a64f0e4368a5e5db62266d6694'}) // Sign up for a key: http://embed.ly/pricing
    .on('loading', function(){
      $(this).prop('disabled', true);
      $('[name="commit"]').html('<i class="icon-spinner icon-spin"></i>');
    }).on('loaded', function(){
      $(this).prop('disabled', false);
      $('[name="commit"]').val('儲存資料');
    })

  function preview_website(){
    if($('.selector-wrapper').html() != ''){
      return true;
    }else{
      return false;
    }
  }

  $('[name="commit"]').on('click', function(){
    preview_website();
  });

  $('[name="commit"]').keypress(function(){
    preview_website();
  })

  $('#new_link').on('submit', function(){
    // Close the selector
    //$('#id_url').trigger('close');
    //$('#id_url').val('');
    if($('.selector-wrapper').html() != ''){

      return true;
    }else{
      var preview = $('#link_url').data('preview');
      return false;
    }
  });
})(jQuery);