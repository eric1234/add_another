jQuery(document).ready ($) ->
  for template in $ '.dynamic_template'
    do (template) ->
      idx = 0
      id = template.id.replace /_template$/, ''

      $(template).removeClass('dynamic_template').attr('id', null).remove().find('[required]').attr 'required', false

      $(".#{id}_trigger").click ->
        copy = template.cloneNode true
        copy.innerHTML = copy.innerHTML.replace /__template__/g, --idx
        $(copy.innerHTML).insertBefore "##{id}_marker"
        return
  return
