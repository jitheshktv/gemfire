default['gemfire']['install']['action'] = 'install'
default['gemfire']['install']['group'] = 'gemuser'
default['gemfire']['install']['user'] = 'gemuser'
default['gemfire']['install']['home'] = '/home'

default['gemfire']['install']['gemfire_install_dir'] = '/apps/gemfire'
default['gemfire']['install']['gemfire_config_dir'] = '/apps/gemfire/config'
default['gemfire']['install']['logs_home_dir'] = '/logs/gemfire'

default['gemfire']['install']['bin_source_bucket'] = 'https://s3.amazonaws.com/gemfire-install'
default['gemfire']['install']['gemfire_major_version'] = '8.2.0'
default['gemfire']['install']['gemfire_minor_version'] = 'b17919'
default['gemfire']['install']['bin_target_tmp'] = '/tmp'

default['java']['install_flavor'] = 'oracle'
default['java']['jdk_version'] = '8'
default['java']['java_home'] = '/usr/lib/jvm/java'
default['java']['set_etc_environment'] = 'true'
default['java']['oracle']['accept_oracle_download_terms'] = 'true'
