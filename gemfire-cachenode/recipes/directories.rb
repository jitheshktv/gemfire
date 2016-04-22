#
# Cookbook Name:: gemfire-cachenode
# Recipe:: directories
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
# recipe to create the needed directory structure

# Create the directories

gemfire_config_dir = node['gemfire']['config_cache']['gemfire_config_dir']
logs_home_dir = node['gemfire']['config_cache']['logs_home_dir']
profile_home_dir = node['gemfire']['config_cache']['profile_home_dir']

user_name = node['gemfire']['config_cache']['user']
group_name = node['gemfire']['config_cache']['group']

[gemfire_config_dir, logs_home_dir, profile_home_dir].each do |dir_name|
  directory dir_name do
    owner user_name
    group group_name
    mode '0755'
    recursive true
    action :create
  end
end
