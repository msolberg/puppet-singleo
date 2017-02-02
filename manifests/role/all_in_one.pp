class singleo::role::all_in_one {
  include '::tripleo::profile::base::database::mysql'
  include '::tripleo::profile::base::rabbitmq'
}

include singleo::role::all_in_one
