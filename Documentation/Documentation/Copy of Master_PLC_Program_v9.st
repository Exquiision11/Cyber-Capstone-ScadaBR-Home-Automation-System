PROGRAM Master_Program
  VAR
    Panel_Mag_Sensor AT %IX0.0 : BOOL;
    Panel_IR_Sensor AT %IX0.1 : BOOL;
    Panel_Motion_Sensor AT %IX0.2 : BOOL;
    Panel_GD_Remote_UP_PB AT %IX0.3 : BOOL;
    Panel_GD_Remote_DOWN_PB AT %IX0.4 : BOOL;
    Panel_FD_Lock_Signal AT %IX0.5 : BOOL;
    Panel_Arm_Panel_PB AT %IX0.6 : BOOL;
    Panel_Arm_House_PB AT %IX0.7 : BOOL;
    Panel_Reset_PB AT %IX1.0 : BOOL;
    Panel_FD_Unlock_Signal AT %IX1.1 : BOOL;
    Panel_Alarm_Light AT %QX0.0 : BOOL;
    Home_GD_Postion_Switch AT %IX102.0 : BOOL;
    Home_Mag_Sensor AT %IX102.1 : BOOL;
    Home_Motion_Sensor AT %IX102.2 : BOOL;
    Home_IR_Sensor AT %IX102.3 : BOOL;
    Home_Green_PB_Floor_01 AT %IX102.4 : BOOL;
    Home_Green_PB_Floor_02 AT %IX102.5 : BOOL;
    Home_Blue_PB_Floor_03 AT %IX102.6 : BOOL;
    Home_Red_PB_Floor_03 AT %IX102.7 : BOOL;
    Home_Green_LED_Floor_01 AT %QX100.0 : BOOL;
    Home_Green_LED_Floor_02 AT %QX100.1 : BOOL;
    Home_Green_LED_Floor_03 AT %QX100.2 : BOOL;
    Home_White_LED_Floor_01 AT %QX100.3 : BOOL;
    Home_White_LED_Floor_02 AT %QX100.4 : BOOL;
    Home_White_LED_Floor_03 AT %QX100.5 : BOOL;
    Home_White_LED_Floor_Backside AT %QX100.6 : BOOL;
    Home_GD_Motor_UP AT %QX100.7 : BOOL;
    Home_GD_Motor_DOWN AT %QX101.0 : BOOL;
    Home_FD_DeadBolt AT %QX101.1 : BOOL;
    Home_Flr01_PB_LED AT %QX101.2 : BOOL;
    Home_Flr02_PB_LED AT %QX101.3 : BOOL;
    Home_Flr03_PB_LED AT %QX101.4 : BOOL;
    Panel_Arm_Virtual_PB AT %QX10.0 : BOOL;
    Panel_Arm_Mag_Sensor_Virtual AT %QX10.1 : BOOL;
    Panel_Arm_Motion_Sensor_Virtual AT %QX10.2 : BOOL;
    Panel_Arm_IR_Sensor_Virtual AT %QX10.3 : BOOL;
    Panel_Mag_Sensor_Virtual AT %QX10.4 : BOOL;
    Panel_Motion_Sensor_Virtual AT %QX10.5 : BOOL;
    Panel_IR_Sensor_Virtual AT %QX10.6 : BOOL;
    Panel_GD_Up_OnOff_Virtual_PB AT %QX10.7 : BOOL;
    Panel_GD_Remote_Up_Virtual AT %QX11.0 : BOOL;
    Panel_GD_Down_OnOff_Virtual_PB AT %QX11.1 : BOOL;
    Panel_GD_Remote_Down_Virtual AT %QX11.2 : BOOL;
    Panel_FD_Lock_OnOff_Virtual_PB AT %QX11.3 : BOOL;
    Panel_FD_Lock_Signal_Virtual AT %QX11.4 : BOOL;
    Home_Arm_Virtual_PB AT %QX110.2 : BOOL;
    Home_Arm_Mag_Sensor_Virtual AT %QX110.3 : BOOL;
    Home_Mag_Sensor_Virtual AT %QX110.4 : BOOL;
    Home_Arm_Motion_Sensor_Virtual AT %QX110.5 : BOOL;
    Home_Motion_Sensor_Virtual AT %QX110.6 : BOOL;
    Home_Arm_IR_Sensor_Virtual AT %QX110.7 : BOOL;
    Home_IR_Sensor_Virtual AT %QX111.0 : BOOL;
    Home_Green_PB_Auto_01 AT %QX111.2 : BOOL;
    Home_Green_PB_Auto_02 AT %QX111.4 : BOOL;
    Home_Green_PB_Auto_03 AT %QX111.6 : BOOL;
    Home_Green_LED_Reset_PB AT %QX111.7 : BOOL;
    Reset_Green_Lights AT %QX112.0 : BOOL;
  END_VAR
  VAR
    TON0 : TON;
  END_VAR
  VAR
    Home_White_PD_Floor_01 AT %QX112.1 : BOOL;
    Home_White_PD_Floor_02 AT %QX112.2 : BOOL;
    Home_White_PD_Floor_03 AT %QX112.3 : BOOL;
    Home_White_PD_Backside AT %QX112.4 : BOOL;
    Home_Reset_PB_Virtual AT %QX112.5 : BOOL;
    Home_Floor01_Alarm AT %QX112.7 : BOOL;
    Home_Floor02_Alarm AT %QX113.0 : BOOL;
    Home_Floor03_Alarm AT %QX113.1 : BOOL;
    Home_Mag_Alarm AT %QX113.2 : BOOL;
    Home_Motion_Alarm AT %QX113.3 : BOOL;
    Home_IR_Alarm AT %QX113.4 : BOOL;
    Home_GD_Alarm_OnOff_PB AT %QX113.5 : BOOL;
    Panel_Alarm_Signal AT %QX113.6 : BOOL;
  END_VAR
  VAR
    SR0 : SR;
    _TMP_NOT132_OUT : BOOL;
  END_VAR

  Panel_Alarm_Signal := ((NOT(Panel_IR_Sensor) OR Panel_IR_Sensor_Virtual) AND NOT(Panel_Arm_IR_Sensor_Virtual) OR (Panel_Mag_Sensor OR Panel_Mag_Sensor_Virtual) AND NOT(Panel_Arm_Mag_Sensor_Virtual) OR (Panel_Motion_Sensor OR Panel_Motion_Sensor_Virtual) AND NOT(Panel_Arm_Motion_Sensor_Virtual)) AND NOT(Home_Arm_Virtual_PB) AND (NOT(Panel_Arm_Virtual_PB) OR Panel_Arm_Panel_PB);
  Home_Mag_Alarm := (Home_Mag_Sensor OR Home_Mag_Sensor_Virtual) AND NOT(Home_Arm_Mag_Sensor_Virtual) AND (Home_Arm_Virtual_PB OR Panel_Arm_House_PB);
  Home_Motion_Alarm := (Home_Motion_Sensor OR Home_Motion_Sensor_Virtual) AND NOT(Home_Arm_Motion_Sensor_Virtual) AND (Home_Arm_Virtual_PB OR Panel_Arm_House_PB);
  Home_IR_Alarm := (Home_IR_Sensor_Virtual OR NOT(Home_IR_Sensor)) AND NOT(Home_Arm_IR_Sensor_Virtual) AND (Home_Arm_Virtual_PB OR Panel_Arm_House_PB);
  Home_Green_PB_Auto_01 := NOT(Reset_Green_Lights) AND (Home_Green_PB_Auto_01 OR NOT(Home_Green_PB_Floor_01)) AND (Home_Arm_Virtual_PB OR Panel_Arm_House_PB);
  Home_Green_LED_Floor_01 := Home_Green_PB_Auto_01 AND (Home_Arm_Virtual_PB OR Panel_Arm_House_PB);
  Home_Green_PB_Auto_02 := NOT(Reset_Green_Lights) AND (Home_Green_PB_Auto_01 AND NOT(Home_Green_PB_Floor_02) OR Home_Green_PB_Auto_02) AND (Home_Arm_Virtual_PB OR Panel_Arm_House_PB);
  Home_Green_LED_Floor_02 := Home_Green_PB_Auto_02 AND (Home_Arm_Virtual_PB OR Panel_Arm_House_PB);
  Home_Green_PB_Auto_03 := NOT(Reset_Green_Lights) AND (Home_Green_PB_Auto_02 AND NOT(Home_Blue_PB_Floor_03) OR Home_Green_PB_Auto_03) AND (Home_Arm_Virtual_PB OR Panel_Arm_House_PB);
  Home_Green_LED_Floor_03 := Home_Green_PB_Auto_03 AND (Home_Arm_Virtual_PB OR Panel_Arm_House_PB);
  Home_Green_LED_Reset_PB := (Home_Green_PB_Auto_03 OR Home_Reset_PB_Virtual) AND (Home_Arm_Virtual_PB OR Panel_Arm_House_PB);
  Home_Green_PB_Auto_03 := NOT(Reset_Green_Lights) AND (Home_Green_PB_Auto_02 AND NOT(Home_Red_PB_Floor_03) OR Home_Green_PB_Auto_03) AND (Home_Arm_Virtual_PB OR Panel_Arm_House_PB);
  Home_Floor02_Alarm := Home_Mag_Alarm OR Home_Motion_Alarm;
  Home_Floor03_Alarm := Home_IR_Alarm;
  TON0(IN := Home_Green_LED_Reset_PB, PT := T#5000ms);
  Reset_Green_Lights := Panel_Alarm_Light OR Panel_Reset_PB OR TON0.Q;
  SR0(S1 := (NOT(Home_Arm_Virtual_PB) AND Panel_GD_Remote_UP_PB OR Panel_GD_Remote_Up_Virtual) AND NOT(Panel_GD_Up_OnOff_Virtual_PB), R := (NOT(Home_Arm_Virtual_PB) AND Panel_GD_Remote_DOWN_PB OR NOT(Panel_GD_Remote_Down_Virtual)) AND NOT(Panel_GD_Down_OnOff_Virtual_PB));
  Home_GD_Motor_UP := SR0.Q1;
  _TMP_NOT132_OUT := NOT(SR0.Q1);
  Home_GD_Motor_DOWN := _TMP_NOT132_OUT;
  Home_FD_DeadBolt := (NOT(Home_Arm_Virtual_PB) AND NOT(Panel_FD_Lock_Signal) OR Panel_FD_Lock_Signal_Virtual) AND NOT(Panel_FD_Lock_OnOff_Virtual_PB);
  Home_Floor01_Alarm := NOT(Home_GD_Alarm_OnOff_PB) AND (Home_FD_DeadBolt AND Home_Arm_Virtual_PB OR Home_GD_Motor_UP AND Home_Arm_Virtual_PB);
  Home_White_LED_Floor_01 := NOT(Home_Green_LED_Floor_01) AND NOT(Home_White_PD_Floor_01);
  Home_White_LED_Floor_02 := NOT(Home_Green_LED_Floor_02) AND NOT(Home_White_PD_Floor_02);
  Home_White_LED_Floor_03 := NOT(Home_Green_LED_Floor_03) AND NOT(Home_White_PD_Floor_03);
  Home_White_LED_Floor_Backside := NOT(Home_Green_LED_Floor_03) AND NOT(Home_White_PD_Backside);
  Panel_Alarm_Light := Home_Floor01_Alarm OR Home_Floor02_Alarm OR Home_Floor03_Alarm OR Panel_Alarm_Signal;
  Home_Flr02_PB_LED := Home_Arm_Motion_Sensor_Virtual AND Home_Arm_Mag_Sensor_Virtual AND Home_Arm_Virtual_PB;
  Home_Flr03_PB_LED := NOT(Home_Arm_IR_Sensor_Virtual) AND Home_Arm_Virtual_PB;
  Home_Flr01_PB_LED := (Home_GD_Motor_UP OR Panel_FD_Lock_Signal_Virtual) AND Home_Arm_Virtual_PB;
END_PROGRAM


CONFIGURATION Config0

  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#20ms,PRIORITY := 0);
    PROGRAM instance0 WITH task0 : Master_Program;
  END_RESOURCE
END_CONFIGURATION
