class AddAnother::Engine < Rails::Engine

  initializer 'add_another.form_builder' do
    ActionView::Helpers::FormBuilder.send :include, AddAnother::FormBuilder
  end

end
