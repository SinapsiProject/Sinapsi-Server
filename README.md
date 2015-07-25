# Web Service
## Overview
The Sinapsi Web Service is written completely in Java, and allows secure communication between clients and server.
  
## Communications
For the communication between clients and web service, we used REST architecture. 
REST is a stateless client-server protocol that focuses on the concept important resource, 
which can be accessed via a global identifier (URI). To use the resources, the network components (client and server components) 
communicate via a standard interface, HTTP, and exchange representations of these resources, 
in our case is a JSON string.

_GET request example via REST: _
`Http: //massolit.ns0.it: 8181/sinapsi/devices?action=get`
In this case, the client tries to connect to the server server "massolit.ns0.it" on port "8181", and requests the 
servlet "devices". The whole process is managed by a library java (RETROFIT).
_Example of request via retrofit:_
```
GET (/ Devices? Action = get)
   public void getAllDevicesByUser (
         query ("Email") String email,
         Callback <List <DeviceInterface >> devices);
```
The server response is a JSON string like:
`{[email:”email”,name:”Macbook”,model:”Air”],[email:”email”,name:”HTC”,model:”One S "]}`
Through the library Gson Google, this JSON string is then converted by the client in a Java Object, in particular in the above example in an Object type: 
_List \ <DeviceInterface \> _.
 
## Security
Communication between clients and server is encrypted using the library BGP that works with java se/ee and also in Android. 
BGP(Bit Good Privacy) provides tools to encrypt/decrypt using the benefits of symmetric and asymmetric cryptography.

### BGP Behavior
Given the string to be encrypted, it is compressed to reduce space and more importantly to prevent attacks Known-plaintext. 
Subsequently BGP creates a session key by default AES 128-bit, which is used to encrypt the compressed plaintext 
using the  padding algorithm CBC with a randomized initialization vector (IV).
Once encrypted text, the session key is encrypted using the public key RSA 1024 bits of sender. 
Finally the encrypted text (concatenation between the IV + ":" + text encrypted) is sent with the encrypted session key, the recipient decrepit in a similar way.
Decrepit the session key using its RSA private key, obtaining the original session key AES , 
which is used to decrypt the encrypted compressed text, finally unzip the text to get the plaintext.

## Server Requests
The Sinapsi web server offers many services including:

### AvailableAction
AvailableAction service allows clients to ask what are the action available in a given device, 
and when POSTsave on the db server action available on a particular device.

### AvailableComponents
AvailableComponents service allows clients to ask what are the components (triggers and actions) 
available in a given device, this is necessary when editing macro.

### AvailableTrigger
AvailableTrigger service allows clients to ask what triggers are available in a given device, 
and when POST  save the db server triggers available on a particular device.

### Device
Device service allows clients to see the list of devices connected to a particular Sinapsi account, 
or in the case of POST request to add a device to the Sinapsi platform.

### Request Login + Login
The service request is the system login and login authentication of synapses that allows users to access safely.

### Macro
Macro service allows management of the macros by the client, such as add, remove, edit and push. 
The push is used by the sync manager of client to send a list of actions on the macro to run on the server, 
in this way is reduced the number of calls to the server. 

### MacroRemoteExecution
MacroRemoteExecution is the part of the server that is responsible for the distributed execution of the macro. 
The client sends to the server an object called RED (Remote Execution Descriptor),
the server checks whether the macro needs to be done on the web service, if so invokes a method of web services
engine through the RED to continue the macro on the server, 
if the macro must be performed on another device, the server sends to the RED device in question, 
through the websocket. This section is explained in more detail in the Sinapsi Core.

## Dashboard
Sinapsi Dashboard is a web space dedicated to both administrators and users to Sinapsi. 
For administrators are visible section of the Dashboard to manage users registered on Sinapsi, 
to see the log of Engine and the web service, plus there's also a section Analitics to show the daily server load, 
and the usage of Sinapsi platform. Users of Sinapsi instead, in the dashboard can manage their macros, 
see the connected devices, create new macros using the macro editor and managing various internet services 
connected to Sinapsi platform.

## Services
The Web Service is seen as a particular device from the Synapse Engine, being a device provides components Triggers 
and Actions.

### Web Service Actions
The actions are performed in the web service when a trigger occurs. 
The choice of the actions to create the web service depends on the technology used to build the web 
service and also the effective utility that could have some action in the web service, in particular, 
would not make sense to set the web service actions that require interactions with ' user. 
Possible actions offered by the web service are:

- _Send Email_: send an email (implemented)
- _Log_: Save to file / db log (implemented)
- _Tweet_: Set on a particular tweet twitter
- _Post_: Placed on a specific Facebook post
- _save On Dropbox_: save a file on Dropbox
- ...

### Web Service Triggers
The Triggers are special events that once occurred, allow to start a series of actions. 
In the most general case a trigger could be receiving a text message or email, or in general anything 
that generates a event status in the device that was active to "listen" the trigger. 
Possible Web Service triggers:
- _Email Recived_: email received (implmented in part)
- _device Connected_: connected device
- _GET Request_: GET received richesta
- _POST Request_: POST request received
- _User Sign in_: login by a user
- ...

## License
The Sinapsi Server and the Sinapsi Dashboard are part of the Sinapsi platform.
