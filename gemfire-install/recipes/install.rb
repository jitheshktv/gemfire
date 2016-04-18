#
# Cookbook Name:: gemfire-install
# Recipe:: install
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
# Recipe to install the binaries

install_file = "Pivotal_GemFire_/#{gemfire_major_version}/_/#{gemfire_minor_version}/_Linux.zip"
bin_target_tmp = node['gemfire-install']['install']['bin_target_tmp']
bin_target_file = "#{bin_target_tmp}/#{install_file}"

gemfire_install_dir = node['gemfire-install']['install']['gemfire_install_dir']
gemfire_major_version = node['gemfire-install']['install']['gemfire_major_version']
gemfire_minor_version = node['gemfire-install']['install']['gemfire_minor_version']
gemfire = "#{gemfire_install_dir}/#{gemfire_major_version}/#{gemfire_minor_version}/bin/gemfire"

# Install the unzip package
package 'unzip'

# Unzip the binary zip file
execute 'unzip_bin_zip' do
  command "unzip #{bin_target_file}"
  cwd gemfire_install_dir
  not_if { File.exist? gemfire }
end