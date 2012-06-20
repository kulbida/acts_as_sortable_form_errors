# encoding: utf-8
require 'rbconfig'

Gem::Specification.new do |s|
  s.name = 'acts_as_sortable_form_errors'
  s.version = 0.1
  
  s.summary = "Provides ability to display form error messages in a particular order"
  s.description = "Provides ability to display form error messages in a particular order"
  
  s.authors = ['Bogdan Kulbida']
  s.email = 'bkulbida@gmail.com'
  s.homepage = 'https://github.com/kulbida/acts_as_sortable_form_errors'
  
  s.rdoc_options = ['--main', 'README.md', '--charset=UTF-8']
  s.extra_rdoc_files = ['README.rdoc', 'LICENSE.txt']
  
  s.files = Dir['Rakefile', '{lib,test}/**/*', 'README*', 'LICENSE*']

  # include only files in version control
  git_dir = File.expand_path('../.git', __FILE__)
  void = defined?(File::NULL) ? File::NULL :
    RbConfig::CONFIG['host_os'] =~ /msdos|mswin|djgpp|mingw/ ? 'NUL' : '/dev/null'

  if File.directory?(git_dir) and system "git --version >>#{void} 2>&1"
    s.files &= `git --git-dir='#{git_dir}' ls-files -z`.split("\0")
  end
end
