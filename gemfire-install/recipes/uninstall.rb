#
# Cookbook Name:: gemfire-install
# Recipe:: uninstall
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
# Recipe to uninstall gemfire
#

gemfire_install_dir = node['gemfire']['install']['gemfire_install_dir']
gemfire_major_version = node['gemfire']['install']['gemfire_major_version']
gemfire_minor_version = node['gemfire']['install']['gemfire_minor_version']
gemfire_home = "#{gemfire_install_dir}/#{gemfire_major_version}/#{gemfire_minor_version}"
gemfire_version_dir = '/var/gemfire'
gemfire_version_file = "#{gemfire_version_dir}/gemfire.version_#{gemfire_major_version}_#{gemfire_minor_version}"

# user_name = node['gemfire']['install']['user']
# user_home = "#{node['gemfire']['install']['home']}/#{user_name}"
# profile = "#{user_home}/.profile"
# bash_profile = "#{user_home}/.bash_profile"

if File.exist?(gemfire_version_file)
  # Remove the gemfire minor version directory
  directory gemfire_home do
    recursive true
    action :delete
  end

  # Remove the version file
  file gemfire_version_file do
    action :delete
  end

  # More code to be added to remove the GEMFIRE HOME and other related env variables from bash_profile and profile
else
  print 'Specified version of gemfire is not installed on this machine. Please check the version and try again'
end
