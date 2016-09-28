echo "create the Gemfile"
echo "source \"https://rubygems.org\"

gem 'rspec', '~> 3.0'
gem 'guard-rspec', require: false" >  Gemfile

echo "installation bundle"
gem install bundle

echo "install dependency"
bundle install --binstubs

echo "initialisation rspec"
bin/rspec --init

echo "create class exemple"
mkdir lib
echo "class Example
  def exist?
    true
  end
end" > lib/example.rb

echo "create test exemple"

echo "
require 'example'
RSpec.describe Example do
  it \"should execute the test\" do
    ex = Example.new
    expect(ex.exist?).to be true
  end
end" > spec/example_spec.rb

echo "launch the test"

guard init rspec
rspec
guard
