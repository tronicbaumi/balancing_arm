# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "")
  file(REMOVE_RECURSE
  "C:\\_data\\github\\balancing_arm\\fw\\ctrlBoard2\\dspic33c-touch-can-lin-curiosity-oob-1.0.2\\dspic33c-touch-can-lin-curiosity-oob.X\\out\\dspic33c-touch-can-lin-curiosity-oob\\production"
  )
endif()
