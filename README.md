# Install Cisco Packet Tracer Easily

An easier way to install Cisco Packet Tracer on Linux and avoid the common errors like:
```
The following packages have unmet dependencies:
packettracer: depends: libgl1-mesa-glx but it is not installable
```



## What Does the Script Do?

- Installs all required dependencies
- Downloads and installs the missing `libgl1-mesa-glx` package from Debian
- Resolves any `dpkg` interruptions from prior incomplete Packet Tracer installations
- Provides step-by-step guidance for installing Packet Tracer



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
