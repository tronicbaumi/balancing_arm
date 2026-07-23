set(DEPENDENT_MP_BIN2HEXdspic33c_touch_can_lin_curiosity_oob_default_HGhO4qQ4 "c:/Program Files/Microchip/xc-dsc/v3.31.01/bin/xc-dsc-bin2hex.exe")
set(DEPENDENT_DEPENDENT_TARGET_ELFdspic33c_touch_can_lin_curiosity_oob_default_HGhO4qQ4 ${CMAKE_CURRENT_LIST_DIR}/../../../../out/dspic33c-touch-can-lin-curiosity-oob/default.elf)
set(DEPENDENT_TARGET_DIRdspic33c_touch_can_lin_curiosity_oob_default_HGhO4qQ4 ${CMAKE_CURRENT_LIST_DIR}/../../../../out/dspic33c-touch-can-lin-curiosity-oob)
set(DEPENDENT_BYPRODUCTSdspic33c_touch_can_lin_curiosity_oob_default_HGhO4qQ4 ${DEPENDENT_TARGET_DIRdspic33c_touch_can_lin_curiosity_oob_default_HGhO4qQ4}/${sourceFileNamedspic33c_touch_can_lin_curiosity_oob_default_HGhO4qQ4}.s)
add_custom_command(
    OUTPUT ${DEPENDENT_TARGET_DIRdspic33c_touch_can_lin_curiosity_oob_default_HGhO4qQ4}/${sourceFileNamedspic33c_touch_can_lin_curiosity_oob_default_HGhO4qQ4}.s
    COMMAND ${DEPENDENT_MP_BIN2HEXdspic33c_touch_can_lin_curiosity_oob_default_HGhO4qQ4} ${DEPENDENT_DEPENDENT_TARGET_ELFdspic33c_touch_can_lin_curiosity_oob_default_HGhO4qQ4} --image ${sourceFileNamedspic33c_touch_can_lin_curiosity_oob_default_HGhO4qQ4} ${addressdspic33c_touch_can_lin_curiosity_oob_default_HGhO4qQ4} ${modedspic33c_touch_can_lin_curiosity_oob_default_HGhO4qQ4} -mdfp=C:/Users/M91110/.mchp_packs/Microchip/dsPIC33CK-MP_DFP/1.15.423/xc16 
    WORKING_DIRECTORY ${DEPENDENT_TARGET_DIRdspic33c_touch_can_lin_curiosity_oob_default_HGhO4qQ4}
    DEPENDS ${DEPENDENT_DEPENDENT_TARGET_ELFdspic33c_touch_can_lin_curiosity_oob_default_HGhO4qQ4})
add_custom_target(
    dependent_produced_source_artifactdspic33c_touch_can_lin_curiosity_oob_default_HGhO4qQ4 
    DEPENDS ${DEPENDENT_TARGET_DIRdspic33c_touch_can_lin_curiosity_oob_default_HGhO4qQ4}/${sourceFileNamedspic33c_touch_can_lin_curiosity_oob_default_HGhO4qQ4}.s
    )
