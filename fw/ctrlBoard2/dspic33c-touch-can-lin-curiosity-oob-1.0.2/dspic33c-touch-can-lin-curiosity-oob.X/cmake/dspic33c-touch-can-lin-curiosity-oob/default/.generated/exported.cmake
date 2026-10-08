set(DEPENDENT_MP_BIN2HEXdspic33c_touch_can_lin_curiosity_oob_default_Q_kyV7Fx "c:/Program Files/Microchip/xc-dsc/v4.00/bin/xc-dsc-bin2hex.exe")
set(DEPENDENT_DEPENDENT_TARGET_ELFdspic33c_touch_can_lin_curiosity_oob_default_Q_kyV7Fx ${CMAKE_CURRENT_LIST_DIR}/../../../../out/dspic33c-touch-can-lin-curiosity-oob/default.elf)
set(DEPENDENT_TARGET_DIRdspic33c_touch_can_lin_curiosity_oob_default_Q_kyV7Fx ${CMAKE_CURRENT_LIST_DIR}/../../../../out/dspic33c-touch-can-lin-curiosity-oob)
set(DEPENDENT_BYPRODUCTSdspic33c_touch_can_lin_curiosity_oob_default_Q_kyV7Fx ${DEPENDENT_TARGET_DIRdspic33c_touch_can_lin_curiosity_oob_default_Q_kyV7Fx}/${sourceFileNamedspic33c_touch_can_lin_curiosity_oob_default_Q_kyV7Fx}.s)
add_custom_command(
    OUTPUT ${DEPENDENT_TARGET_DIRdspic33c_touch_can_lin_curiosity_oob_default_Q_kyV7Fx}/${sourceFileNamedspic33c_touch_can_lin_curiosity_oob_default_Q_kyV7Fx}.s
    COMMAND ${DEPENDENT_MP_BIN2HEXdspic33c_touch_can_lin_curiosity_oob_default_Q_kyV7Fx} ${DEPENDENT_DEPENDENT_TARGET_ELFdspic33c_touch_can_lin_curiosity_oob_default_Q_kyV7Fx} --image ${sourceFileNamedspic33c_touch_can_lin_curiosity_oob_default_Q_kyV7Fx} ${addressdspic33c_touch_can_lin_curiosity_oob_default_Q_kyV7Fx} ${modedspic33c_touch_can_lin_curiosity_oob_default_Q_kyV7Fx} -mdfp=C:/Users/M91110/.mchp_packs/Microchip/dsPIC33CK-MP_DFP/1.16.521/xc16 
    WORKING_DIRECTORY ${DEPENDENT_TARGET_DIRdspic33c_touch_can_lin_curiosity_oob_default_Q_kyV7Fx}
    DEPENDS ${DEPENDENT_DEPENDENT_TARGET_ELFdspic33c_touch_can_lin_curiosity_oob_default_Q_kyV7Fx})
add_custom_target(
    dependent_produced_source_artifactdspic33c_touch_can_lin_curiosity_oob_default_Q_kyV7Fx 
    DEPENDS ${DEPENDENT_TARGET_DIRdspic33c_touch_can_lin_curiosity_oob_default_Q_kyV7Fx}/${sourceFileNamedspic33c_touch_can_lin_curiosity_oob_default_Q_kyV7Fx}.s
    )
