PROGRAM program0
  VAR
    TI100 AT %IW1 : INT := 1;
    LI100 AT %IW2 : INT := 2;
    PI100 AT %IW3 : INT := 3;
    FI100 AT %IW4 : INT := 4;
  END_VAR
  VAR
    flag : BOOL := FALSE;
  END_VAR

  IF flag = FALSE THEN
    TI100 := 10;
    LI100 := 20;
    PI100 := 30;
    FI100 := 40;
    flag := TRUE;
  END_IF;
END_PROGRAM


CONFIGURATION Config0

  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#50ms,PRIORITY := 0);
    PROGRAM instance0 WITH task0 : program0;
  END_RESOURCE
END_CONFIGURATION
