# bp-greeting-example
Example of Behavioral Programming (BP) in Glamorous Toolkit using Gt4Bp: waits for a name event and requests a greeting event in response.

## Download

Glamorous Toolkit can be downloaded from https://gtoolkit.com/download/ and unzip.

## Installation

The project can be loaded from the terminal with:

```bash
<path_to_gt_cli>/GlamorousToolkit-cli --interactive\
	GlamorousToolkit.image eval\
	"Metacello new\
		repository: 'github://isegorg/bp-greeting-example:main/src';\
		baseline: 'BpGreetingExample';\
		load."\
	--save
```

On Mac

```bash
<path_to_gt_cli> = <unzip_folder>/GlamorousToolkit.app/Contents/MacOS/
```

On Linux

```bash
<path_to_gt_cli> = <unzip_folder>/bin/
```

Or from within the image running in a playground

```st
Metacello new
	repository: 'github://isegorg/bp-greeting-example:main/src';
	baseline: 'BpGreetingExample';
	load
```

## Start examples from CLI

```bash
<path_to_gt_cli>/GlamorousToolkit-cli GlamorousToolkit.image\
	bpCliExample --class=BPCliGreetingExample --signature=greeting
```

then you can insert events to the system by stdin and the fired events are passed to stdout.

![alt text](https://github.com/isegorg/bp-greeting-example/blob/main/assets/Specification-Text%20without%20spaces-Snapshot.png)

##Specifications

Several specifications can be found in [wiki-specifications](https://github.com/isegorg/bp-greeting-example/wiki)
