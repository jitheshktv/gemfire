default['gemfire']['config_locator']['group'] = 'gemuser'
default['gemfire']['config_locator']['user'] = 'gemuser'
default['gemfire']['config_locator']['home'] = '/home'

default['gemfire']['config_locator']['action'] = 'addLocator'
default['gemfire']['config_locator']['is_profile'] = 'true'
default['gemfire']['config_locator']['profile_name'] = 'profile1'
default['gemfire']['config_locator']['profile_home_dir'] = '/apps/gemfire/config'
default['gemfire']['config_locator']['is_cluster'] = 'true'
default['gemfire']['config_locator']['cluster_name'] = 'cluster1'
default['gemfire']['config_locator']['distr_system_id'] = '123'
default['gemfire']['config_locator']['is_adminLocator'] = 'true'

default['gemfire']['config_locator']['locator_port'] = '41111'
default['gemfire']['config_locator']['locator_list'] = 'localhost[41111]'
default['gemfire']['config_locator']['locator_heap'] = '1024m'
default['gemfire']['config_locator']['adv_jvm_args'] = 'abcd'
default['gemfire']['config_locator']['jmx_mgr_port'] = '9099'
default['gemfire']['config_locator']['gemfire_prop_file'] = 'default'

default['gemfire']['config_locator']['java_home'] = '/usr/lib/jvm/java'
default['gemfire']['config_locator']['gemfire_home'] = '/apps/gemfire/8.2.0/b17919'
default['gemfire']['config_locator']['gemfire_install_dir'] = '/apps/gemfire'
default['gemfire']['config_locator']['gemfire_config_dir'] = '/apps/gemfire/config'
default['gemfire']['config_locator']['logs_home_dir'] = '/logs/gemfire'
