"Erasing save..." remoteExec ["systemChat",0];

//save to profile 
profileNamespace setVariable [missionName, nil];
saveProfileNamespace;
"Save erased!" remoteExec ["systemChat",0];