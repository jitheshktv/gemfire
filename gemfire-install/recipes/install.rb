#
# Cookbook Name:: gemfire-install
# Recipe:: install
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
# Recipe to install the binaries

bin_target_tmp = node['gemfire-install']['install']['bin_target_tmp']
gemfire_install_dir = node['gemfire-install']['install']['gemfire_install_dir']
gemfire_major_version = node['gemfire-install']['install']['gemfire_major_version']
gemfire_minor_version = node['gemfire-install']['install']['gemfire_minor_version']
user_name = node['gemfire-install']['install']['user']
group_name = node['gemfire-install']['install']['group']

install_file = "Pivotal_GemFire_#{gemfire_major_version}_#{gemfire_minor_version}_Linux.zip"
bin_target_file = "#{bin_target_tmp}/#{install_file}"
gemfire = "#{gemfire_install_dir}/#{gemfire_major_version}/#{gemfire_minor_version}/bin/gemfire"

gemfire_version_dir = '/var/gemfire'
gemfire_version_file = "#{gemfire_version_dir}/gemfire.version"

# Install the unzip package
package 'unzip'

# Unzip the binary zip file
execute 'unzip_bin_zip' do
  command "unzip #{bin_target_file}"
  cwd gemfire_install_dir
  not_if { File.exist? gemfire }
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

# Change the ownership of the install directory
execute 'changeown' do
  command "chown -R #{user_name}:#{group_name} #{gemfire_install_dir}"
end

# Change the permissions on the installed files
execute 'changemod' do
  command "chmod -R 744 #{gemfire_install_dir}/#{gemfire_major_version}/#{gemfire_minor_version}"
end
