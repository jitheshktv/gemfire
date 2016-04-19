#
# Cookbook Name:: gemfire-install
# Recipe:: install
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
# Recipe to install the binaries
#

bin_target_tmp = node['gemfire']['install']['bin_target_tmp']
gemfire_install_dir = node['gemfire']['install']['gemfire_install_dir']
gemfire_major_version = node['gemfire']['install']['gemfire_major_version']
gemfire_minor_version = node['gemfire']['install']['gemfire_minor_version']

install_file = "Pivotal_GemFire_#{gemfire_major_version}_#{gemfire_minor_version}_Linux.zip"
bin_target_file = "#{bin_target_tmp}/#{install_file}"
gemfire_home = "#{gemfire_install_dir}/#{gemfire_major_version}/#{gemfire_minor_version}"
gemfire = "#{gemfire_home}/bin/gemfire"

# Install the unzip package
package 'unzip'

# Unzip the binary zip file
execute 'unzip_bin_zip' do
  command "unzip #{bin_target_file}"
  cwd gemfire_install_dir
  not_if { File.exist? gemfire }
end
