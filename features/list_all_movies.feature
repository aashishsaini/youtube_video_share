Feature:  As a visitor, I want to see a list of all shared movies

  Background:
    Given the following youtube movie link:
    | link |
    | https://www.youtube.com/watch?v=JO1djq1ACx0&ab_channel=MusafirAkaJoshi |

  Scenario:  See the list of all shared movies
    Given the guest visits the dashboard
    Then will be able to see all shared videos
    Then the guest will be able to identify who has shared the movie
    And  the guest will be able to read the title of movie as "Installing Tesla Type Stereo Inside XUV 500 | Mahindra XUV 500 | Stereo For Cars | Tesla For SUV"