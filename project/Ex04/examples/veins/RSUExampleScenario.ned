// This file is part of an OMNeT++ simulation example for Connected and Autonomous Vehicles class (Winter semester 2021-2022)

import org.car2x.veins.nodes.RSU;
import org.car2x.veins.nodes.Scenario;

network RSUExampleScenario extends Scenario
{
    submodules:
        rsu[1]: RSU {
            @display("p=150,140;i=veins/sign/yellowdiamond;is=vs");
        }
}
