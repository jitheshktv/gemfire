default['gemfire-install']['install']['group'] = 'gemuser'
default['gemfire-install']['install']['user'] = 'gemuser'
default['gemfire-install']['install']['home'] = '/home'

default['gemfire-install']['install']['gemfire_install_dir'] = '/apps/gemfire'
default['gemfire-install']['install']['gemfire_config_dir'] = '/apps/gemfire/config'
default['gemfire-install']['install']['logs_home_dir'] = '/logs/gemfire'

default['gemfire-install']['install']['bin_source_bucket'] = 'https://s3.amazonaws.com/gemfire-install'
default['gemfire-install']['install']['gemfire_major_version'] = '8.2.0'
default['gemfire-install']['install']['gemfire_minor_version'] = 'b17919'
default['gemfire-install']['install']['bin_target_tmp'] = '/tmp'

default['java']['install_flavor'] = 'oracle'
default['java']['jdk_version'] = '8'
default['java']['java_home'] = '/opt/jre'
default['java']['set_etc_environment'] = 'true'
default['java']['oracle']['accept_oracle_download_terms'] = 'true'
