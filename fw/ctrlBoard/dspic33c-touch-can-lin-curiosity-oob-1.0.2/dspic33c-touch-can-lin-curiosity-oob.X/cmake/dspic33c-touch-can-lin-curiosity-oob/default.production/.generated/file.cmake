# The following variables contains the files used by the different stages of the build process.
set(dspic33c_touch_can_lin_curiosity_oob_default_default_XC_DSC_FILE_TYPE_assemble
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../mcc_generated_files/system/src/dmt_asm.s"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../mcc_generated_files/system/src/where_was_i.s")
set_source_files_properties(${dspic33c_touch_can_lin_curiosity_oob_default_default_XC_DSC_FILE_TYPE_assemble} PROPERTIES LANGUAGE ASM)

# For assembly files, add "." to the include path for each file so that .include with a relative path works
foreach(source_file ${dspic33c_touch_can_lin_curiosity_oob_default_default_XC_DSC_FILE_TYPE_assemble})
        set_source_files_properties(${source_file} PROPERTIES INCLUDE_DIRECTORIES "$<PATH:NORMAL_PATH,$<PATH:REMOVE_FILENAME,${source_file}>>")
endforeach()

set(dspic33c_touch_can_lin_curiosity_oob_default_default_XC_DSC_FILE_TYPE_assemblePreproc)
set_source_files_properties(${dspic33c_touch_can_lin_curiosity_oob_default_default_XC_DSC_FILE_TYPE_assemblePreproc} PROPERTIES LANGUAGE ASM)

# For assembly files, add "." to the include path for each file so that .include with a relative path works
foreach(source_file ${dspic33c_touch_can_lin_curiosity_oob_default_default_XC_DSC_FILE_TYPE_assemblePreproc})
        set_source_files_properties(${source_file} PROPERTIES INCLUDE_DIRECTORIES "$<PATH:NORMAL_PATH,$<PATH:REMOVE_FILENAME,${source_file}>>")
endforeach()

set(dspic33c_touch_can_lin_curiosity_oob_default_default_XC_DSC_FILE_TYPE_compile
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../application/application.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../bsp/led.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../bsp/pot.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../main.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../mcc_generated_files/adc/src/adc1.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../mcc_generated_files/can/src/can1.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../mcc_generated_files/spi_client/src/spi1.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../mcc_generated_files/system/src/clock.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../mcc_generated_files/system/src/config_bits.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../mcc_generated_files/system/src/dmt.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../mcc_generated_files/system/src/interrupt.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../mcc_generated_files/system/src/pins.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../mcc_generated_files/system/src/reset.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../mcc_generated_files/system/src/system.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../mcc_generated_files/system/src/traps.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../mcc_generated_files/timer/src/sccp1.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../mcc_generated_files/timer/src/tmr1.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/../../../mcc_generated_files/uart/src/uart1.c")
set_source_files_properties(${dspic33c_touch_can_lin_curiosity_oob_default_default_XC_DSC_FILE_TYPE_compile} PROPERTIES LANGUAGE C)
set(dspic33c_touch_can_lin_curiosity_oob_default_default_XC_DSC_FILE_TYPE_compile_cpp)
set_source_files_properties(${dspic33c_touch_can_lin_curiosity_oob_default_default_XC_DSC_FILE_TYPE_compile_cpp} PROPERTIES LANGUAGE CXX)
set(dspic33c_touch_can_lin_curiosity_oob_default_default_XC_DSC_FILE_TYPE_link)
set(dspic33c_touch_can_lin_curiosity_oob_default_default_XC_DSC_FILE_TYPE_bin2hex)
set(dspic33c_touch_can_lin_curiosity_oob_default_image_name "default-production.elf")
set(dspic33c_touch_can_lin_curiosity_oob_default_image_base_name "default-production")

# The output directory of the final image.
set(dspic33c_touch_can_lin_curiosity_oob_default_output_dir "${CMAKE_CURRENT_SOURCE_DIR}/../../../out/dspic33c-touch-can-lin-curiosity-oob/production")

# The full path to the final image.
set(dspic33c_touch_can_lin_curiosity_oob_default_full_path_to_image ${dspic33c_touch_can_lin_curiosity_oob_default_output_dir}/${dspic33c_touch_can_lin_curiosity_oob_default_image_name})
