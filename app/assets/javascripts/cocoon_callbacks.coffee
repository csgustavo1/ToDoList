jQuery(document).on 'turbolinks:load', ->
  items = $('#items')
 
  items.on 'cocoon:after-insert', (e, added_el) ->
    added_el.find("input").first().focus();
    # COMENTÁRIO: Coloca o foco do cursor no primeiro input do novo objeto
 
  items.on 'cocoon:before-remove', (e, el_to_remove) ->
    $(this).data('remove-timeout', 1000)
    el_to_remove.fadeOut(1000)
    