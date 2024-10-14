private ["_airTower","_urbanMarkers","_uav1Hangar","_uav2Hangar","_ugvHangar","_jetHangar"];

_urbanMarkers =["sm1","sm2","sm3","sm4","sm5","sm6","sm7","sm8","sm9","sm10","sm11","sm12","sm13","sm14","sm15","sm16","sm17","sm18","sm19"];
{ _x setMarkerAlpha 0; } count _urbanMarkers;

sleep 1;

crossroad disableAI "ANIM";