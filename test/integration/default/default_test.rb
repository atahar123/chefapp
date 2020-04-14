# InSpec test for recipe chefapp::default

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/

describe port(80) do
  it { should_not be_listening }
end

describe package('python3') do
  it { should be_installed }
  its("version"){ should cmp > '3.*'}
end

describe package('python3-pip') do
  it { should be_installed }
end

# describe directory('/var/lib/jenkins') do
#   it { should exist }
# end
