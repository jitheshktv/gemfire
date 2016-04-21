#
# Cookbook Name:: gemfire-locator
# Recipe:: createprofile
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
# Recipe to create profile directory
#

is_profile = node['gemfire']['config_locator']['is_profile']
profile_name = node['gemfire']['config_locator']['profile_name']
profile_home_dir = node['gemfire']['config_locator']['profile_home_dir']
profile_dir = "#{profile_home_dir}/#{profile_name}"
profile_data_dir = "#{profile_dir}/data"

logs_home_dir = node['gemfire']['config_locator']['logs_home_dir']
profile_logs_dir = "#{logs_home_dir}/#{profile_name}"

cluster_name = node['gemfire']['config_locator']['cluster_name']
cluster_logs_dir = "#{profile_dir}/logs/#{cluster_name}"
cluster_data_dir = "#{profile_data_dir}/#{cluster_name}"
locators_logs = "#{cluster_logs_dir}/locators"
locators_data = "#{cluster_data_dir}/locators"
locator_port = node['gemfire']['config_locator']['locator_port']
locator_name = "#{node[hostname]}.locator#{locator_port}"
locator_log_dir = "#{locators_logs}/#{locator_name}"
locator_data_dir = "#{locators_data}/#{locator_name}"

user_name = node['gemfire']['config_locator']['user']
group_name = node['gemfire']['config_locator']['group']

if is_profile == 'true'
  [profile_home_dir, profile_dir, profile_logs_dir].each do |dir_name|
    directory dir_name do
      owner user_name
      group group_name
      mode '0755'
      recursive true
      action :create
    end
  end

  # Download and unzip the profile

  link 'softlink to logs directory' do
    target_file "#{profile_dir}/logs"
    to profile_logs_dir
    owner user_name
    group group_name
  end

  if is_cluster == 'true'
    [cluster_logs_dir, cluster_data_dir, locators_logs, locators_data, locator_log_dir, locator_data_dir].each do |dir_name|
      directory dir_name do
        owner user_name
        group group_name
        mode '0755'
        recursive true
        action :create
      end
    end
  end
end
