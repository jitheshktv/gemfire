#
# Cookbook Name:: gemfire-install
# Recipe:: directories
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
# recipe to create the needed directory structure

# Create the directories

gemfire_install_dir = node['gemfire-install']['install']['gemfire_install_dir']
gemfire_config_dir = node['gemfire-install']['install']['gemfire_config_dir']
logs_home_dir = node['gemfire-install']['install']['logs_home_dir']
java_home = node['java']['java_home']

user_name = node['gemfire-install']['install']['user']
group_name = node['gemfire-install']['install']['group']

[gemfire_install_dir, logs_home_dir, gemfire_config_dir, java_home].each do |dir_name|
  directory dir_name do
    owner user_name
    group group_name
    mode '0755'
    recursive true
    action :create
  end
end
