# The following functions contains all the flags passed to the different build stages.

set(PACK_REPO_PATH "C:/Users/m91110/.mchp_packs" CACHE PATH "Path to the root of a pack repository.")

function(dspic33c_touch_can_lin_curiosity_oob_default_default_XC_DSC_assemble_rule target)
    set(options
        "-g"
        "-mcpu=33CK1024MP710"
        "-Wa,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-g,--defsym=__MPLAB_DEBUGGER_PKOB4=1,--no-relax"
        "-mdfp=${PACK_REPO_PATH}/Microchip/dsPIC33CK-MP_DFP/1.13.366/xc16")
    list(REMOVE_ITEM options "")
    target_compile_options(${target} PRIVATE "${options}")
    target_compile_definitions(${target}
        PRIVATE "__DEBUG=1"
        PRIVATE "__MPLAB_DEBUGGER_PKOB4=1"
        PRIVATE "XPRJ_default=default")
    target_include_directories(${target} PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/../../../dspic33c-touch-can-lin-curiosity-oob.X")
endfunction()
function(dspic33c_touch_can_lin_curiosity_oob_default_default_XC_DSC_assemblePreproc_rule target)
    set(options
        "-x"
        "assembler-with-cpp"
        "-g"
        "-mcpu=33CK1024MP710"
        "-Wa,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-g,--defsym=__MPLAB_DEBUGGER_PKOB4=1,--no-relax"
        "-mdfp=${PACK_REPO_PATH}/Microchip/dsPIC33CK-MP_DFP/1.13.366/xc16")
    list(REMOVE_ITEM options "")
    target_compile_options(${target} PRIVATE "${options}")
    target_compile_definitions(${target}
        PRIVATE "__DEBUG=1"
        PRIVATE "__MPLAB_DEBUGGER_PKOB4=1"
        PRIVATE "XPRJ_default=default")
    target_include_directories(${target}
        PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/../../../dspic33c-touch-can-lin-curiosity-oob.X"
        PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/../../../dspic33c-touch-can-lin-curiosity-oob.X")
endfunction()
function(dspic33c_touch_can_lin_curiosity_oob_default_default_XC_DSC_compile_rule target)
    set(options
        "-g"
        "-mcpu=33CK1024MP710"
        "-O0"
        "-msmart-io=1"
        "-Wall"
        "-msfr-warn=off"
        "-mdfp=${PACK_REPO_PATH}/Microchip/dsPIC33CK-MP_DFP/1.13.366/xc16")
    list(REMOVE_ITEM options "")
    target_compile_options(${target} PRIVATE "${options}")
    target_compile_definitions(${target}
        PRIVATE "__DEBUG"
        PRIVATE "__MPLAB_DEBUGGER_PKOB4=1"
        PRIVATE "XPRJ_default=default")
    target_include_directories(${target} PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/../../../dspic33c-touch-can-lin-curiosity-oob.X")
endfunction()
function(dspic33c_touch_can_lin_curiosity_oob_default_default_XC_DSC_compile_cpp_rule target)
    set(options
        "-g"
        "${CC_PRE}"
        "-fframe-base-loclist"
        "-mcpu=33CK1024MP710"
        "-frtti"
        "-fexceptions"
        "-fno-check-new"
        "-fenforce-eh-specs"
        "-fno-common"
        "-mdfp=${PACK_REPO_PATH}/Microchip/dsPIC33CK-MP_DFP/1.13.366/xc16")
    list(REMOVE_ITEM options "")
    target_compile_options(${target} PRIVATE "${options}")
    target_compile_definitions(${target}
        PRIVATE "__DEBUG"
        PRIVATE "__MPLAB_DEBUGGER_PKOB4=1"
        PRIVATE "XPRJ_default=default")
endfunction()
function(dspic33c_touch_can_lin_curiosity_oob_default_dependentObject_rule target)
    set(options
        "-c"
        "-mcpu=33CK1024MP710"
        "-mdfp=${PACK_REPO_PATH}/Microchip/dsPIC33CK-MP_DFP/1.13.366/xc16")
    list(REMOVE_ITEM options "")
    target_compile_options(${target} PRIVATE "${options}")
endfunction()
function(dspic33c_touch_can_lin_curiosity_oob_default_link_rule target)
    set(options
        "-g"
        "-mcpu=33CK1024MP710"
        "-mreserve=data@0x1000:0x101b"
        "-mreserve=data@0x101c:0x101d"
        "-mreserve=data@0x101e:0x101f"
        "-mreserve=data@0x1020:0x1021"
        "-mreserve=data@0x1022:0x1023"
        "-mreserve=data@0x1024:0x1027"
        "-mreserve=data@0x1028:0x104f"
        "-Wl,--script=p33CK1024MP710.gld,--local-stack,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D__DEBUG=__DEBUG,--defsym=__MPLAB_DEBUGGER_PKOB4=1,--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--library-path=${CMAKE_CURRENT_SOURCE_DIR}/../../../dspic33c-touch-can-lin-curiosity-oob.X,--no-force-link,--smart-io,--report-mem,--memorysummary,memoryfile.xml"
        "-mdfp=${PACK_REPO_PATH}/Microchip/dsPIC33CK-MP_DFP/1.13.366/xc16")
    list(REMOVE_ITEM options "")
    target_link_options(${target} PRIVATE "${options}")
    target_compile_definitions(${target}
        PRIVATE "__DEBUG=__DEBUG"
        PRIVATE "__MPLAB_DEBUGGER_PKOB4=1"
        PRIVATE "XPRJ_default=default")
endfunction()
function(dspic33c_touch_can_lin_curiosity_oob_default_bin2hex_rule target)
    add_custom_target(
        dspic33c_touch_can_lin_curiosity_oob_default_Bin2Hex ALL
        COMMAND ${MP_BIN2HEX} ${dspic33c_touch_can_lin_curiosity_oob_default_image_name} -a -mdfp=${PACK_REPO_PATH}/Microchip/dsPIC33CK-MP_DFP/1.13.366/xc16
        WORKING_DIRECTORY ${dspic33c_touch_can_lin_curiosity_oob_default_output_dir}
        BYPRODUCTS "${dspic33c_touch_can_lin_curiosity_oob_default_output_dir}/${dspic33c_touch_can_lin_curiosity_oob_default_image_base_name}.hex"
        COMMENT "Convert build file to .hex")
    add_dependencies(dspic33c_touch_can_lin_curiosity_oob_default_Bin2Hex ${target})
endfunction()
