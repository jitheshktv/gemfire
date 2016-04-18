#
# Cookbook Name:: gemfire-install
# Recipe:: users
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

# Recipe to create the user and group

# Create group. Need to add not_if

user_name = node['gemfire-install']['install']['user']
group_name = node['gemfire-install']['install']['group']

group group_name

# Create user. Needs to add not_if
user user_name do
  group group_name
  home "/home/#{user_name}"
  shell '/bin/bash'
end
