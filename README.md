# dronesim

This project is build on top of [Colosseum](https://github.com/CodexLabsLLC/Colosseum) which is a fork of [AirSim](https://github.com/microsoft/AirSim).

Supported Unreal version: 5.4.4.

## Setup

Clone this git repo and fetch submodules:

```bash
git submodule update --init --recursive
```

To set up `Colosseum` start a `x64 Native Tools Command Prompt for VS 2022` terminal and run the `.\buildAirSim.cmd` script.

The `Colosseum` docs are found at [here](https://codexlabsllc.github.io/Colosseum/build_windows/).

Also add the `City Park Environment Collection LITE` package:
- Search for it in the Epic Games marketplace and download it / `Create Project` at a temporary folder.
- From this newly created project take the folder `Content/CityPark` and copy it into this repo at `.\Unreal\Dronesim\Content\CityPark`.
- Remove the temporary project.

Now you can open the `Dronesim.code-workspace` with `VSCode` and the `Dronesim.uproject` by double-clicking.

TODO: build Colosseum in release mode

## Skywinger model and connection to PX4

Create a file called `settings.json` under `%userprofile%\Documents\AirSim`.

In this settings file select `"Model": "Skywinger"` and configure the `ControlIp` (WSL2 ip address) and the `LocalHostIp` (Windows IP of the WSL vEthernet adapter): 

```json
{
    "SettingsVersion": 1.2,
    "SimMode": "Multirotor",
    "ClockType": "SteppableClock",
    "Vehicles": {
        "PX4": {
            "VehicleType": "PX4Multirotor",
			"Model": "Skywinger",
            "UseSerial": false,
            "LockStep": true,
            "UseTcp": true,
            "TcpPort": 4560,
            "ControlIp": "192.168.144.143",
            "ControlPortLocal": 14540,
            "ControlPortRemote": 14580,
            "LocalHostIp": "192.168.144.1",
            "Sensors":{
                "Barometer":{
                    "SensorType": 1,
                    "Enabled": true,
                    "PressureFactorSigma": 0.0001825
                }
            },
            "Parameters": {
                "NAV_RCL_ACT": 0,
                "NAV_DLL_ACT": 0,
                "COM_OBL_ACT": 1,
                "LPE_LAT": 47.641468,
                "LPE_LON": -122.140165
            }
        }
    }
}
```

Then run PX4 from [our fork](https://github.com/OceanSky-Technologies/PX4-Autopilot) with these commands:

```bash
export PX4_SIM_HOST_ADDR=192.168.144.1 # Windows host IP, same as in settings.json
make px4_sitl skywinger
```

Once PX4 and Dronesim are running QGroundControl should detect the drone automatically.
