cmake_minimum_required(VERSION 3.8)

project(ds_core_msgs)

find_package(ament_cmake REQUIRED)
find_package(rosidl_default_generators REQUIRED)

find_package(builtin_interfaces REQUIRED)
find_package(std_msgs REQUIRED)

set(MSG_FILES
  msg/Abort.msg
  msg/ByteSequence.msg
  msg/ClockOffset.msg
  msg/Countdown.msg
  msg/CountdownMonitor.msg
  msg/CriticalProcess.msg
  msg/Diag.msg
  msg/DsHeader.msg
  msg/IoCommand.msg
  msg/IoCommandList.msg
  msg/IoSMQueues.msg
  msg/KeyBool.msg
  msg/KeyDouble.msg
  msg/KeyFloat.msg
  msg/KeyInt.msg
  msg/KeyString.msg
  msg/ParamDescription.msg
  msg/ParamUpdate.msg
  msg/RawData.msg
  msg/Status.msg
  msg/StringStamped.msg
)

set(SRV_FILES
  srv/IoSMcommand.srv
  srv/StringCmd.srv
  srv/VoidCmd.srv
)

rosidl_generate_interfaces(
    ${PROJECT_NAME}
    ${MSG_FILES}
    ${SRV_FILES}
    DEPENDENCIES
    builtin_interfaces
    std_msgs
)

ament_export_dependencies(rosidl_default_runtime)

if(BUILD_TESTING)
  find_package(ament_lint_auto REQUIRED)
  ament_lint_auto_find_test_dependencies()
endif()

ament_package()
