#
# Cookbook Name:: gemfire-install
# Recipe:: cleanup
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
# Recipe to clean up the temporary files used.
#

bin_target_tmp = node['gemfire']['install']['bin_target_tmp']
gemfire_major_version = node['gemfire']['install']['gemfire_major_version']
gemfire_minor_version = node['gemfire']['install']['gemfire_minor_version']
install_file = "Pivotal_GemFire_#{gemfire_major_version}_#{gemfire_minor_version}_Linux.zip"
bin_target_file = "#{bin_target_tmp}/#{install_file}"

file bin_target_file do
  action :delete
end
