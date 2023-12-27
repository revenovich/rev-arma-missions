grp1Test = createGroup independent;
publicVariable "grp1Test";
grp2Test = createGroup independent;
publicVariable "grp2Test";
grp3Test = createGroup independent;
publicVariable "grp3Test";

[sci1] joinSilent grp1Test;
[sci2] joinSilent grp2Test;
[sci3] joinSilent grp3Test;
// [[sci1], grp1Test] remoteExec ["joinSilent", 2, true];
// [[sci2], grp2Test] remoteExec ["joinSilent", 2, true];
// [[sci3], grp3Test] remoteExec ["joinSilent", 2, true];

// grp1Test setGroupId ["Dr. Benjamin Shaw"];
// grp2Test setGroupId ["Professor Nikolai Volkov"];
// grp3Test setGroupId ["Dr. Haruka Tanaka"];

grp1Test setGroupIdGlobal ["Dr. Benjamin Shaw"];
grp2Test setGroupIdGlobal ["Professor Nikolai Volkov"];
grp3Test setGroupIdGlobal ["Dr. Haruka Tanaka"];

// [grp1Test, ["Dr. Benjamin Shaw"]] remoteExec ["setGroupId", 2, true];
// [grp2Test, ["Professor Nikolai Volkov"]] remoteExec ["setGroupId", 2, true];
// [grp3Test, ["Dr. Haruka Tanaka"]] remoteExec ["setGroupId", 2, true];

// [grp1Test, ["Dr. Benjamin Shaw"]] remoteExec ["setGroupIdGlobal", 0, true];
// [grp2Test, ["Professor Nikolai Volkov"]] remoteExec ["setGroupIdGlobal", 0, true];
// [grp3Test, ["Dr. Haruka Tanaka"]] remoteExec ["setGroupIdGlobal", 0, true];