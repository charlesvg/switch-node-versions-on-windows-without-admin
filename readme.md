# Nodeswitch
A tool to switch between nodejs versions on windows, without requiring administrative privileges.
Similar to https://github.com/coreybutler/nvm-windows, but without the need for administrative privileges.
Also, this is still very very basic.

## Usage
* Clone to project using git, for example to a folder called `c:\Users\YourUserName\tools`
* Add `c:\Users\YourUserName\tools\nodeswitch\bin` repository to your %PATH%
	* On your keyboard, press `Windows Button + R` at the same time
	* Type `rundll32 sysdm.cpl,EditEnvironmentVariables` and press enter
	* Double click on `Path`
	* Click `New`
	* Type `c:\Users\YourUserName\tools\nodeswitch\bin`
	* Save
* Open a terminal and type `nvm`