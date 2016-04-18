#
# Cookbook Name:: gemfire-install
# Recipe:: users
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

# Recipe to create the user and group

# Create group. Need to add not_if
group node['gemfire-install']['install']['group']

# Create user. Needs to add not_if
user node['gemfire-install']['install']['user'] do
  group node['gemfire-install']['install']['group']
  home "/home/#{node['gemfire-install']['install']['user']}"
  shell '/bin/bash'
end
