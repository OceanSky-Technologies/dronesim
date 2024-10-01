# dronesim

This project is build on top of [Colosseum](https://github.com/CodexLabsLLC/Colosseum) which is a fork of [AirSim](https://github.com/microsoft/AirSim).

Supported Unreal version: 5.4.4.

## Setup

Clone this git repo and fetch submodules:

```bash
git submodule update --init --recursive
```

To set up `Colosseum` follow the instructions from [here](https://codexlabsllc.github.io/Colosseum/build_windows/) inside the `Colosseum` subfolder.
Use the `x64 Native Tools Command Prompt for VS 2022` to build it. 

Hint: In the `Colosseum` docs you need to replace `Colosseum` by `AirSim` in some commands.

Now copy the compiled `Colosseum`/`AirSim` plugin into the `dronesim` Unreal project:

```bash
robocopy .\Colosseum\Unreal\Plugins\AirSim .\Unreal\Dronesim\Plugins\AirSim /E
```

Also add the `City Park Environment Collection LITE` package:
- Search for it in the Epic Games marketplace and download it / `Create Project` at a temporary folder.
- From this newly created project take the folder `Content/CityPark` and copy it into this repo at `.\Unreal\Dronesim\Content\CityPark`.
- Remove the temporary project.

Now you can open the `Dronesim.code-workspace` with `VSCode` and the `Dronesim.uproject` by double-clicking.
