#
# Cookbook Name:: gemfire-install
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe 'java'
include_recipe 'gemfire-install::users'
include_recipe 'gemfire-install::directories'
include_recipe 'gemfire-install::s3download'
include_recipe 'gemfire-install::install'
