#
# Cookbook Name:: gemfire-cachenode
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
# the main wrapper Recipe
#

include_recipe 'gemfire-cachenode::users'
include_recipe 'gemfire-cachenode::directories'
include_recipe 'gemfire-cachenode::startserver'
