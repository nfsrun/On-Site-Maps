# On-Site Mapping

Scenario: There are still areas around the globe that has not been mapped or pictured by anyone. With our solution, the volunteer can map out unmapped location around the globe with their smartphone device.

For example: A volunteer wants to record a house on their map. He/she can do that by setting coordinate points on their map and store it in a database as a point with an attribute of structure as 'home' or 'restaurant' or 'library'.

# Technologies we used:
  - Back end: 
    - **Azure** SQL Database for storing our coodinates information 
    - **Node.js** used to grab data from our SQL Database to be rendered on a single map that plots all the coordinates
    - **Python flask** Libray for bulding an API that stores our data in a JSON format, which can be used by other developers
    - **Swift** for bridging the communication between the UI from the smartphone and the our SQL Database.
  - Front end:
    - **Swift** for developing the user interface and interaction on your smartphone device (an iPhone)
    - **HTML**, **Bootstrap**, and **Javascript** for developing the user inteface and interaction on the map webpage

# Challenges we encountered:
    - Bridging the communications between our SQL Database and our UI Interfaces
    - Setting up our API and SQL Database configurations
    
# Drawbacks
    - Requires internet within the are where our product is being used

# Team
    - Jesse Tran
    - Kevin Tran
    - Muhammad Hariz
    - Dominic Luu
    
Special thanks to nwHacks 2019 for giving us the opportunity expand our learning