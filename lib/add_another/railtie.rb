class AddAnother::Railtie < Rails::Railtie

  initializer 'add_another.form_builder' do
    ActionView::Helpers::FormBuilder.send :include, AddAnother::FormBuilder
  end

end
