Gem::Specification.new do |s|
  s.name               = "hadir"
  s.version            = "0.3.1"
  s.default_executable = "hadir"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ali Sepehri.Kh"]
  s.date = %q{2017-07-08}
  s.description = %q{Authorization mechanism}
  s.email = %q{ali.sepehri.kh@gmail.com}
  s.files = ["Rakefile", "lib/hadir.rb"]
  s.test_files = ["test/test_hadir.rb"]
  s.homepage = %q{http://rubygems.org/gems/hadir}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{hadir!}

  s.add_dependency 'activesupport', '>= 3.0.0'

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
