#
# Cookbook Name:: gemfire-install
# Recipe:: s3download
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

# Recipe to download the installable from S3

bin_source_bucket = node['gemfire-install']['install']['bin_source_bucket']
gemfire_major_version = node['gemfire-install']['install']['gemfire_major_version']
gemfire_minor_version = node['gemfire-install']['install']['gemfire_minor_version']

install_file = "Pivotal_GemFire_/#{gemfire_major_version}/_/#{gemfire_minor_version}/_Linux.zip"
bin_source_file = "#{bin_source_bucket}/#{install_file}"

bin_target_tmp = node['gemfire-install']['install']['bin_target_tmp']
bin_target_file = "#{bin_target_tmp}/#{install_file}"

install_group = node['gemfire-install']['install']['group']
install_user = node['gemfire-install']['install']['user']

# create the required directories
directory bin_target_tmp do
  owner install_user
  group install_group
  mode '0777'
end

# Download the file from S3
remote_file bin_target_file do
  source bin_source_file
  owner install_user
  group install_group
  mode '0777'
end
