cmake_minimum_required(VERSION 3.8)

project(ds_multibeam_msgs)

find_package(ament_cmake REQUIRED)
find_package(rosidl_default_generators REQUIRED)

find_package(ds_core_msgs REQUIRED)
find_package(std_msgs REQUIRED)

set(MSG_FILES
  msg/MultibeamFilterStats.msg
  msg/MultibeamGrid.msg
  msg/MultibeamGridStats.msg
  msg/MultibeamRaw.msg
  msg/NorbitMB.msg
)

set(SRV_FILES
  srv/LoadXmlCmd.srv
  srv/NorbitCmd.srv
  srv/PingCmd.srv
  srv/PwrCmd.srv
  srv/QueryCmd.srv
  srv/SettingsCmd.srv
)

rosidl_generate_interfaces(
    ${PROJECT_NAME}
    ${MSG_FILES}
    ${SRV_FILES}
    DEPENDENCIES
    ds_core_msgs
    std_msgs
)

ament_export_dependencies(rosidl_default_runtime)

ament_package()
