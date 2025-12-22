# BP Greeting CLI Example

Example of a simple greeting program controlled via the CLI and implemented using Behavioral Programming (BP) in Glamorous Toolkit with [Gt4Bp](https://github.com/isegorg/gt4bp): waits for a name event and requests a greeting event in response.

## Download

Glamorous Toolkit can be downloaded from https://gtoolkit.com/download/ and unzip.

## Installation

The project can be loaded from the terminal with the following command. Previously, you should replace `$GT_HOME`, or define its value, with the binaries directory under the GT installation directory.

Note that this command can take some time because it will download and install the required dependencies in your image (e.g., Gt4Bp will be downloaded and tangled). Once it finishes successfully all the GT windows will be closed and the control returned to the terminal:

```bash
$GT_HOME/GlamorousToolkit-cli --interactive\
	GlamorousToolkit.image eval\
	"Metacello new\
		repository: 'github://isegorg/bp-greeting-example:main/src';\
		baseline: 'BpGreetingExample';\
		load."\
	--save
```

On Mac

```bash
GT_HOME = <unzip_folder>/GlamorousToolkit.app/Contents/MacOS/
```

On Linux

```bash
GT_HOME = <unzip_folder>/bin/
```

Or from within the image running in a playground the following expression:

```st
Metacello new
	repository: 'github://isegorg/bp-greeting-example:main/src';
	baseline: 'BpGreetingExample';
	load
```

## Start examples from CLI

```bash
$GT_HOME/GlamorousToolkit-cli GlamorousToolkit.image\
	bpCliExample --class=BPCliGreetingExample --signature=greeting
```

The previous command starts the example that waits for inputs in the standard input.

For example, you can copying the following input event to the standard input and pressing `RETURN`:

```json
{"name":"nameProvided","data":{"name":"John"}}
```

If the program runs as expected it should print the following two events in the standard output:

```json
{"name":"nameProvided","data":{"name":"John"},"type":"eventFired"}
{"name":"nameGreeted","data":{"greeting":"Hello John!"},"type":"eventFired"}
```
## SpecificationsS
Several specifications can be found in [wiki-specifications](https://github.com/isegorg/bp-greeting-example/wiki))ki
