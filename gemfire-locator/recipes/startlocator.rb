#
# Cookbook Name:: gemfire-locator
# Recipe:: startlocator
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
# recipe to start a locator_port#
#

locator_port = node['gemfire']['config_locator']['locator_port']
locator_list = node['gemfire']['config_locator']['locator_list']
locator_heap = node['gemfire']['config_locator']['locator_heap']
jmx_mgr_port = node['gemfire']['config_locator']['jmx_mgr_port']

user_name = node['gemfire']['config_locator']['user']
group_name = node['gemfire']['config_locator']['group']

logs_home_dir = node['gemfire']['config_locator']['logs_home_dir']
locator_name = "#{node['hostname']}.locator.#{locator_port}"
locator_dir = "#{logs_home_dir}/#{locator_name}"
locator_start = "#{locator_dir}/locator.start"

[locator_dir].each do |dir_name|
  directory dir_name do
    owner user_name
    group group_name
    mode '0755'
    recursive true
    action :create
  end
end

template 'startlocator' do
  source 'startLocator.erb'
  owner user_name
  group group_name
  mode 0755
  path locator_start
  variables(
    var_locator_heap: locator_heap,
    var_locator_port: locator_port,
    var_locator_name: locator_name,
    var_locator_list: locator_list,
    var_jmx_mgr_port: jmx_mgr_port
  )
end

ruby_block 'set environment variables' do
  block do
    ENV['JAVA_HOME'] = node['gemfire']['config_locator']['java_home']
    ENV['GEMFIRE'] = node['gemfire']['config_locator']['gemfire_home']
    ENV['GF_JAVA'] = "#{node['gemfire']['config_locator']['java_home']}/bin/java"
    ENV['PATH'] = "#{ENV['PATH']}:#{node['gemfire']['config_locator']['java_home']}/bin:#{node['gemfire']['config_locator']['gemfire_home']}/bin"
  end
end

log 'printing the PATH environment variable' do
  message "PATH is #{ENV['PATH']}"
  level :debug
end

execute 'start locator' do
  command "gfsh run --file=#{locator_start}"
  # command "#{node['gemfire']['config_locator']['gemfire_home']}/bin/gfsh run --file=#{locator_start}"
  cwd locator_dir
  user user_name
  group group_name
end
