#
# Cookbook Name:: gemfire-cachenode
# Recipe:: startlocator
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
# recipe to start a locator_port#
#

locator_port = node['gemfire']['config_cache']['locator_port']
server_port = node['gemfire']['config_cache']['server_port']
locator_list = node['gemfire']['config_cache']['locator_list']
server_max_heap = node['gemfire']['config_cache']['server_max_heap']
server_max_connections = node['gemfire']['config_cache']['server_max_connections']

user_name = node['gemfire']['config_cache']['user']
group_name = node['gemfire']['config_cache']['group']

gemfire_home = node['gemfire']['config_cache']['gemfire_home']
logs_home_dir = node['gemfire']['config_cache']['logs_home_dir']
locator_name = "#{node['hostname']}.locator.#{locator_port}"
locator_dir = "#{logs_home_dir}/#{locator_name}"
server_name = "#{node['hostname']}.server.#{server_port}"
server_dir = "#{logs_home_dir}/#{server_name}"
server_start = "#{server_dir}/server.start"

ruby_block 'Exit the execution if gemfire is not installed' do
  block do
    fail 'Installation not found' unless ::File.directory?(gemfire_home)
  end
end

ruby_block 'Exit the execution if gemfire locator is not started' do
  block do
    fail 'locator not created' unless ::File.directory?(locator_dir)
  end
end

[server_dir].each do |dir_name|
  directory dir_name do
    owner user_name
    group group_name
    mode '0755'
    recursive true
    action :create
  end
end

template 'startserver' do
  source 'startServer.erb'
  owner user_name
  group group_name
  mode 0755
  path server_start
  variables(
    var_locator_list: locator_list,
    var_server_name: server_name,
    var_server_port: server_port,
    var_server_max_heap: server_max_heap,
    var_server_max_conn: server_max_connections
  )
end

ruby_block 'set environment variables' do
  block do
    ENV['JAVA_HOME'] = node['gemfire']['config_cache']['java_home']
    ENV['GEMFIRE'] = node['gemfire']['config_cache']['gemfire_home']
    ENV['GF_JAVA'] = "#{node['gemfire']['config_cache']['java_home']}/bin/java"
    ENV['PATH'] = "#{ENV['PATH']}:#{node['gemfire']['config_cache']['java_home']}/bin:#{node['gemfire']['config_cache']['gemfire_home']}/bin"
  end
end

log 'printing the PATH environment variable' do
  message "PATH is #{ENV['PATH']}"
  level :debug
end

execute 'start server' do
  command "gfsh run --file=#{server_start}"
  # command "#{node['gemfire']['config_cache']['gemfire_home']}/bin/gfsh run --file=#{locator_start}"
  cwd server_dir
  user user_name
  group group_name
end
