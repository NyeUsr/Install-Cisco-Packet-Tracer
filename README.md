## What Does the Script Do?

This shell script provides an easier way to install Cisco Packet Tracer on Linux and avoid the common errors like:
```
The following packages have unmet dependencies:
packettracer: depends: libgl1-mesa-glx but it is not installable
```

by doing the following:

- Installing all required dependencies
- Downloading and Installing the missing `libgl1-mesa-glx` package from Debian
- Resolving any `dpkg` interruptions from prior incomplete Packet Tracer installations
- Providing step-by-step guidance for installing Packet Tracer



## Usage Instructions

### 1. Download the Script

Download the latest version of the script by clicking [here](https://github.com/NyeUsr/Install-Cisco-Packet-Tracer/releases/download/v1.0.0/install-packet-tracer.sh).

### 2. Make the Script Executable

In your terminal, navigate to the location of the downloaded script, and make it executable by running:

```
chmod +x install-packet-tracer.sh
```

### 3. Run the Script

```
./install-packet-tracer.sh
```
