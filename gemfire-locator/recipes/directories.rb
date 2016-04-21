#
# Cookbook Name:: gemfire-install
# Recipe:: directories
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
# recipe to create the needed directory structure

# Create the directories

gemfire_config_dir = node['gemfire']['config_locator']['gemfire_config_dir']
gemfire_home = node['gemfire']['config_locator']['gemfire_home']
logs_home_dir = node['gemfire']['config_locator']['logs_home_dir']
profile_home_dir = node['gemfire']['config_locator']['profile_home_dir']

user_name = node['gemfire']['config_locator']['user']
group_name = node['gemfire']['config_locator']['group']

ruby_block 'Exit the execution if gemfire is not installed' do
  block do
    fail 'Installation not found' unless ::File.directory?(gemfire_home)
  end
end

[gemfire_config_dir, logs_home_dir, profile_home_dir].each do |dir_name|
  directory dir_name do
    owner user_name
    group group_name
    mode '0755'
    recursive true
    action :create
  end
end
