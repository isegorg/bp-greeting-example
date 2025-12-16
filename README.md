# bp-greeting-example
Example of Behavioral Programming (BP) in Glamorous Toolkit using Gt4Bp: waits for a name event and requests a greeting event in response.

## Download

Glamorous Toolkit can be downloaded from https://gtoolkit.com/download/ and unzip.

## Installation

The project can be loaded from the terminal with:

```bash
<path_to_gt>/GlamorousToolkit.app/Contents/MacOS/GlamorousToolkit-cli --interactive GlamorousToolkit.image eval "LeDatabasesRegistry defaultLogicalDatabase reload.Metacello new repository: 'github://isegorg/bp-greeting-example:main/src'; baseline: 'BpGreetingExample'; load." --save
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
<path_to_gt>/GlamorousToolkit.app/Contents/MacOS/GlamorousToolkit-cli GlamorousToolkit.image bpCliExample --class=BPCliGreetingExample --signature=greeting
```

then you can insert events to the system by stdin and the fired events are passed to stdout.
