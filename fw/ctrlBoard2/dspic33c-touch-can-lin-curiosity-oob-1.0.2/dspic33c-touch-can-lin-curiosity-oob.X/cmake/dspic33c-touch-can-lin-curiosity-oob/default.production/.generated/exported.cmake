set(DEPENDENT_MP_BIN2HEXdspic33c_touch_can_lin_curiosity_oob_default_Uj99OWYm "c:/Program Files/Microchip/xc-dsc/v4.00/bin/xc-dsc-bin2hex.exe")
set(DEPENDENT_DEPENDENT_TARGET_ELFdspic33c_touch_can_lin_curiosity_oob_default_Uj99OWYm ${CMAKE_CURRENT_LIST_DIR}/../../../../out/dspic33c-touch-can-lin-curiosity-oob/production/default-production.elf)
set(DEPENDENT_TARGET_DIRdspic33c_touch_can_lin_curiosity_oob_default_Uj99OWYm ${CMAKE_CURRENT_LIST_DIR}/../../../../out/dspic33c-touch-can-lin-curiosity-oob/production)
set(DEPENDENT_BYPRODUCTSdspic33c_touch_can_lin_curiosity_oob_default_Uj99OWYm ${DEPENDENT_TARGET_DIRdspic33c_touch_can_lin_curiosity_oob_default_Uj99OWYm}/${sourceFileNamedspic33c_touch_can_lin_curiosity_oob_default_Uj99OWYm}.s)
add_custom_command(
    OUTPUT ${DEPENDENT_TARGET_DIRdspic33c_touch_can_lin_curiosity_oob_default_Uj99OWYm}/${sourceFileNamedspic33c_touch_can_lin_curiosity_oob_default_Uj99OWYm}.s
    COMMAND ${DEPENDENT_MP_BIN2HEXdspic33c_touch_can_lin_curiosity_oob_default_Uj99OWYm} ${DEPENDENT_DEPENDENT_TARGET_ELFdspic33c_touch_can_lin_curiosity_oob_default_Uj99OWYm} --image ${sourceFileNamedspic33c_touch_can_lin_curiosity_oob_default_Uj99OWYm} ${addressdspic33c_touch_can_lin_curiosity_oob_default_Uj99OWYm} ${modedspic33c_touch_can_lin_curiosity_oob_default_Uj99OWYm} -mdfp=C:/Users/M91110/.mchp_packs/Microchip/dsPIC33CK-MP_DFP/1.16.521/xc16 
    WORKING_DIRECTORY ${DEPENDENT_TARGET_DIRdspic33c_touch_can_lin_curiosity_oob_default_Uj99OWYm}
    DEPENDS ${DEPENDENT_DEPENDENT_TARGET_ELFdspic33c_touch_can_lin_curiosity_oob_default_Uj99OWYm})
add_custom_target(
    dependent_produced_source_artifactdspic33c_touch_can_lin_curiosity_oob_default_Uj99OWYm 
    DEPENDS ${DEPENDENT_TARGET_DIRdspic33c_touch_can_lin_curiosity_oob_default_Uj99OWYm}/${sourceFileNamedspic33c_touch_can_lin_curiosity_oob_default_Uj99OWYm}.s
    )
