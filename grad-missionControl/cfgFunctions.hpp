class grad_missionControl {

	class client {
		  file = grad-missionControl\functions\client;

      class intro;
      class outro;
      class rotatingCam;
      class setMyFrequency;
      class setGroupFrequencies;
      class typeText;
  };

	class server {
		  file = grad-missionControl\functions\server;

      class alignUnitsInLine;
      class checkRetreat {postInit = 1;};
      class endMission;
      class refuelUAV {postInit = 1;};
  };
};
