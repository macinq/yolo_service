#!/bin/bash
docker run -dit --rm --name test_yolo -p 9999:8080 johannestang/yolo_service:1.0-yolov4_tiny_3l_custom
sleep 5
curl -L -o test_pic.png https://www.dropbox.com/s/ho8p89ebl35ejc2/test_pic.png?dl=0
curl -X POST -F 'image_file=@test_pic.png' -F threshold=0.2 'http://localhost:9999/detect'
curl -X GET 'http://localhost:9999/detect?url=https%3A%2F%2Fwww.dropbox.com%2Fs%2Fho8p89ebl35ejc2%2Ftest_pic.png%3Fdl%3D0'
docker stop test_yolo
