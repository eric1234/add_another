require 'rake/gempackagetask'

spec = eval File.read('add_another.gemspec')
Rake::GemPackageTask.new spec do |pkg|
  pkg.need_tar = false
end

desc "Publish gem to rubygems.org"
task :publish => :package do
  `gem push pkg/#{spec.name}-#{spec.version}.gem`
end
