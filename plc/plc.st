PROGRAM one_second
  VAR_EXTERNAL
    HS_PUMP : BOOL;
    HS_VALVE : BOOL;
    LISA100 : INT;
  END_VAR

  IF HS_PUMP AND HS_VALVE THEN                            (* Насос включен, клапан открыт *)
    LISA100 := LISA100 - 1;
  ELSIF HS_PUMP AND HS_VALVE = FALSE THEN                  (* Насос включен, клапан закрыт *)
    LISA100 := LISA100 - 2;
  ELSIF HS_PUMP = FALSE AND HS_VALVE THEN                 (* Насос выключен, клапан открыт *)
    LISA100 := LISA100 + 1;
  END_IF;


  IF LISA100 <=0 THEN
    LISA100 := 0;
  END_IF;
    
  IF LISA100 >= 100 THEN
    LISA100 := 100;
  END_IF;
END_PROGRAM

PROGRAM program0
  VAR
    LAH100 AT %IX0.1 : BOOL;
    LAL100 AT %IX0.2 : BOOL;
    LASH100 AT %IX0.3 : BOOL;
    LASL100 AT %IX0.4 : BOOL;
    EA100 AT %IX0.5 : BOOL := TRUE;
    HS_LASL100 AT %QX0.1 : BOOL := TRUE;
    HS_LASH100 AT %QX0.2 : BOOL := TRUE;
    HS_AUT AT %QX0.3 : BOOL := FALSE;
  END_VAR
  VAR_EXTERNAL
    LISA100 : INT;
    HS_PUMP : BOOL;
    HS_VALVE : BOOL;
  END_VAR


  IF HS_AUT THEN
    IF LAH100 THEN
      HS_PUMP := TRUE;
    END_IF;
    IF LAL100 THEN
      HS_PUMP := FALSE;
    END_IF;
      
      
  END_IF;



  (*================  ПАЗ =================== *)

    LAH100 := FALSE;
    IF LISA100 > 80 THEN
       LAH100 := TRUE;
    END_IF;

    LAL100 := FALSE;
    IF LISA100 < 20 THEN
       LAL100 := TRUE;
    END_IF;


    LASH100 := FALSE;
    IF (LISA100 > 90) AND (HS_LASH100 = TRUE)  THEN
       LASH100 := TRUE;
       HS_VALVE := FALSE;
    END_IF;


    LASL100 := FALSE;
    IF LISA100 < 10 AND (HS_LASL100 = TRUE) THEN
       LASL100 := TRUE;
       HS_PUMP := FALSE;
    END_IF;
    
    IF (HS_PUMP = TRUE) AND (LISA100 < 1) THEN
      EA100 := FALSE;
      HS_PUMP := FALSE;
    END_IF;
    
        
    
END_PROGRAM


CONFIGURATION Config0

  RESOURCE Res0 ON PLC
    VAR_GLOBAL
      LISA100 AT %IW1 : INT := 50;
      HS_PUMP AT %QX1.0 : BOOL;
      HS_VALVE AT %QX1.1 : BOOL;
    END_VAR
    TASK task0(INTERVAL := T#50ms,PRIORITY := 0);
    TASK task1(INTERVAL := T#1s0ms,PRIORITY := 0);
    PROGRAM instance0 WITH task0 : program0;
    PROGRAM instance1 WITH task1 : one_second;
  END_RESOURCE
END_CONFIGURATION
