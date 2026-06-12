#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/cdvc_drone_duct.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/cdvc_drone_duct.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=mcc_generated_files/adc/src/adc1.c mcc_generated_files/cmp/src/cmp1.c mcc_generated_files/mcp802x/src/MCP802X_task.c mcc_generated_files/mcp802x/src/mcp8021.c mcc_generated_files/motorBench/commutation/atpll.c mcc_generated_files/motorBench/hal/hardware_access_functions.c mcc_generated_files/motorBench/hal/mcaf_pin_manager.c mcc_generated_files/motorBench/math/sqrt.c mcc_generated_files/motorBench/metadata/data_model_snapshot.c mcc_generated_files/motorBench/parameters/init_params.c mcc_generated_files/motorBench/adc_compensation.c mcc_generated_files/motorBench/board_service.c mcc_generated_files/motorBench/gate_drive.c mcc_generated_files/motorBench/commutation.c mcc_generated_files/motorBench/current_measure.c mcc_generated_files/motorBench/diagnostics.c mcc_generated_files/motorBench/fault_detect.c mcc_generated_files/motorBench/fault_handle.c mcc_generated_files/motorBench/foc.c mcc_generated_files/motorBench/isr.c mcc_generated_files/motorBench/math_asm.s mcc_generated_files/motorBench/mcaf_sample_application.c mcc_generated_files/motorBench/mcaf_main.c mcc_generated_files/motorBench/mcaf_traps.c mcc_generated_files/motorBench/mcapi.c mcc_generated_files/motorBench/monitor.c mcc_generated_files/motorBench/recover.c mcc_generated_files/motorBench/sat_PI.c mcc_generated_files/motorBench/stall_detect.c mcc_generated_files/motorBench/startup.c mcc_generated_files/motorBench/state_machine.c mcc_generated_files/motorBench/system_init.c mcc_generated_files/motorBench/system_state.c mcc_generated_files/motorBench/test_harness.c mcc_generated_files/motorBench/test_harness_timestamps.c mcc_generated_files/motorBench/ui.c mcc_generated_files/opa/src/opa1.c mcc_generated_files/opa/src/opa2.c mcc_generated_files/opa/src/opa3.c mcc_generated_files/pwm_hs/src/pwm.c mcc_generated_files/system/src/clock.c mcc_generated_files/system/src/config_bits.c mcc_generated_files/system/src/system.c mcc_generated_files/system/src/pins.c mcc_generated_files/system/src/traps.c mcc_generated_files/system/src/where_was_i.s mcc_generated_files/system/src/interrupt.c mcc_generated_files/system/src/dmt_asm.s mcc_generated_files/system/src/dmt.c mcc_generated_files/system/src/reset.c mcc_generated_files/timer/src/sccp1.c mcc_generated_files/timer/src/tmr1.c mcc_generated_files/uart/src/uart2.c mcc_generated_files/uart/src/uart3.c main.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/mcc_generated_files/adc/src/adc1.o ${OBJECTDIR}/mcc_generated_files/cmp/src/cmp1.o ${OBJECTDIR}/mcc_generated_files/mcp802x/src/MCP802X_task.o ${OBJECTDIR}/mcc_generated_files/mcp802x/src/mcp8021.o ${OBJECTDIR}/mcc_generated_files/motorBench/commutation/atpll.o ${OBJECTDIR}/mcc_generated_files/motorBench/hal/hardware_access_functions.o ${OBJECTDIR}/mcc_generated_files/motorBench/hal/mcaf_pin_manager.o ${OBJECTDIR}/mcc_generated_files/motorBench/math/sqrt.o ${OBJECTDIR}/mcc_generated_files/motorBench/metadata/data_model_snapshot.o ${OBJECTDIR}/mcc_generated_files/motorBench/parameters/init_params.o ${OBJECTDIR}/mcc_generated_files/motorBench/adc_compensation.o ${OBJECTDIR}/mcc_generated_files/motorBench/board_service.o ${OBJECTDIR}/mcc_generated_files/motorBench/gate_drive.o ${OBJECTDIR}/mcc_generated_files/motorBench/commutation.o ${OBJECTDIR}/mcc_generated_files/motorBench/current_measure.o ${OBJECTDIR}/mcc_generated_files/motorBench/diagnostics.o ${OBJECTDIR}/mcc_generated_files/motorBench/fault_detect.o ${OBJECTDIR}/mcc_generated_files/motorBench/fault_handle.o ${OBJECTDIR}/mcc_generated_files/motorBench/foc.o ${OBJECTDIR}/mcc_generated_files/motorBench/isr.o ${OBJECTDIR}/mcc_generated_files/motorBench/math_asm.o ${OBJECTDIR}/mcc_generated_files/motorBench/mcaf_sample_application.o ${OBJECTDIR}/mcc_generated_files/motorBench/mcaf_main.o ${OBJECTDIR}/mcc_generated_files/motorBench/mcaf_traps.o ${OBJECTDIR}/mcc_generated_files/motorBench/mcapi.o ${OBJECTDIR}/mcc_generated_files/motorBench/monitor.o ${OBJECTDIR}/mcc_generated_files/motorBench/recover.o ${OBJECTDIR}/mcc_generated_files/motorBench/sat_PI.o ${OBJECTDIR}/mcc_generated_files/motorBench/stall_detect.o ${OBJECTDIR}/mcc_generated_files/motorBench/startup.o ${OBJECTDIR}/mcc_generated_files/motorBench/state_machine.o ${OBJECTDIR}/mcc_generated_files/motorBench/system_init.o ${OBJECTDIR}/mcc_generated_files/motorBench/system_state.o ${OBJECTDIR}/mcc_generated_files/motorBench/test_harness.o ${OBJECTDIR}/mcc_generated_files/motorBench/test_harness_timestamps.o ${OBJECTDIR}/mcc_generated_files/motorBench/ui.o ${OBJECTDIR}/mcc_generated_files/opa/src/opa1.o ${OBJECTDIR}/mcc_generated_files/opa/src/opa2.o ${OBJECTDIR}/mcc_generated_files/opa/src/opa3.o ${OBJECTDIR}/mcc_generated_files/pwm_hs/src/pwm.o ${OBJECTDIR}/mcc_generated_files/system/src/clock.o ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o ${OBJECTDIR}/mcc_generated_files/system/src/system.o ${OBJECTDIR}/mcc_generated_files/system/src/pins.o ${OBJECTDIR}/mcc_generated_files/system/src/traps.o ${OBJECTDIR}/mcc_generated_files/system/src/where_was_i.o ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o ${OBJECTDIR}/mcc_generated_files/system/src/dmt_asm.o ${OBJECTDIR}/mcc_generated_files/system/src/dmt.o ${OBJECTDIR}/mcc_generated_files/system/src/reset.o ${OBJECTDIR}/mcc_generated_files/timer/src/sccp1.o ${OBJECTDIR}/mcc_generated_files/timer/src/tmr1.o ${OBJECTDIR}/mcc_generated_files/uart/src/uart2.o ${OBJECTDIR}/mcc_generated_files/uart/src/uart3.o ${OBJECTDIR}/main.o
POSSIBLE_DEPFILES=${OBJECTDIR}/mcc_generated_files/adc/src/adc1.o.d ${OBJECTDIR}/mcc_generated_files/cmp/src/cmp1.o.d ${OBJECTDIR}/mcc_generated_files/mcp802x/src/MCP802X_task.o.d ${OBJECTDIR}/mcc_generated_files/mcp802x/src/mcp8021.o.d ${OBJECTDIR}/mcc_generated_files/motorBench/commutation/atpll.o.d ${OBJECTDIR}/mcc_generated_files/motorBench/hal/hardware_access_functions.o.d ${OBJECTDIR}/mcc_generated_files/motorBench/hal/mcaf_pin_manager.o.d ${OBJECTDIR}/mcc_generated_files/motorBench/math/sqrt.o.d ${OBJECTDIR}/mcc_generated_files/motorBench/metadata/data_model_snapshot.o.d ${OBJECTDIR}/mcc_generated_files/motorBench/parameters/init_params.o.d ${OBJECTDIR}/mcc_generated_files/motorBench/adc_compensation.o.d ${OBJECTDIR}/mcc_generated_files/motorBench/board_service.o.d ${OBJECTDIR}/mcc_generated_files/motorBench/gate_drive.o.d ${OBJECTDIR}/mcc_generated_files/motorBench/commutation.o.d ${OBJECTDIR}/mcc_generated_files/motorBench/current_measure.o.d ${OBJECTDIR}/mcc_generated_files/motorBench/diagnostics.o.d ${OBJECTDIR}/mcc_generated_files/motorBench/fault_detect.o.d ${OBJECTDIR}/mcc_generated_files/motorBench/fault_handle.o.d ${OBJECTDIR}/mcc_generated_files/motorBench/foc.o.d ${OBJECTDIR}/mcc_generated_files/motorBench/isr.o.d ${OBJECTDIR}/mcc_generated_files/motorBench/math_asm.o.d ${OBJECTDIR}/mcc_generated_files/motorBench/mcaf_sample_application.o.d ${OBJECTDIR}/mcc_generated_files/motorBench/mcaf_main.o.d ${OBJECTDIR}/mcc_generated_files/motorBench/mcaf_traps.o.d ${OBJECTDIR}/mcc_generated_files/motorBench/mcapi.o.d ${OBJECTDIR}/mcc_generated_files/motorBench/monitor.o.d ${OBJECTDIR}/mcc_generated_files/motorBench/recover.o.d ${OBJECTDIR}/mcc_generated_files/motorBench/sat_PI.o.d ${OBJECTDIR}/mcc_generated_files/motorBench/stall_detect.o.d ${OBJECTDIR}/mcc_generated_files/motorBench/startup.o.d ${OBJECTDIR}/mcc_generated_files/motorBench/state_machine.o.d ${OBJECTDIR}/mcc_generated_files/motorBench/system_init.o.d ${OBJECTDIR}/mcc_generated_files/motorBench/system_state.o.d ${OBJECTDIR}/mcc_generated_files/motorBench/test_harness.o.d ${OBJECTDIR}/mcc_generated_files/motorBench/test_harness_timestamps.o.d ${OBJECTDIR}/mcc_generated_files/motorBench/ui.o.d ${OBJECTDIR}/mcc_generated_files/opa/src/opa1.o.d ${OBJECTDIR}/mcc_generated_files/opa/src/opa2.o.d ${OBJECTDIR}/mcc_generated_files/opa/src/opa3.o.d ${OBJECTDIR}/mcc_generated_files/pwm_hs/src/pwm.o.d ${OBJECTDIR}/mcc_generated_files/system/src/clock.o.d ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o.d ${OBJECTDIR}/mcc_generated_files/system/src/system.o.d ${OBJECTDIR}/mcc_generated_files/system/src/pins.o.d ${OBJECTDIR}/mcc_generated_files/system/src/traps.o.d ${OBJECTDIR}/mcc_generated_files/system/src/where_was_i.o.d ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o.d ${OBJECTDIR}/mcc_generated_files/system/src/dmt_asm.o.d ${OBJECTDIR}/mcc_generated_files/system/src/dmt.o.d ${OBJECTDIR}/mcc_generated_files/system/src/reset.o.d ${OBJECTDIR}/mcc_generated_files/timer/src/sccp1.o.d ${OBJECTDIR}/mcc_generated_files/timer/src/tmr1.o.d ${OBJECTDIR}/mcc_generated_files/uart/src/uart2.o.d ${OBJECTDIR}/mcc_generated_files/uart/src/uart3.o.d ${OBJECTDIR}/main.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/mcc_generated_files/adc/src/adc1.o ${OBJECTDIR}/mcc_generated_files/cmp/src/cmp1.o ${OBJECTDIR}/mcc_generated_files/mcp802x/src/MCP802X_task.o ${OBJECTDIR}/mcc_generated_files/mcp802x/src/mcp8021.o ${OBJECTDIR}/mcc_generated_files/motorBench/commutation/atpll.o ${OBJECTDIR}/mcc_generated_files/motorBench/hal/hardware_access_functions.o ${OBJECTDIR}/mcc_generated_files/motorBench/hal/mcaf_pin_manager.o ${OBJECTDIR}/mcc_generated_files/motorBench/math/sqrt.o ${OBJECTDIR}/mcc_generated_files/motorBench/metadata/data_model_snapshot.o ${OBJECTDIR}/mcc_generated_files/motorBench/parameters/init_params.o ${OBJECTDIR}/mcc_generated_files/motorBench/adc_compensation.o ${OBJECTDIR}/mcc_generated_files/motorBench/board_service.o ${OBJECTDIR}/mcc_generated_files/motorBench/gate_drive.o ${OBJECTDIR}/mcc_generated_files/motorBench/commutation.o ${OBJECTDIR}/mcc_generated_files/motorBench/current_measure.o ${OBJECTDIR}/mcc_generated_files/motorBench/diagnostics.o ${OBJECTDIR}/mcc_generated_files/motorBench/fault_detect.o ${OBJECTDIR}/mcc_generated_files/motorBench/fault_handle.o ${OBJECTDIR}/mcc_generated_files/motorBench/foc.o ${OBJECTDIR}/mcc_generated_files/motorBench/isr.o ${OBJECTDIR}/mcc_generated_files/motorBench/math_asm.o ${OBJECTDIR}/mcc_generated_files/motorBench/mcaf_sample_application.o ${OBJECTDIR}/mcc_generated_files/motorBench/mcaf_main.o ${OBJECTDIR}/mcc_generated_files/motorBench/mcaf_traps.o ${OBJECTDIR}/mcc_generated_files/motorBench/mcapi.o ${OBJECTDIR}/mcc_generated_files/motorBench/monitor.o ${OBJECTDIR}/mcc_generated_files/motorBench/recover.o ${OBJECTDIR}/mcc_generated_files/motorBench/sat_PI.o ${OBJECTDIR}/mcc_generated_files/motorBench/stall_detect.o ${OBJECTDIR}/mcc_generated_files/motorBench/startup.o ${OBJECTDIR}/mcc_generated_files/motorBench/state_machine.o ${OBJECTDIR}/mcc_generated_files/motorBench/system_init.o ${OBJECTDIR}/mcc_generated_files/motorBench/system_state.o ${OBJECTDIR}/mcc_generated_files/motorBench/test_harness.o ${OBJECTDIR}/mcc_generated_files/motorBench/test_harness_timestamps.o ${OBJECTDIR}/mcc_generated_files/motorBench/ui.o ${OBJECTDIR}/mcc_generated_files/opa/src/opa1.o ${OBJECTDIR}/mcc_generated_files/opa/src/opa2.o ${OBJECTDIR}/mcc_generated_files/opa/src/opa3.o ${OBJECTDIR}/mcc_generated_files/pwm_hs/src/pwm.o ${OBJECTDIR}/mcc_generated_files/system/src/clock.o ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o ${OBJECTDIR}/mcc_generated_files/system/src/system.o ${OBJECTDIR}/mcc_generated_files/system/src/pins.o ${OBJECTDIR}/mcc_generated_files/system/src/traps.o ${OBJECTDIR}/mcc_generated_files/system/src/where_was_i.o ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o ${OBJECTDIR}/mcc_generated_files/system/src/dmt_asm.o ${OBJECTDIR}/mcc_generated_files/system/src/dmt.o ${OBJECTDIR}/mcc_generated_files/system/src/reset.o ${OBJECTDIR}/mcc_generated_files/timer/src/sccp1.o ${OBJECTDIR}/mcc_generated_files/timer/src/tmr1.o ${OBJECTDIR}/mcc_generated_files/uart/src/uart2.o ${OBJECTDIR}/mcc_generated_files/uart/src/uart3.o ${OBJECTDIR}/main.o

# Source Files
SOURCEFILES=mcc_generated_files/adc/src/adc1.c mcc_generated_files/cmp/src/cmp1.c mcc_generated_files/mcp802x/src/MCP802X_task.c mcc_generated_files/mcp802x/src/mcp8021.c mcc_generated_files/motorBench/commutation/atpll.c mcc_generated_files/motorBench/hal/hardware_access_functions.c mcc_generated_files/motorBench/hal/mcaf_pin_manager.c mcc_generated_files/motorBench/math/sqrt.c mcc_generated_files/motorBench/metadata/data_model_snapshot.c mcc_generated_files/motorBench/parameters/init_params.c mcc_generated_files/motorBench/adc_compensation.c mcc_generated_files/motorBench/board_service.c mcc_generated_files/motorBench/gate_drive.c mcc_generated_files/motorBench/commutation.c mcc_generated_files/motorBench/current_measure.c mcc_generated_files/motorBench/diagnostics.c mcc_generated_files/motorBench/fault_detect.c mcc_generated_files/motorBench/fault_handle.c mcc_generated_files/motorBench/foc.c mcc_generated_files/motorBench/isr.c mcc_generated_files/motorBench/math_asm.s mcc_generated_files/motorBench/mcaf_sample_application.c mcc_generated_files/motorBench/mcaf_main.c mcc_generated_files/motorBench/mcaf_traps.c mcc_generated_files/motorBench/mcapi.c mcc_generated_files/motorBench/monitor.c mcc_generated_files/motorBench/recover.c mcc_generated_files/motorBench/sat_PI.c mcc_generated_files/motorBench/stall_detect.c mcc_generated_files/motorBench/startup.c mcc_generated_files/motorBench/state_machine.c mcc_generated_files/motorBench/system_init.c mcc_generated_files/motorBench/system_state.c mcc_generated_files/motorBench/test_harness.c mcc_generated_files/motorBench/test_harness_timestamps.c mcc_generated_files/motorBench/ui.c mcc_generated_files/opa/src/opa1.c mcc_generated_files/opa/src/opa2.c mcc_generated_files/opa/src/opa3.c mcc_generated_files/pwm_hs/src/pwm.c mcc_generated_files/system/src/clock.c mcc_generated_files/system/src/config_bits.c mcc_generated_files/system/src/system.c mcc_generated_files/system/src/pins.c mcc_generated_files/system/src/traps.c mcc_generated_files/system/src/where_was_i.s mcc_generated_files/system/src/interrupt.c mcc_generated_files/system/src/dmt_asm.s mcc_generated_files/system/src/dmt.c mcc_generated_files/system/src/reset.c mcc_generated_files/timer/src/sccp1.c mcc_generated_files/timer/src/tmr1.c mcc_generated_files/uart/src/uart2.c mcc_generated_files/uart/src/uart3.c main.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/cdvc_drone_duct.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=33CDVC256MP506
MP_LINKER_FILE_OPTION=,--script=p33CDVC256MP506.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/mcc_generated_files/adc/src/adc1.o: mcc_generated_files/adc/src/adc1.c  .generated_files/flags/default/572c2fd8e2c654c3fe828288d0a34cc76ed6ad12 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/adc/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/adc/src/adc1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/adc/src/adc1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/adc/src/adc1.c  -o ${OBJECTDIR}/mcc_generated_files/adc/src/adc1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/adc/src/adc1.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/cmp/src/cmp1.o: mcc_generated_files/cmp/src/cmp1.c  .generated_files/flags/default/a4a0d0dbd33a612a083a0ddfbd89b9f29c45bead .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/cmp/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/cmp/src/cmp1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/cmp/src/cmp1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/cmp/src/cmp1.c  -o ${OBJECTDIR}/mcc_generated_files/cmp/src/cmp1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/cmp/src/cmp1.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/mcp802x/src/MCP802X_task.o: mcc_generated_files/mcp802x/src/MCP802X_task.c  .generated_files/flags/default/64be8bbc5ca627d2921683c15cd8e0cd7f58077c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/mcp802x/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcp802x/src/MCP802X_task.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcp802x/src/MCP802X_task.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/mcp802x/src/MCP802X_task.c  -o ${OBJECTDIR}/mcc_generated_files/mcp802x/src/MCP802X_task.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/mcp802x/src/MCP802X_task.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/mcp802x/src/mcp8021.o: mcc_generated_files/mcp802x/src/mcp8021.c  .generated_files/flags/default/54353af521851a904771262598f1e023b3dfbf92 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/mcp802x/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcp802x/src/mcp8021.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcp802x/src/mcp8021.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/mcp802x/src/mcp8021.c  -o ${OBJECTDIR}/mcc_generated_files/mcp802x/src/mcp8021.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/mcp802x/src/mcp8021.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/motorBench/commutation/atpll.o: mcc_generated_files/motorBench/commutation/atpll.c  .generated_files/flags/default/e517a9c0f3bc411217a02a145e19867748a88190 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/motorBench/commutation" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/commutation/atpll.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/commutation/atpll.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/motorBench/commutation/atpll.c  -o ${OBJECTDIR}/mcc_generated_files/motorBench/commutation/atpll.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/motorBench/commutation/atpll.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/motorBench/hal/hardware_access_functions.o: mcc_generated_files/motorBench/hal/hardware_access_functions.c  .generated_files/flags/default/5cfec296a134f95fa093dd33e132b818d018f8aa .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/motorBench/hal" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/hal/hardware_access_functions.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/hal/hardware_access_functions.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/motorBench/hal/hardware_access_functions.c  -o ${OBJECTDIR}/mcc_generated_files/motorBench/hal/hardware_access_functions.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/motorBench/hal/hardware_access_functions.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/motorBench/hal/mcaf_pin_manager.o: mcc_generated_files/motorBench/hal/mcaf_pin_manager.c  .generated_files/flags/default/76f9ea1fd6aee7f194695b7d64d1f078aabfe7fa .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/motorBench/hal" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/hal/mcaf_pin_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/hal/mcaf_pin_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/motorBench/hal/mcaf_pin_manager.c  -o ${OBJECTDIR}/mcc_generated_files/motorBench/hal/mcaf_pin_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/motorBench/hal/mcaf_pin_manager.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/motorBench/math/sqrt.o: mcc_generated_files/motorBench/math/sqrt.c  .generated_files/flags/default/f3cfcf8a372f6e8c1d87cebfa5597dbe0dd0c760 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/motorBench/math" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/math/sqrt.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/math/sqrt.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/motorBench/math/sqrt.c  -o ${OBJECTDIR}/mcc_generated_files/motorBench/math/sqrt.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/motorBench/math/sqrt.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/motorBench/metadata/data_model_snapshot.o: mcc_generated_files/motorBench/metadata/data_model_snapshot.c  .generated_files/flags/default/2edeaef35c56d2ca13d0dbc9f7839105b0672617 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/motorBench/metadata" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/metadata/data_model_snapshot.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/metadata/data_model_snapshot.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/motorBench/metadata/data_model_snapshot.c  -o ${OBJECTDIR}/mcc_generated_files/motorBench/metadata/data_model_snapshot.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/motorBench/metadata/data_model_snapshot.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/motorBench/parameters/init_params.o: mcc_generated_files/motorBench/parameters/init_params.c  .generated_files/flags/default/ea8521698801f72cbc7c1306cb73827e2d68d698 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/motorBench/parameters" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/parameters/init_params.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/parameters/init_params.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/motorBench/parameters/init_params.c  -o ${OBJECTDIR}/mcc_generated_files/motorBench/parameters/init_params.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/motorBench/parameters/init_params.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/motorBench/adc_compensation.o: mcc_generated_files/motorBench/adc_compensation.c  .generated_files/flags/default/57bd4ccfe542e9acaa02dfdd2c9cbd3ecf073bbf .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/motorBench" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/adc_compensation.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/adc_compensation.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/motorBench/adc_compensation.c  -o ${OBJECTDIR}/mcc_generated_files/motorBench/adc_compensation.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/motorBench/adc_compensation.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/motorBench/board_service.o: mcc_generated_files/motorBench/board_service.c  .generated_files/flags/default/553e3c2adecec05051907be435f4572eb3458340 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/motorBench" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/board_service.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/board_service.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/motorBench/board_service.c  -o ${OBJECTDIR}/mcc_generated_files/motorBench/board_service.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/motorBench/board_service.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/motorBench/gate_drive.o: mcc_generated_files/motorBench/gate_drive.c  .generated_files/flags/default/780e403a711c09227fe9c7d3c489f717dc716a83 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/motorBench" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/gate_drive.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/gate_drive.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/motorBench/gate_drive.c  -o ${OBJECTDIR}/mcc_generated_files/motorBench/gate_drive.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/motorBench/gate_drive.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/motorBench/commutation.o: mcc_generated_files/motorBench/commutation.c  .generated_files/flags/default/629f0ebdfda738697474773721402d9df8931df9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/motorBench" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/commutation.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/commutation.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/motorBench/commutation.c  -o ${OBJECTDIR}/mcc_generated_files/motorBench/commutation.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/motorBench/commutation.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/motorBench/current_measure.o: mcc_generated_files/motorBench/current_measure.c  .generated_files/flags/default/3396258dba3dc8d71c56f98c9114dfce041ef46d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/motorBench" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/current_measure.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/current_measure.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/motorBench/current_measure.c  -o ${OBJECTDIR}/mcc_generated_files/motorBench/current_measure.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/motorBench/current_measure.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/motorBench/diagnostics.o: mcc_generated_files/motorBench/diagnostics.c  .generated_files/flags/default/937bab7499c95d3b87d2cfb68c01462132152a6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/motorBench" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/diagnostics.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/diagnostics.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/motorBench/diagnostics.c  -o ${OBJECTDIR}/mcc_generated_files/motorBench/diagnostics.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/motorBench/diagnostics.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/motorBench/fault_detect.o: mcc_generated_files/motorBench/fault_detect.c  .generated_files/flags/default/dcd043a58558aabb6e2ac9bc1e62b2a3c9d91245 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/motorBench" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/fault_detect.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/fault_detect.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/motorBench/fault_detect.c  -o ${OBJECTDIR}/mcc_generated_files/motorBench/fault_detect.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/motorBench/fault_detect.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/motorBench/fault_handle.o: mcc_generated_files/motorBench/fault_handle.c  .generated_files/flags/default/d8701704fce5846bd1bcbf7c636c460a323cbeb1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/motorBench" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/fault_handle.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/fault_handle.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/motorBench/fault_handle.c  -o ${OBJECTDIR}/mcc_generated_files/motorBench/fault_handle.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/motorBench/fault_handle.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/motorBench/foc.o: mcc_generated_files/motorBench/foc.c  .generated_files/flags/default/ff1df5c6eb19458c565f641a4f4e3aa273485ef2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/motorBench" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/foc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/foc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/motorBench/foc.c  -o ${OBJECTDIR}/mcc_generated_files/motorBench/foc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/motorBench/foc.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/motorBench/isr.o: mcc_generated_files/motorBench/isr.c  .generated_files/flags/default/9fb5ab9b1c346d8de67642398bc0d2bd1d097815 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/motorBench" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/isr.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/isr.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/motorBench/isr.c  -o ${OBJECTDIR}/mcc_generated_files/motorBench/isr.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/motorBench/isr.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/motorBench/mcaf_sample_application.o: mcc_generated_files/motorBench/mcaf_sample_application.c  .generated_files/flags/default/d0b085af84d2ce261547297b2fbdd586b9d794db .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/motorBench" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/mcaf_sample_application.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/mcaf_sample_application.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/motorBench/mcaf_sample_application.c  -o ${OBJECTDIR}/mcc_generated_files/motorBench/mcaf_sample_application.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/motorBench/mcaf_sample_application.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/motorBench/mcaf_main.o: mcc_generated_files/motorBench/mcaf_main.c  .generated_files/flags/default/cde3f368ad9159cfb62ecf7f00a25bf24f15c071 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/motorBench" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/mcaf_main.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/mcaf_main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/motorBench/mcaf_main.c  -o ${OBJECTDIR}/mcc_generated_files/motorBench/mcaf_main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/motorBench/mcaf_main.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/motorBench/mcaf_traps.o: mcc_generated_files/motorBench/mcaf_traps.c  .generated_files/flags/default/f4998e7a290c1ddf347531cea3f185d32d305929 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/motorBench" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/mcaf_traps.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/mcaf_traps.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/motorBench/mcaf_traps.c  -o ${OBJECTDIR}/mcc_generated_files/motorBench/mcaf_traps.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/motorBench/mcaf_traps.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/motorBench/mcapi.o: mcc_generated_files/motorBench/mcapi.c  .generated_files/flags/default/17c6993efb919b0081a6cacdd283505af21a2a7d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/motorBench" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/mcapi.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/mcapi.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/motorBench/mcapi.c  -o ${OBJECTDIR}/mcc_generated_files/motorBench/mcapi.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/motorBench/mcapi.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/motorBench/monitor.o: mcc_generated_files/motorBench/monitor.c  .generated_files/flags/default/5e5a0d97449d83f635e2252589198a3df6780828 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/motorBench" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/monitor.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/monitor.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/motorBench/monitor.c  -o ${OBJECTDIR}/mcc_generated_files/motorBench/monitor.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/motorBench/monitor.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/motorBench/recover.o: mcc_generated_files/motorBench/recover.c  .generated_files/flags/default/1dadd1a152c0e7bf468024d2dacbd044247534ec .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/motorBench" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/recover.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/recover.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/motorBench/recover.c  -o ${OBJECTDIR}/mcc_generated_files/motorBench/recover.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/motorBench/recover.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/motorBench/sat_PI.o: mcc_generated_files/motorBench/sat_PI.c  .generated_files/flags/default/663cbd27bf8e8b9f000841811865746095d29559 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/motorBench" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/sat_PI.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/sat_PI.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/motorBench/sat_PI.c  -o ${OBJECTDIR}/mcc_generated_files/motorBench/sat_PI.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/motorBench/sat_PI.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/motorBench/stall_detect.o: mcc_generated_files/motorBench/stall_detect.c  .generated_files/flags/default/8ed7eb2183a2b5ce94194bebddd00e6ef8055337 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/motorBench" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/stall_detect.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/stall_detect.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/motorBench/stall_detect.c  -o ${OBJECTDIR}/mcc_generated_files/motorBench/stall_detect.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/motorBench/stall_detect.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/motorBench/startup.o: mcc_generated_files/motorBench/startup.c  .generated_files/flags/default/2caa5955175002d83b471757952f3a57f229b4a8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/motorBench" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/startup.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/startup.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/motorBench/startup.c  -o ${OBJECTDIR}/mcc_generated_files/motorBench/startup.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/motorBench/startup.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/motorBench/state_machine.o: mcc_generated_files/motorBench/state_machine.c  .generated_files/flags/default/c0c5cffd6aa5233af8e5535bf316442d46504180 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/motorBench" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/state_machine.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/state_machine.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/motorBench/state_machine.c  -o ${OBJECTDIR}/mcc_generated_files/motorBench/state_machine.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/motorBench/state_machine.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/motorBench/system_init.o: mcc_generated_files/motorBench/system_init.c  .generated_files/flags/default/27a176223e7d0e6c348ea6e11d40c6dee8b7ad76 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/motorBench" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/system_init.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/system_init.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/motorBench/system_init.c  -o ${OBJECTDIR}/mcc_generated_files/motorBench/system_init.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/motorBench/system_init.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/motorBench/system_state.o: mcc_generated_files/motorBench/system_state.c  .generated_files/flags/default/6c0c8cdfe40d4f1e6ceae93d7fb698b5759eb112 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/motorBench" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/system_state.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/system_state.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/motorBench/system_state.c  -o ${OBJECTDIR}/mcc_generated_files/motorBench/system_state.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/motorBench/system_state.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/motorBench/test_harness.o: mcc_generated_files/motorBench/test_harness.c  .generated_files/flags/default/d0b6cd6a2ea05dfaea95498e083fa5bcc8683714 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/motorBench" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/test_harness.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/test_harness.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/motorBench/test_harness.c  -o ${OBJECTDIR}/mcc_generated_files/motorBench/test_harness.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/motorBench/test_harness.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/motorBench/test_harness_timestamps.o: mcc_generated_files/motorBench/test_harness_timestamps.c  .generated_files/flags/default/f3008ce8e5ed625101b71a1f803d5305c32c60aa .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/motorBench" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/test_harness_timestamps.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/test_harness_timestamps.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/motorBench/test_harness_timestamps.c  -o ${OBJECTDIR}/mcc_generated_files/motorBench/test_harness_timestamps.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/motorBench/test_harness_timestamps.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/motorBench/ui.o: mcc_generated_files/motorBench/ui.c  .generated_files/flags/default/797d526748cad6d6d6935290a9400281d2759f2a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/motorBench" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/ui.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/ui.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/motorBench/ui.c  -o ${OBJECTDIR}/mcc_generated_files/motorBench/ui.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/motorBench/ui.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/opa/src/opa1.o: mcc_generated_files/opa/src/opa1.c  .generated_files/flags/default/2c57798eaf104eac5048ff66409b54307b59d9eb .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/opa/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/opa/src/opa1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/opa/src/opa1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/opa/src/opa1.c  -o ${OBJECTDIR}/mcc_generated_files/opa/src/opa1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/opa/src/opa1.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/opa/src/opa2.o: mcc_generated_files/opa/src/opa2.c  .generated_files/flags/default/5b2473e372c539b564a1e78431f0aa724eab058f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/opa/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/opa/src/opa2.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/opa/src/opa2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/opa/src/opa2.c  -o ${OBJECTDIR}/mcc_generated_files/opa/src/opa2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/opa/src/opa2.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/opa/src/opa3.o: mcc_generated_files/opa/src/opa3.c  .generated_files/flags/default/85a5ead83e4cc41836911acf0005aa09a5ab2f79 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/opa/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/opa/src/opa3.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/opa/src/opa3.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/opa/src/opa3.c  -o ${OBJECTDIR}/mcc_generated_files/opa/src/opa3.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/opa/src/opa3.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/pwm_hs/src/pwm.o: mcc_generated_files/pwm_hs/src/pwm.c  .generated_files/flags/default/26e8d8fda501570752c454e4e18558718f00b570 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/pwm_hs/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pwm_hs/src/pwm.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pwm_hs/src/pwm.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/pwm_hs/src/pwm.c  -o ${OBJECTDIR}/mcc_generated_files/pwm_hs/src/pwm.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/pwm_hs/src/pwm.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/clock.o: mcc_generated_files/system/src/clock.c  .generated_files/flags/default/7d6e102f155732d03148be9fa037865ea0c91784 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/clock.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/clock.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/clock.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/clock.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/clock.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o: mcc_generated_files/system/src/config_bits.c  .generated_files/flags/default/86c4c79db6758df9cac1ffd0c6179d12933d5a13 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/config_bits.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/system.o: mcc_generated_files/system/src/system.c  .generated_files/flags/default/6f98cc7d8028e59bb3709081b184bda35ca99bef .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/system.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/system.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/system.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/pins.o: mcc_generated_files/system/src/pins.c  .generated_files/flags/default/afe09b8afc95bd853009279709cf4a9db3477952 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/pins.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/pins.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/pins.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/pins.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/pins.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/traps.o: mcc_generated_files/system/src/traps.c  .generated_files/flags/default/1bc466f430440a4fb321459deeca65234f2215cf .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/traps.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/traps.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/traps.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/traps.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/traps.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o: mcc_generated_files/system/src/interrupt.c  .generated_files/flags/default/b9b5d0961c710f298dba3bb61db2c30f707ac205 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/interrupt.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/dmt.o: mcc_generated_files/system/src/dmt.c  .generated_files/flags/default/863318a7af0de0ec16666f65539a3a80befbd7f9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/dmt.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/dmt.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/dmt.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/dmt.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/dmt.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/reset.o: mcc_generated_files/system/src/reset.c  .generated_files/flags/default/41f8c148eaaa83a765d0e9ae07291022a99bc328 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/reset.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/reset.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/reset.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/reset.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/reset.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/timer/src/sccp1.o: mcc_generated_files/timer/src/sccp1.c  .generated_files/flags/default/fa9e109e81ff99adcafd964caa58e902463e68f1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/timer/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/timer/src/sccp1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/timer/src/sccp1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/timer/src/sccp1.c  -o ${OBJECTDIR}/mcc_generated_files/timer/src/sccp1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/timer/src/sccp1.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/timer/src/tmr1.o: mcc_generated_files/timer/src/tmr1.c  .generated_files/flags/default/7865ec1871aa9cac2ea90bbd141e45875cdafd58 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/timer/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/timer/src/tmr1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/timer/src/tmr1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/timer/src/tmr1.c  -o ${OBJECTDIR}/mcc_generated_files/timer/src/tmr1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/timer/src/tmr1.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/uart/src/uart2.o: mcc_generated_files/uart/src/uart2.c  .generated_files/flags/default/e7fb9b0dbff2e51907add80f431d521e8338afd0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/uart/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart/src/uart2.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart/src/uart2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/uart/src/uart2.c  -o ${OBJECTDIR}/mcc_generated_files/uart/src/uart2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/uart/src/uart2.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/uart/src/uart3.o: mcc_generated_files/uart/src/uart3.c  .generated_files/flags/default/f3a9c4c5e306e4d6bbe13d23c53492389f0773c5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/uart/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart/src/uart3.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart/src/uart3.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/uart/src/uart3.c  -o ${OBJECTDIR}/mcc_generated_files/uart/src/uart3.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/uart/src/uart3.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/67ba4af19545ed1e2877e99b56a36832f27fa655 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/mcc_generated_files/adc/src/adc1.o: mcc_generated_files/adc/src/adc1.c  .generated_files/flags/default/9f5341c52c410eee13b1fbb8027edad78e24485e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/adc/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/adc/src/adc1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/adc/src/adc1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/adc/src/adc1.c  -o ${OBJECTDIR}/mcc_generated_files/adc/src/adc1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/adc/src/adc1.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/cmp/src/cmp1.o: mcc_generated_files/cmp/src/cmp1.c  .generated_files/flags/default/d9cb9a38124faa961e2e56880202cf14a20c9d6b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/cmp/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/cmp/src/cmp1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/cmp/src/cmp1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/cmp/src/cmp1.c  -o ${OBJECTDIR}/mcc_generated_files/cmp/src/cmp1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/cmp/src/cmp1.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/mcp802x/src/MCP802X_task.o: mcc_generated_files/mcp802x/src/MCP802X_task.c  .generated_files/flags/default/ae5730e072480e51276e0296f6e9d39196a29fef .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/mcp802x/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcp802x/src/MCP802X_task.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcp802x/src/MCP802X_task.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/mcp802x/src/MCP802X_task.c  -o ${OBJECTDIR}/mcc_generated_files/mcp802x/src/MCP802X_task.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/mcp802x/src/MCP802X_task.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/mcp802x/src/mcp8021.o: mcc_generated_files/mcp802x/src/mcp8021.c  .generated_files/flags/default/d5e316eae4e45a3b9d80b0ed8756db8109267a5b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/mcp802x/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcp802x/src/mcp8021.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcp802x/src/mcp8021.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/mcp802x/src/mcp8021.c  -o ${OBJECTDIR}/mcc_generated_files/mcp802x/src/mcp8021.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/mcp802x/src/mcp8021.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/motorBench/commutation/atpll.o: mcc_generated_files/motorBench/commutation/atpll.c  .generated_files/flags/default/3400e84833bd77b654d8ebb7a88e96185fdf9e14 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/motorBench/commutation" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/commutation/atpll.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/commutation/atpll.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/motorBench/commutation/atpll.c  -o ${OBJECTDIR}/mcc_generated_files/motorBench/commutation/atpll.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/motorBench/commutation/atpll.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/motorBench/hal/hardware_access_functions.o: mcc_generated_files/motorBench/hal/hardware_access_functions.c  .generated_files/flags/default/3c6884a728ee54107343a25d81cfbbd08b739df7 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/motorBench/hal" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/hal/hardware_access_functions.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/hal/hardware_access_functions.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/motorBench/hal/hardware_access_functions.c  -o ${OBJECTDIR}/mcc_generated_files/motorBench/hal/hardware_access_functions.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/motorBench/hal/hardware_access_functions.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/motorBench/hal/mcaf_pin_manager.o: mcc_generated_files/motorBench/hal/mcaf_pin_manager.c  .generated_files/flags/default/398fa96d389fb42c2899121cf76de7a95e2e5098 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/motorBench/hal" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/hal/mcaf_pin_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/hal/mcaf_pin_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/motorBench/hal/mcaf_pin_manager.c  -o ${OBJECTDIR}/mcc_generated_files/motorBench/hal/mcaf_pin_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/motorBench/hal/mcaf_pin_manager.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/motorBench/math/sqrt.o: mcc_generated_files/motorBench/math/sqrt.c  .generated_files/flags/default/99c4caaf920c4170d1947b8eb673743323a73c07 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/motorBench/math" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/math/sqrt.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/math/sqrt.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/motorBench/math/sqrt.c  -o ${OBJECTDIR}/mcc_generated_files/motorBench/math/sqrt.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/motorBench/math/sqrt.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/motorBench/metadata/data_model_snapshot.o: mcc_generated_files/motorBench/metadata/data_model_snapshot.c  .generated_files/flags/default/dc148456e511b91023d0ac40128d518e0205dcf7 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/motorBench/metadata" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/metadata/data_model_snapshot.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/metadata/data_model_snapshot.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/motorBench/metadata/data_model_snapshot.c  -o ${OBJECTDIR}/mcc_generated_files/motorBench/metadata/data_model_snapshot.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/motorBench/metadata/data_model_snapshot.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/motorBench/parameters/init_params.o: mcc_generated_files/motorBench/parameters/init_params.c  .generated_files/flags/default/4a1da4662f90fa284399661195b46e993e642508 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/motorBench/parameters" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/parameters/init_params.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/parameters/init_params.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/motorBench/parameters/init_params.c  -o ${OBJECTDIR}/mcc_generated_files/motorBench/parameters/init_params.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/motorBench/parameters/init_params.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/motorBench/adc_compensation.o: mcc_generated_files/motorBench/adc_compensation.c  .generated_files/flags/default/3326a656e33cf389bd04efe1120740f354d57fd1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/motorBench" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/adc_compensation.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/adc_compensation.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/motorBench/adc_compensation.c  -o ${OBJECTDIR}/mcc_generated_files/motorBench/adc_compensation.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/motorBench/adc_compensation.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/motorBench/board_service.o: mcc_generated_files/motorBench/board_service.c  .generated_files/flags/default/138fd0be5bacb78efc0fb6c45c633e61c0eb72cd .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/motorBench" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/board_service.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/board_service.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/motorBench/board_service.c  -o ${OBJECTDIR}/mcc_generated_files/motorBench/board_service.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/motorBench/board_service.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/motorBench/gate_drive.o: mcc_generated_files/motorBench/gate_drive.c  .generated_files/flags/default/b0d621d64329bd4ddd21257de1df22c6192a77d1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/motorBench" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/gate_drive.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/gate_drive.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/motorBench/gate_drive.c  -o ${OBJECTDIR}/mcc_generated_files/motorBench/gate_drive.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/motorBench/gate_drive.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/motorBench/commutation.o: mcc_generated_files/motorBench/commutation.c  .generated_files/flags/default/4c3160c153b9ab6574e51c3c2282f6fe6f9554db .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/motorBench" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/commutation.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/commutation.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/motorBench/commutation.c  -o ${OBJECTDIR}/mcc_generated_files/motorBench/commutation.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/motorBench/commutation.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/motorBench/current_measure.o: mcc_generated_files/motorBench/current_measure.c  .generated_files/flags/default/32da80f74229ee9c8ac5399a50410d2fe7abc900 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/motorBench" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/current_measure.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/current_measure.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/motorBench/current_measure.c  -o ${OBJECTDIR}/mcc_generated_files/motorBench/current_measure.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/motorBench/current_measure.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/motorBench/diagnostics.o: mcc_generated_files/motorBench/diagnostics.c  .generated_files/flags/default/1376963c8e678f07e0dea4bd9fc94c1bc0f3a27f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/motorBench" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/diagnostics.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/diagnostics.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/motorBench/diagnostics.c  -o ${OBJECTDIR}/mcc_generated_files/motorBench/diagnostics.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/motorBench/diagnostics.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/motorBench/fault_detect.o: mcc_generated_files/motorBench/fault_detect.c  .generated_files/flags/default/66c73461f9a7bcd02a3260249cb3846ff348c033 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/motorBench" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/fault_detect.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/fault_detect.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/motorBench/fault_detect.c  -o ${OBJECTDIR}/mcc_generated_files/motorBench/fault_detect.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/motorBench/fault_detect.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/motorBench/fault_handle.o: mcc_generated_files/motorBench/fault_handle.c  .generated_files/flags/default/31c827085ccf953a77cf3ac4594e269e81db21f4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/motorBench" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/fault_handle.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/fault_handle.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/motorBench/fault_handle.c  -o ${OBJECTDIR}/mcc_generated_files/motorBench/fault_handle.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/motorBench/fault_handle.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/motorBench/foc.o: mcc_generated_files/motorBench/foc.c  .generated_files/flags/default/6566a731ba47c56fa37ee28b458995cceefb83f9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/motorBench" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/foc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/foc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/motorBench/foc.c  -o ${OBJECTDIR}/mcc_generated_files/motorBench/foc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/motorBench/foc.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/motorBench/isr.o: mcc_generated_files/motorBench/isr.c  .generated_files/flags/default/c681ba21128e1116c91dd1a0d8014653cc755841 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/motorBench" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/isr.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/isr.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/motorBench/isr.c  -o ${OBJECTDIR}/mcc_generated_files/motorBench/isr.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/motorBench/isr.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/motorBench/mcaf_sample_application.o: mcc_generated_files/motorBench/mcaf_sample_application.c  .generated_files/flags/default/a335904b7d4d39aa2e24919a364de43b320ccd4e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/motorBench" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/mcaf_sample_application.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/mcaf_sample_application.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/motorBench/mcaf_sample_application.c  -o ${OBJECTDIR}/mcc_generated_files/motorBench/mcaf_sample_application.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/motorBench/mcaf_sample_application.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/motorBench/mcaf_main.o: mcc_generated_files/motorBench/mcaf_main.c  .generated_files/flags/default/ba77f39bf3f5c31817d789776e32eea3e3fc6e36 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/motorBench" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/mcaf_main.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/mcaf_main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/motorBench/mcaf_main.c  -o ${OBJECTDIR}/mcc_generated_files/motorBench/mcaf_main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/motorBench/mcaf_main.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/motorBench/mcaf_traps.o: mcc_generated_files/motorBench/mcaf_traps.c  .generated_files/flags/default/940b20c791b653ed5b39ecfddbdb1cb27d502d02 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/motorBench" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/mcaf_traps.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/mcaf_traps.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/motorBench/mcaf_traps.c  -o ${OBJECTDIR}/mcc_generated_files/motorBench/mcaf_traps.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/motorBench/mcaf_traps.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/motorBench/mcapi.o: mcc_generated_files/motorBench/mcapi.c  .generated_files/flags/default/5ae6dfce0f52bec059cc004135b4d4350faab708 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/motorBench" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/mcapi.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/mcapi.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/motorBench/mcapi.c  -o ${OBJECTDIR}/mcc_generated_files/motorBench/mcapi.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/motorBench/mcapi.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/motorBench/monitor.o: mcc_generated_files/motorBench/monitor.c  .generated_files/flags/default/1a991d97ab823ac9776b18b24e3f82c503b465eb .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/motorBench" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/monitor.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/monitor.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/motorBench/monitor.c  -o ${OBJECTDIR}/mcc_generated_files/motorBench/monitor.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/motorBench/monitor.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/motorBench/recover.o: mcc_generated_files/motorBench/recover.c  .generated_files/flags/default/c9381957c396190ce95f96fcc73c82e0a24838ac .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/motorBench" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/recover.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/recover.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/motorBench/recover.c  -o ${OBJECTDIR}/mcc_generated_files/motorBench/recover.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/motorBench/recover.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/motorBench/sat_PI.o: mcc_generated_files/motorBench/sat_PI.c  .generated_files/flags/default/fc964d59b3985119b3967aaedfcb64449b554f10 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/motorBench" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/sat_PI.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/sat_PI.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/motorBench/sat_PI.c  -o ${OBJECTDIR}/mcc_generated_files/motorBench/sat_PI.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/motorBench/sat_PI.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/motorBench/stall_detect.o: mcc_generated_files/motorBench/stall_detect.c  .generated_files/flags/default/264209becef3ee30b8ef202f81d20c45afc33d1d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/motorBench" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/stall_detect.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/stall_detect.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/motorBench/stall_detect.c  -o ${OBJECTDIR}/mcc_generated_files/motorBench/stall_detect.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/motorBench/stall_detect.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/motorBench/startup.o: mcc_generated_files/motorBench/startup.c  .generated_files/flags/default/202e082ea7fc362f763f20117072471d774de0ea .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/motorBench" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/startup.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/startup.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/motorBench/startup.c  -o ${OBJECTDIR}/mcc_generated_files/motorBench/startup.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/motorBench/startup.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/motorBench/state_machine.o: mcc_generated_files/motorBench/state_machine.c  .generated_files/flags/default/e9beccc5cbdd2c39e77e75e6b50a3b85e3943f5f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/motorBench" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/state_machine.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/state_machine.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/motorBench/state_machine.c  -o ${OBJECTDIR}/mcc_generated_files/motorBench/state_machine.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/motorBench/state_machine.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/motorBench/system_init.o: mcc_generated_files/motorBench/system_init.c  .generated_files/flags/default/ab1bb6f1f1ff12ab0267b56c34de58ded7dd622a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/motorBench" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/system_init.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/system_init.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/motorBench/system_init.c  -o ${OBJECTDIR}/mcc_generated_files/motorBench/system_init.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/motorBench/system_init.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/motorBench/system_state.o: mcc_generated_files/motorBench/system_state.c  .generated_files/flags/default/6c3596e24586423c263d8bed829dea2ae0aec4ae .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/motorBench" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/system_state.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/system_state.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/motorBench/system_state.c  -o ${OBJECTDIR}/mcc_generated_files/motorBench/system_state.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/motorBench/system_state.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/motorBench/test_harness.o: mcc_generated_files/motorBench/test_harness.c  .generated_files/flags/default/7a255d02eb064eef195498defdb8d818896d1b5e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/motorBench" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/test_harness.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/test_harness.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/motorBench/test_harness.c  -o ${OBJECTDIR}/mcc_generated_files/motorBench/test_harness.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/motorBench/test_harness.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/motorBench/test_harness_timestamps.o: mcc_generated_files/motorBench/test_harness_timestamps.c  .generated_files/flags/default/39030cf5f653a61e035687cb47e1d56a83d93617 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/motorBench" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/test_harness_timestamps.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/test_harness_timestamps.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/motorBench/test_harness_timestamps.c  -o ${OBJECTDIR}/mcc_generated_files/motorBench/test_harness_timestamps.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/motorBench/test_harness_timestamps.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/motorBench/ui.o: mcc_generated_files/motorBench/ui.c  .generated_files/flags/default/c33d1c45cde04cf7013a04bde44ec82100a7cd06 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/motorBench" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/ui.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/ui.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/motorBench/ui.c  -o ${OBJECTDIR}/mcc_generated_files/motorBench/ui.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/motorBench/ui.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/opa/src/opa1.o: mcc_generated_files/opa/src/opa1.c  .generated_files/flags/default/e273a8147e8141704b5518e7326e6e52a2277d85 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/opa/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/opa/src/opa1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/opa/src/opa1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/opa/src/opa1.c  -o ${OBJECTDIR}/mcc_generated_files/opa/src/opa1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/opa/src/opa1.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/opa/src/opa2.o: mcc_generated_files/opa/src/opa2.c  .generated_files/flags/default/1f4e0efc7a49ed1ea0608a490a40926fda330b3f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/opa/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/opa/src/opa2.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/opa/src/opa2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/opa/src/opa2.c  -o ${OBJECTDIR}/mcc_generated_files/opa/src/opa2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/opa/src/opa2.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/opa/src/opa3.o: mcc_generated_files/opa/src/opa3.c  .generated_files/flags/default/94c01e2ec824db78c65ed5b76d466384cffafde9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/opa/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/opa/src/opa3.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/opa/src/opa3.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/opa/src/opa3.c  -o ${OBJECTDIR}/mcc_generated_files/opa/src/opa3.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/opa/src/opa3.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/pwm_hs/src/pwm.o: mcc_generated_files/pwm_hs/src/pwm.c  .generated_files/flags/default/455998541e4de333da95ee8a18ff71a674fb0cb9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/pwm_hs/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pwm_hs/src/pwm.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pwm_hs/src/pwm.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/pwm_hs/src/pwm.c  -o ${OBJECTDIR}/mcc_generated_files/pwm_hs/src/pwm.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/pwm_hs/src/pwm.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/clock.o: mcc_generated_files/system/src/clock.c  .generated_files/flags/default/446eea8447573515fab4dac10a80d0b37cad4a1b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/clock.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/clock.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/clock.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/clock.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/clock.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o: mcc_generated_files/system/src/config_bits.c  .generated_files/flags/default/eedb544e2e7c2e314d988148bf540d5a7be4675f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/config_bits.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/system.o: mcc_generated_files/system/src/system.c  .generated_files/flags/default/6ecee7845d1d0497effddc0a84e742157494a443 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/system.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/system.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/system.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/pins.o: mcc_generated_files/system/src/pins.c  .generated_files/flags/default/8fb42645205a17a39e6cc0c59cdd3740cbd8a6f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/pins.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/pins.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/pins.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/pins.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/pins.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/traps.o: mcc_generated_files/system/src/traps.c  .generated_files/flags/default/a90997eaed5299e29b1efe2c8fe0d0f6e10f3e1a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/traps.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/traps.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/traps.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/traps.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/traps.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o: mcc_generated_files/system/src/interrupt.c  .generated_files/flags/default/8da390af072bd44efa7066042638a6265fa957e0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/interrupt.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/dmt.o: mcc_generated_files/system/src/dmt.c  .generated_files/flags/default/6ba3f559937a86b7d1129ae35cd2a0f63cca265d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/dmt.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/dmt.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/dmt.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/dmt.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/dmt.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/reset.o: mcc_generated_files/system/src/reset.c  .generated_files/flags/default/4cf0a3f670315ab99a9d201cab51a1211696de60 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/reset.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/reset.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system/src/reset.c  -o ${OBJECTDIR}/mcc_generated_files/system/src/reset.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system/src/reset.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/timer/src/sccp1.o: mcc_generated_files/timer/src/sccp1.c  .generated_files/flags/default/7affdb242f6a42ed966d115f8843c017d3934a79 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/timer/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/timer/src/sccp1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/timer/src/sccp1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/timer/src/sccp1.c  -o ${OBJECTDIR}/mcc_generated_files/timer/src/sccp1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/timer/src/sccp1.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/timer/src/tmr1.o: mcc_generated_files/timer/src/tmr1.c  .generated_files/flags/default/ffe4c46f15a2371294f22b2cb23798fc43bab850 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/timer/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/timer/src/tmr1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/timer/src/tmr1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/timer/src/tmr1.c  -o ${OBJECTDIR}/mcc_generated_files/timer/src/tmr1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/timer/src/tmr1.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/uart/src/uart2.o: mcc_generated_files/uart/src/uart2.c  .generated_files/flags/default/f0187b5a159ea813175fd011d97ce0955c156f1a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/uart/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart/src/uart2.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart/src/uart2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/uart/src/uart2.c  -o ${OBJECTDIR}/mcc_generated_files/uart/src/uart2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/uart/src/uart2.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/uart/src/uart3.o: mcc_generated_files/uart/src/uart3.c  .generated_files/flags/default/f339c489a43c7ca97da63623ace2931096c81f5a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/uart/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart/src/uart3.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart/src/uart3.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/uart/src/uart3.c  -o ${OBJECTDIR}/mcc_generated_files/uart/src/uart3.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/uart/src/uart3.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/6ff0f1e4605f9a867ec502f11de8e1f15aa25a8e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -mlarge-data -msmall-scalar -O1 -fomit-frame-pointer -msmart-io=1 -Wall -msfr-warn=off -finline   -mdfp="${DFP_DIR}/xc16"
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/mcc_generated_files/motorBench/math_asm.o: mcc_generated_files/motorBench/math_asm.s  .generated_files/flags/default/16745f1fa90c8755c8e43da1588d199a6b707361 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/motorBench" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/math_asm.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/math_asm.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  mcc_generated_files/motorBench/math_asm.s  -o ${OBJECTDIR}/mcc_generated_files/motorBench/math_asm.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -omf=elf -DXPRJ_default=$(CND_CONF)    -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -Wa,-MD,"${OBJECTDIR}/mcc_generated_files/motorBench/math_asm.o.d",--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK5=1,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/where_was_i.o: mcc_generated_files/system/src/where_was_i.s  .generated_files/flags/default/1b25a7acf5a349b93e7d8e9078713572137d643b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/where_was_i.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/where_was_i.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  mcc_generated_files/system/src/where_was_i.s  -o ${OBJECTDIR}/mcc_generated_files/system/src/where_was_i.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -omf=elf -DXPRJ_default=$(CND_CONF)    -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -Wa,-MD,"${OBJECTDIR}/mcc_generated_files/system/src/where_was_i.o.d",--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK5=1,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/dmt_asm.o: mcc_generated_files/system/src/dmt_asm.s  .generated_files/flags/default/50426c8bc06e9ca5454e28239fed8005fb671d5d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/dmt_asm.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/dmt_asm.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  mcc_generated_files/system/src/dmt_asm.s  -o ${OBJECTDIR}/mcc_generated_files/system/src/dmt_asm.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -omf=elf -DXPRJ_default=$(CND_CONF)    -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -Wa,-MD,"${OBJECTDIR}/mcc_generated_files/system/src/dmt_asm.o.d",--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK5=1,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/mcc_generated_files/motorBench/math_asm.o: mcc_generated_files/motorBench/math_asm.s  .generated_files/flags/default/a08e43a8a8d12467d4d3192423b07528c641666a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/motorBench" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/math_asm.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/motorBench/math_asm.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  mcc_generated_files/motorBench/math_asm.s  -o ${OBJECTDIR}/mcc_generated_files/motorBench/math_asm.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -omf=elf -DXPRJ_default=$(CND_CONF)    -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -Wa,-MD,"${OBJECTDIR}/mcc_generated_files/motorBench/math_asm.o.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/where_was_i.o: mcc_generated_files/system/src/where_was_i.s  .generated_files/flags/default/5dfffeff6f664802cf18c8211dc36bff81dbb15c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/where_was_i.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/where_was_i.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  mcc_generated_files/system/src/where_was_i.s  -o ${OBJECTDIR}/mcc_generated_files/system/src/where_was_i.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -omf=elf -DXPRJ_default=$(CND_CONF)    -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -Wa,-MD,"${OBJECTDIR}/mcc_generated_files/system/src/where_was_i.o.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system/src/dmt_asm.o: mcc_generated_files/system/src/dmt_asm.s  .generated_files/flags/default/cca0c4a029e51e4b19bd7a0b893521125ed27af3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/dmt_asm.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/dmt_asm.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  mcc_generated_files/system/src/dmt_asm.s  -o ${OBJECTDIR}/mcc_generated_files/system/src/dmt_asm.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -omf=elf -DXPRJ_default=$(CND_CONF)    -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -Wa,-MD,"${OBJECTDIR}/mcc_generated_files/system/src/dmt_asm.o.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemblePreproc
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/cdvc_drone_duct.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk  mcc_generated_files/motorBench/library/mc-library/libmotor_control_dspic-elf.a mcc_generated_files/motorBench/library/x2cscope/libx2cscope-dspic-elf.a  
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/cdvc_drone_duct.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}    mcc_generated_files\motorBench\library\mc-library\libmotor_control_dspic-elf.a mcc_generated_files\motorBench\library\x2cscope\libx2cscope-dspic-elf.a  -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG=__DEBUG -D__MPLAB_DEBUGGER_PK5=1  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope"  -mreserve=data@0x1000:0x101B -mreserve=data@0x101C:0x101D -mreserve=data@0x101E:0x101F -mreserve=data@0x1020:0x1021 -mreserve=data@0x1022:0x1023 -mreserve=data@0x1024:0x1027 -mreserve=data@0x1028:0x104F   -Wl,--local-stack,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D__DEBUG=__DEBUG,--defsym=__MPLAB_DEBUGGER_PK5=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,${DISTDIR}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	
else
${DISTDIR}/cdvc_drone_duct.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk  mcc_generated_files/motorBench/library/mc-library/libmotor_control_dspic-elf.a mcc_generated_files/motorBench/library/x2cscope/libx2cscope-dspic-elf.a 
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/cdvc_drone_duct.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}    mcc_generated_files\motorBench\library\mc-library\libmotor_control_dspic-elf.a mcc_generated_files\motorBench\library\x2cscope\libx2cscope-dspic-elf.a  -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files" -I"mcc_generated_files/motorBench" -I"mcc_generated_files/motorBench/library/mc-library" -I"mcc_generated_files/motorBench/library/x2cscope" -Wl,--local-stack,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,${DISTDIR}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	${MP_CC_DIR}\\xc-dsc-bin2hex ${DISTDIR}/cdvc_drone_duct.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf   -mdfp="${DFP_DIR}/xc16" 
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(wildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
