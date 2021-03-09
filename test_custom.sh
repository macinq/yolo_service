#!/bin/bash
docker run -it -d --rm --name test_yolo -p 8080:8080 1.0-yolov4_tiny_3l_custom 
sleep 5
curl -L -o test_pic.png https://www.dropbox.com/s/ho8p89ebl35ejc2/test_pic.png?dl=0
curl -X POST -F 'image_file=@test_pic.png' -F threshold=0.2 'http://localhost:8080/detect'
sleep 5
curl -X POST -F 'image_file=@test_pic.png' -F threshold=0.2 'http://localhost:8080/annotate' --output test_pic_annotate_post.png
sleep 5
curl -X GET 'http://localhost:8080/detect?url=https%3A%2F%2Fuc3a82af7c2ab84c8cb9914e1d53.previews.dropboxusercontent.com%2Fp%2Fthumb%2FABEAgyBpYB4m_UNqk7HEE0rxMRC_JHTRlLsD25O1zSJLvvP6KReakol53orvYRIbKNqavCcYoqYI54yQBZQR_uODcRgxswvwUYu0BWhNpg0ts096gearyW2EadYBmRRPPHTh9BCoQ4Pmk4ImR0UuPs3aIkfOZLRMfsbOjWtvGK4923Psabx782wZjGziM8cAHA0N8DEuzuS8Aecqr5kWvXgaIlv3vDyyuqwbzA19y0iEmPNkvcHqSOWhKICnf7aaPXfbtUk6kTbD3R15rQVhFkbgBe3ehOPQkUitllT5z_qLvFJoc7PByRWzYriicqxSCD-P9V58nzB5fxBwX-5KofEquXdoy-8zHV4mEznbY-zChiPL8gMFnPuCdWWKkmm2dkaHbfhcG3tStjSeCkGAcZHf%2Fp.png%3Ffv_content%3Dtrue%26size_mode%3D5'
sleep 5
curl -X GET 'http://localhost:8080/annotate?url=https%3A%2F%2Fuc3a82af7c2ab84c8cb9914e1d53.previews.dropboxusercontent.com%2Fp%2Fthumb%2FABEAgyBpYB4m_UNqk7HEE0rxMRC_JHTRlLsD25O1zSJLvvP6KReakol53orvYRIbKNqavCcYoqYI54yQBZQR_uODcRgxswvwUYu0BWhNpg0ts096gearyW2EadYBmRRPPHTh9BCoQ4Pmk4ImR0UuPs3aIkfOZLRMfsbOjWtvGK4923Psabx782wZjGziM8cAHA0N8DEuzuS8Aecqr5kWvXgaIlv3vDyyuqwbzA19y0iEmPNkvcHqSOWhKICnf7aaPXfbtUk6kTbD3R15rQVhFkbgBe3ehOPQkUitllT5z_qLvFJoc7PByRWzYriicqxSCD-P9V58nzB5fxBwX-5KofEquXdoy-8zHV4mEznbY-zChiPL8gMFnPuCdWWKkmm2dkaHbfhcG3tStjSeCkGAcZHf%2Fp.png%3Ffv_content%3Dtrue%26size_mode%3D5' --output test_pic_annotate_get.png
sleep 5
docker stop test_yolo
