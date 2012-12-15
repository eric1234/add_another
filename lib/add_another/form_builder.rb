module AddAnother::FormBuilder

  # Works just like fields_for but will output HTML that allows
  # dynamic forms to be added whenever a user clicks on a link built
  # by link_to_new_nested_form.
  def dynamic_fields_for(name, *args, &blk)
    options = args.extract_options!

    minimum = options[:minimum] || 1
    @object.send(name).build until @object.send(name).size >= minimum

    klass = @object.class.reflect_on_association(name).klass
    template = fields_for_nested_model("#{@object_name}[#{name}_attributes][__template__]", klass.new, options, blk)
    template = @template.content_tag 'div', template,
      :id => "#{dynamic_name name}_template", :class => 'dynamic_template'

    template + fields_for(name, *(args << options), &blk)
  end

  # Will insert a new nested form. Works somewhat like link_to but
  # since it doesn't actually link anywhere it is just a span with
  # some special classes and ids. A different tag can be used if you
  # need a block-level element or have some other need.
  def activate_new_nested_form(name, label='Add Another', tag='span', &blk)
    options = {:class  => "#{dynamic_name name}_trigger dynamic_trigger"}
    if block_given?
      @template.content_tag tag, options, &blk
    else
      @template.content_tag tag, label, options
    end
  end

  # Will leave a marker that will allow the javascript to know where
  # to insert the new nested form.
  #
  #   options[:next_index]::
  #     If each new dynamic nested object has some sort of index then
  #     pass the next number as options[:next_index]. This number will
  #     be used for the first dynamic insert. Each one added after that
  #     will increment the number by one.
  def new_nested_form_marker(name, opts={})
    options = {
      :class => 'dynamic_marker',
      :id    => "#{dynamic_name name}_marker"
    }
    options[:class] += " index-#{opts[:next_index]}" if opts.has_key? :next_index
    @template.content_tag 'div', '', options
  end

  private

  def dynamic_name(name)
    [
      object_name.gsub(/\W+/, '_').sub(/_$/, '').sub(/^_/, ''),
      name
    ] * '_'
  end

end
