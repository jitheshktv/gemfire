#
# Cookbook Name:: gemfire-install
# Recipe:: libinstall
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
# This recipe will install the GNU C++ libraries for the kernel architecture compatibility.
# If the machine is 64 bit, the 64 bit libraries will be installed by default. However, not the 32 bit libraries.
# Same is the case with the 32 bit servers too. This recipe will check the architecture and install the other set of libraries
# for the allowing to run binaries of both 32 and 64 bit.
#

os_arch = node['kernel']['machine']
os_platform = node['platform']

case os_platform
when 'redhat', 'centos', 'ubuntu'
  if os_arch == 'x86_64'
    yum_package 'glibc.i686'
    yum_package 'libstdc++.i686'
  else
    yum_package 'glibc.x86_64'
    yum_package 'libstdc++.x86_64'
  end
when 'amazon'
  if os_arch == 'x86_64'
    yum_package 'glibc.i686'
    yum_package 'libstdc++48.i686'
  else
    yum_package 'glibc.x86_64'
    yum_package 'libstdc++48.x86_64'
  end
end
