Gem::Specification.new do |s|
  s.name = 'add_another'
  s.version = '0.0.2'
  s.homepage = 'http://github.com/eric1234/add_another/'
  s.author = 'Eric Anderson'
  s.email = 'eric@pixelwareinc.com'
  s.add_dependency 'rails', '>= 3'
  s.files = Dir['lib/**/*.rb']
  s.has_rdoc = true
  s.extra_rdoc_files << 'README'
  s.rdoc_options << '--main' << 'README'
  s.summary = 'Provides magic for dynamically expanding nested forms'
  s.description = <<-DESCRIPTION
    Allows you to take full advantage of the nested form goodness of
    Rails by allowing easy to implement dynamically expanding forms.
  DESCRIPTION
end
