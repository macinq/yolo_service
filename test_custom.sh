#!/bin/bash
docker run -it -d --rm --name test_yolo -p 8080:8080 1.0-yolov4_tiny_3l_custom 
sleep 5
curl -L -o test_pic.png https://www.dropbox.com/s/ho8p89ebl35ejc2/test_pic.png?dl=0
curl -X POST -F 'image_file=@test_pic.png' -F threshold=0.2 'http://localhost:8080/detect'
curl -X POST -F 'image_file=@test_pic.png' -F threshold=0.2 'http://localhost:8080/annotate' --output test_pic_annotate_post.png
curl -X GET 'http://localhost:8080/detect?url=https%3A%2F%2Fwww.dropbox.com%2Fs%2Fho8p89ebl35ejc2%2Ftest_pic.png%3Fdl%3D0'
curl -X GET 'http://localhost:8080/annotate?url=https%3A%2F%2Fwww.dropbox.com%2Fs%2Fho8p89ebl35ejc2%2Ftest_pic.png%3Fdl%3D0' --output test_pic_annotate_get.png
docker stop test_yolo
