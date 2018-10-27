#define SETTING(TYPE,VAR) TYPE(missionConfigFile >> "ZKB_Settings" >> VAR)

#define GMVAR(VAR,DEF) (missionNamespace getVariable [VAR,DEF])
#define GUIVAR(VAR,DEF) (uiNamespace getVariable [VAR,DEF])
#define GPVAR(VAR,DEF) (player getVariable [VAR,DEF])
#define GOVAR(OBJ,VAR,DEF) (OBJ getVariable [VAR,DEF])