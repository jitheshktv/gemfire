#
# Cookbook Name:: gemfire-install
# Recipe:: cleanup
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
# Recipe to clean up the temporary files used.
#

bin_target_tmp = node['gemfire-install']['install']['bin_target_tmp']
bin_target_file = "#{bin_target_tmp}/#{install_file}"

file bin_target_file do
  action :delete
end

directory bin_target_tmp do
  recursive true
  action :delete
end
