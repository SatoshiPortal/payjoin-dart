cmake_minimum_required(VERSION 3.14)

# Project-level configuration.
set(PROJECT_NAME "payjoin_flutter")
project(${PROJECT_NAME} LANGUAGES CXX)

# Invoke the build for native code shared with the other target platforms.
# This can be changed to accommodate different builds.
set(PLUGIN_NAME "payjoin_flutter_plugin")

include("../cargokit/cmake/cargokit.cmake")
apply_cargokit(${PLUGIN_NAME} ../rust payjoin_flutter "dummy_method_to_enforce_bundling")

# List of absolute paths to libraries that should be bundled with the plugin.
# This list could contain prebuilt libraries, or libraries created by an
# external build triggered from this build file.
set(payjoin_flutter_bundled_libraries
  "${${PLUGIN_NAME}_cargokit_lib}"
  PARENT_SCOPE
)
