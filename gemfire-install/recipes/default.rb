#
# Cookbook Name:: gemfire-install
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
# The main wrapper recipe
#

action = node['gemfire']['install']['action']
case action
when 'install'
  include_recipe 'gemfire-install::users'
  include_recipe 'gemfire-install::directories'
  include_recipe 'java'
  include_recipe 'gemfire-install::s3download'
  include_recipe 'gemfire-install::install'
  include_recipe 'gemfire-install::postinstall'
  include_recipe 'gemfire-install::cleanup'
when 'uninstall'
  include_recipe 'gemfire-install::uninstall'
when 'nothing'
  # Don't do anything
end
