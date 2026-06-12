set(DEPENDENT_MP_BIN2HEXdspic33c_touch_can_lin_curiosity_oob_default_oyqw0OFb "c:/Program Files/Microchip/xc-dsc/v3.31/bin/xc-dsc-bin2hex.exe")
set(DEPENDENT_DEPENDENT_TARGET_ELFdspic33c_touch_can_lin_curiosity_oob_default_oyqw0OFb ${CMAKE_CURRENT_LIST_DIR}/../../../../out/dspic33c-touch-can-lin-curiosity-oob/default.elf)
set(DEPENDENT_TARGET_DIRdspic33c_touch_can_lin_curiosity_oob_default_oyqw0OFb ${CMAKE_CURRENT_LIST_DIR}/../../../../out/dspic33c-touch-can-lin-curiosity-oob)
set(DEPENDENT_BYPRODUCTSdspic33c_touch_can_lin_curiosity_oob_default_oyqw0OFb ${DEPENDENT_TARGET_DIRdspic33c_touch_can_lin_curiosity_oob_default_oyqw0OFb}/${sourceFileNamedspic33c_touch_can_lin_curiosity_oob_default_oyqw0OFb}.s)
add_custom_command(
    OUTPUT ${DEPENDENT_TARGET_DIRdspic33c_touch_can_lin_curiosity_oob_default_oyqw0OFb}/${sourceFileNamedspic33c_touch_can_lin_curiosity_oob_default_oyqw0OFb}.s
    COMMAND ${DEPENDENT_MP_BIN2HEXdspic33c_touch_can_lin_curiosity_oob_default_oyqw0OFb} ${DEPENDENT_DEPENDENT_TARGET_ELFdspic33c_touch_can_lin_curiosity_oob_default_oyqw0OFb} --image ${sourceFileNamedspic33c_touch_can_lin_curiosity_oob_default_oyqw0OFb} ${addressdspic33c_touch_can_lin_curiosity_oob_default_oyqw0OFb} ${modedspic33c_touch_can_lin_curiosity_oob_default_oyqw0OFb} -mdfp=C:/Users/m91110/.mchp_packs/Microchip/dsPIC33CK-MP_DFP/1.13.366/xc16 
    WORKING_DIRECTORY ${DEPENDENT_TARGET_DIRdspic33c_touch_can_lin_curiosity_oob_default_oyqw0OFb}
    DEPENDS ${DEPENDENT_DEPENDENT_TARGET_ELFdspic33c_touch_can_lin_curiosity_oob_default_oyqw0OFb})
add_custom_target(
    dependent_produced_source_artifactdspic33c_touch_can_lin_curiosity_oob_default_oyqw0OFb 
    DEPENDS ${DEPENDENT_TARGET_DIRdspic33c_touch_can_lin_curiosity_oob_default_oyqw0OFb}/${sourceFileNamedspic33c_touch_can_lin_curiosity_oob_default_oyqw0OFb}.s
    )
