# OpenEEW Sensor Provisioning Process

This document describes the OpenEEW sensor provisioning process.

![OpenEEW Provisioning Architecture Diagram](architecture/OpenEEW-Provisioning-Diagram.png)

1. User enters the local wireless network SSID / Password in the OpenEEW Provisioning mobile app
1. Mobile App broadcasts the WiFi credentials via the
[SmartConfig protocol](https://community.particle.io/t/smart-config-the-missing-manual-now-available/442)
1. OpenEEW sensor board powers up, reads its NVRAM, finds no wifi credentials
it can connect to, starts to listen for
[SmartConfig encrypted frames](https://docs.espressif.com/projects/esp-idf/en/latest/esp32/api-reference/network/esp_smartconfig.html) on the network.
1. OpenEEW sensor receives the WiFi credentials and replies by sending its mac address and IP address to the OpenEEW provisioning mobile app
1. OpenEEW sensor does an http post to the /activation restful endpoint and sends its mac address and firmware version.
1. Node-RED endpoint receives the data and replies with the MQTT broker details, firmware update details (latest version and url)
1. Node-RED adds the IoT sensor device (if necessary) to Watson IoT Platform
1. Node-RED searches the Cloudant database for this mac address and adds / updates Cloudant database record with activation date and last check-in timestamps
1. While steps 5 to 8 are occurring, the user enters their First name, Last name, email address in the OpenEEW Provisioning app form.
They then review personally identifiable information - First name, Last name, email, mac address (sent from the board),
City, Country, Latitude, Longitude (which the app acquires from SmartPhone GPS).  
When they press the Register button, the data is posted to a http restful endpoint /OpenEEWRegistration
1. Node-RED endpoint receives the user information from the mobile app.
1. Node-RED searches the Cloudant database for this mac address. It then adds or updates the Cloudant record with the user data.
1. Merged record is available in the Cloudant database, indexed by mac address.  Note that either Step 8 or 11 can occur first. Order is not important.
