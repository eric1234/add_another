$(document).observe 'dom:loaded', ->
  $$('.dynamic_template').each (template) ->
    idx = 0
    id = template.id.replace /_template$/, ''
    marker = $ "#{id}_marker"
    triggers = $$ ".#{id}_trigger"

    template.remove()

    triggers.invoke 'observe', 'click', ->
      copy = template.cloneNode true
      copy.innerHTML = copy.innerHTML.replace /__template__/g, --idx
      marker.insert before: copy.innerHTML
