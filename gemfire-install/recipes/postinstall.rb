#
# Cookbook Name:: gemfire-install
# Recipe:: postinstall
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
# The recipe to perform post install configurations
#

gemfire_install_dir = node['gemfire']['install']['gemfire_install_dir']
gemfire_major_version = node['gemfire']['install']['gemfire_major_version']
gemfire_minor_version = node['gemfire']['install']['gemfire_minor_version']
user_name = node['gemfire']['install']['user']
group_name = node['gemfire']['install']['group']
user_home = "#{node['gemfire']['install']['home']}/#{user_name}"

install_file = "Pivotal_GemFire_#{gemfire_major_version}_#{gemfire_minor_version}_Linux.zip"
gemfire_home = "#{gemfire_install_dir}/#{gemfire_major_version}/#{gemfire_minor_version}"
gemfire_version_dir = '/var/gemfire'
gemfire_version_file = "#{gemfire_version_dir}/gemfire.version_#{gemfire_major_version}_#{gemfire_minor_version}"
profile = "#{user_home}/.profile"
bash_profile = "#{user_home}/.bash_profile"
java_home = node['java']['java_home']

# Change the ownership of the install directory
execute 'changeown' do
  command "chown -R #{user_name}:#{group_name} #{gemfire_install_dir}"
end

# Change the permissions on the installed files
execute 'changemod' do
  command "chmod -R 744 #{gemfire_home}"
end

# Create the directory to store the version details
directory gemfire_version_dir do
  recursive true
  owner user_name
  group group_name
  mode 0755
end

# Create the install version file from template
template gemfire_version_file do
  source 'gemfire.version.erb'
  mode 0755
  owner user_name
  group group_name
  variables(
    var_software: install_file,
    var_user: user_name,
    var_group: group_name,
    var_installdir: gemfire_install_dir
  )
end

# Create the profile and bash profile files
template bash_profile do
  source 'bash_profile.erb'
  mode 0755
  owner user_name
  group group_name
  variables(
    var_gemfire_home: gemfire_home,
    var_java_home: java_home
  )
end

template profile do
  source 'profile.erb'
  mode 0755
  owner user_name
  group group_name
  variables(
    var_gemfire_home: gemfire_home,
    var_java_home: java_home
  )
end
