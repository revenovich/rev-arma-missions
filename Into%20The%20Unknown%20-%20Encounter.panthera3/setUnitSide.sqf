grp1Test = createGroup west;
grp2Test = createGroup west;
grp3Test = createGroup west;

[[sci1], grp1Test] remoteExec ["joinSilent", 0, true];
[[sci2], grp2Test] remoteExec ["joinSilent", 0, true];
[[sci3], grp3Test] remoteExec ["joinSilent", 0, true];

[grp1Test, ["Dr. Benjamin Shaw"]] remoteExec ["setGroupId", 0, true];
[grp2Test, ["Professor Nikolai Volkov"]] remoteExec ["setGroupId", 0, true];
[grp3Test, ["Dr. Haruka Tanaka"]] remoteExec ["setGroupId", 0, true];