set(DEPENDENT_MP_BIN2HEXdspic33c_touch_can_lin_curiosity_oob_default_4OOTjINs "c:/Program Files/Microchip/xc-dsc/v3.31.01/bin/xc-dsc-bin2hex.exe")
set(DEPENDENT_DEPENDENT_TARGET_ELFdspic33c_touch_can_lin_curiosity_oob_default_4OOTjINs ${CMAKE_CURRENT_LIST_DIR}/../../../../out/dspic33c-touch-can-lin-curiosity-oob/production/default-production.elf)
set(DEPENDENT_TARGET_DIRdspic33c_touch_can_lin_curiosity_oob_default_4OOTjINs ${CMAKE_CURRENT_LIST_DIR}/../../../../out/dspic33c-touch-can-lin-curiosity-oob/production)
set(DEPENDENT_BYPRODUCTSdspic33c_touch_can_lin_curiosity_oob_default_4OOTjINs ${DEPENDENT_TARGET_DIRdspic33c_touch_can_lin_curiosity_oob_default_4OOTjINs}/${sourceFileNamedspic33c_touch_can_lin_curiosity_oob_default_4OOTjINs}.s)
add_custom_command(
    OUTPUT ${DEPENDENT_TARGET_DIRdspic33c_touch_can_lin_curiosity_oob_default_4OOTjINs}/${sourceFileNamedspic33c_touch_can_lin_curiosity_oob_default_4OOTjINs}.s
    COMMAND ${DEPENDENT_MP_BIN2HEXdspic33c_touch_can_lin_curiosity_oob_default_4OOTjINs} ${DEPENDENT_DEPENDENT_TARGET_ELFdspic33c_touch_can_lin_curiosity_oob_default_4OOTjINs} --image ${sourceFileNamedspic33c_touch_can_lin_curiosity_oob_default_4OOTjINs} ${addressdspic33c_touch_can_lin_curiosity_oob_default_4OOTjINs} ${modedspic33c_touch_can_lin_curiosity_oob_default_4OOTjINs} -mdfp=C:/Users/M91110/.mchp_packs/Microchip/dsPIC33CK-MP_DFP/1.15.423/xc16 
    WORKING_DIRECTORY ${DEPENDENT_TARGET_DIRdspic33c_touch_can_lin_curiosity_oob_default_4OOTjINs}
    DEPENDS ${DEPENDENT_DEPENDENT_TARGET_ELFdspic33c_touch_can_lin_curiosity_oob_default_4OOTjINs})
add_custom_target(
    dependent_produced_source_artifactdspic33c_touch_can_lin_curiosity_oob_default_4OOTjINs 
    DEPENDS ${DEPENDENT_TARGET_DIRdspic33c_touch_can_lin_curiosity_oob_default_4OOTjINs}/${sourceFileNamedspic33c_touch_can_lin_curiosity_oob_default_4OOTjINs}.s
    )
