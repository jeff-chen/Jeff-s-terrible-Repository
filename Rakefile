require 'rake'
$:.unshift(File.dirname(__FILE__) + '/../../../lib')
require 'cucumber/rake/task'
require 'spec/rake/spectask'


Cucumber::Rake::Task.new do |t|
  t.cucumber_opts = %w{--format pretty}
end

Spec::Rake::SpecTask.new do |t|
  t.warning = true
  t.rcov = true
end
