Feature:  As a user, I want to share a youtube movie

  Scenario:  See the list of all shared movies
    Given I visits the dashboard
    And logged in as:
    | user             | password |
    | test@example.com | test@123 |
    And click on "Share a movie" link
    Then will be able to see movie share form
    And I submits the form after filling "https://www.youtube.com/watch?v=JO1djq1ACx0&ab_channel=MusafirAkaJoshi" as youtube link
    And I visits the dashboard
    Then I will be able to read the title of movie as "Installing Tesla Type Stereo Inside XUV 500 | Mahindra XUV 500 | Stereo For Cars | Tesla For SUV"