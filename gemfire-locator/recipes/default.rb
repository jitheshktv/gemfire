#
# Cookbook Name:: gemfire-locator
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
# the main wrapper Recipe
#

include_recipe 'gemfire-locator::users'
include_recipe 'gemfire-locator::directories'
include_recipe 'gemfire-locator::startlocator'
