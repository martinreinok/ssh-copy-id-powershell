# ssh-copy-id for Powershell
NOTE: This is just a workaround as of currently the command "ssh-copy-id" does not exist for Powershell.

## Example
```
PS C:\Users\Kr> ssh-copy-id
WARNING:
Please include parameter: host@address
Optionally include any default ssh_options (eg '-p port', default is 22)
PS C:\Users\Kr> ssh-copy-id root@123.123.123.123 "-p 12345"
```

## Install
(Windows only)  
* Right click the .ps1 script and Run using Powershell.  
* Or copy the contents of the .ps1 file to Powershell.  

Powershell window needs to be reopened for the function to load.

## Usage
After install the function will be added into Powershell $profile and loaded on every shell launch.  
Example use case:
```Powershell
ssh-copy-id root@123.123.123.123 "-p 12345"
```

## Uninstall
Open the $profile file and delete the function

```
notepad $profile
```
