# Nodeswitch
A tool to switch between nodejs versions on windows, without requiring administrative privileges.
Similar to https://github.com/coreybutler/nvm-windows, but without the need for administrative privileges.
Also, this is still very very basic.

## Usage
* Clone
* Download and extract appropriate nodejs versions manually
* Extract them in `c:\Users\YourUserNameHere\tools`
* If you downloaded `node-v16.9.1-win-x64` for example, you should now have a file `C:\Users\YourUserNameHere\tools\node-v16.9.1-win-x64\node.exe`
* Add this repository to your %PATH%
* You can now simply run `node-16.cmd` to switch to node v16.9.1

### Adding other versions
* You can simply repeat the steps above
* Create additional `node-XX.cmd` files as necessary (or even better, improve this repository to make this selectable, similar to nvm)