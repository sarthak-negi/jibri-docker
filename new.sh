
docker cp jm/index.html docker-jitsi-meet_web_1:/usr/share/jitsi-meet/index.html
docker cp jm/app.bundle.min.js docker-jitsi-meet_web_1:/usr/share/jitsi-meet/libs/app.bundle.min.js
docker cp jm/watermark.png docker-jitsi-meet_web_1:/usr/share/jitsi-meet/images/watermark.png
docker cp jm/main.json docker-jitsi-meet_web_1:/usr/share/jitsi-meet/lang/main.json

sudo cp interface_config.js ~/.jitsi-meet-cfg/web/interface_config.js