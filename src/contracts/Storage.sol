// SPDX-License-Identifier: LGPL-3.0-only
pragma solidity ^0.8.12;
pragma abicoder v2;

contract Storage {
  // FIRST PART FOR MAKING A DONATION REQUEST

  /* Create variables for total number of requests in each category strings for
  each will be defined in the UI. */
  uint256 public animalRequests;
  uint256 public businessRequests;
  uint256 public communityRequests;
  uint256 public competitionRequests;
  uint256 public creativeRequests;
  uint256 public educationRequests;
  uint256 public emergencyRequests;
  uint256 public environmentRequests;
  uint256 public eventRequests;
  uint256 public familyRequests;
  uint256 public individualRequests;
  uint256 public medicalRequests;
  uint256 public memorialRequests;
  uint256 public nonprofitRequests;
  uint256 public religiousRequests;
  uint256 public sportRequests;
  uint256 public travelRequests;
  uint256 public volunteerRequests;
  uint256 public wishRequests;

  // Add url to Request to read IPFS, Arweave and web2 storage Images 
  struct Request {
      string title;
      string description;
      uint256 id;
      // Amount Requested
      uint256 amount;
      uint256 totalOrganizers;
      uint256 totalContributors;
      int256 score;
      address creator;
      uint256 totalPosts;
  }

  struct Contributor {
    uint256 amountDonated;
    address contributorAddress;
    uint256 id;
  }

  struct Organizer {
    string name;
    string role;
    /* Coins are chosen based on being meant for medium of exchange with high
    transaction volume at the time. ADA and ETH are there aswell for smart
    contract support if people are interested in using that. */
    string[12] addresses;
    /* index 0 = btcAddress;
    index 1 = bchAddress;
    index 2 = adaAddress;
    index 3 = dashAddress;
    index 4 = dogeAddress;
    index 5 = ethAddress;
    index 6 = ltcAddress;
    index 7 = xmrAddress;
    index 8 = zecAddress;
    index 9 = maticAddress;
    index 10 = xlmAddress;
    index 11 = xrpAddress; */
  }

  // Just to return Organizer addresses array in UI/tests
  function getOrganizer (string memory _category, uint _requestId, uint _organizerId) public view returns (Organizer memory) {
    return Organizers[_category][_requestId][_organizerId];
  }

  // Date can be passed in from UI as UTC Time
  struct Post {
    string title;
    string description;
    string date;
  }

  // category => id of request
  mapping(string => mapping(uint256 => Request)) public Requests;
  // category => id of request => id of contributor
  mapping(string => mapping(uint256 => mapping(uint256 => Contributor))) public Contributors;
  // category => id of request => id of organizer
  mapping(string => mapping(uint256 => mapping(uint256 => Organizer))) public Organizers;
  // category => id of request => Polygon address of user
  mapping(string => mapping(uint256 => mapping(address => bool))) public isVoted;
  // category => id of request => id of post
  mapping(string => mapping(uint256 => mapping(uint256 => Post))) public Posts;

  function createRequest (
    string memory _title,
    string memory _description,
    string memory _category,
    uint256 _amount
  ) public {
    /* Sorting into category variables makes the code more complex with large if
    else statements however may be useful in the case of the frontend being
    shutdown and needing to be redeployed with all the data in the proper location */
     if (keccak256(bytes(_category)) == keccak256(bytes("Animal"))) {
        Requests[_category][animalRequests] = Request(_title, _description, animalRequests, _amount, 0, 0, 0, msg.sender, 0);
        animalRequests++;
    } else if (keccak256(bytes(_category)) == keccak256(bytes("Business"))) {
        Requests[_category][businessRequests] = Request(_title, _description, businessRequests, _amount, 0, 0, 0, msg.sender, 0);
        businessRequests++;
    } else if (keccak256(bytes(_category)) == keccak256(bytes("Community"))) {
        Requests[_category][communityRequests] = Request(_title, _description, communityRequests, _amount, 0, 0, 0, msg.sender, 0);
        communityRequests++;
    } else if (keccak256(bytes(_category)) == keccak256(bytes("Competition"))) {
        Requests[_category][competitionRequests] = Request(_title, _description, competitionRequests, _amount, 0, 0, 0, msg.sender, 0);
        competitionRequests++;
    } else if (keccak256(bytes(_category)) == keccak256(bytes("Creative"))) {
        Requests[_category][creativeRequests] = Request(_title, _description, creativeRequests, _amount, 0, 0, 0, msg.sender, 0);
        creativeRequests++;
    } else if (keccak256(bytes(_category)) == keccak256(bytes("Education"))) {
        Requests[_category][educationRequests] = Request(_title, _description, educationRequests, _amount, 0, 0, 0, msg.sender, 0);
        educationRequests++;
    } else if (keccak256(bytes(_category)) == keccak256(bytes("Emergency"))) {
        Requests[_category][emergencyRequests] = Request(_title, _description, emergencyRequests, _amount, 0, 0, 0, msg.sender, 0);
        emergencyRequests++;
    } else if (keccak256(bytes(_category)) == keccak256(bytes("Environment"))) {
        Requests[_category][environmentRequests] = Request(_title, _description, environmentRequests, _amount, 0, 0, 0, msg.sender, 0);
        environmentRequests++;
    } else if (keccak256(bytes(_category)) == keccak256(bytes("Event"))) {
        Requests[_category][eventRequests] = Request(_title, _description, eventRequests, _amount, 0, 0, 0, msg.sender, 0);
        eventRequests++;
    } else if (keccak256(bytes(_category)) == keccak256(bytes("Family"))) {
        Requests[_category][familyRequests] = Request(_title, _description, familyRequests, _amount, 0, 0, 0, msg.sender, 0);
        familyRequests++;
    } else if (keccak256(bytes(_category)) == keccak256(bytes("Individual"))) {
        Requests[_category][individualRequests] = Request(_title, _description, individualRequests, _amount, 0, 0, 0, msg.sender, 0);
        individualRequests++;
    } else if (keccak256(bytes(_category)) == keccak256(bytes("Medical"))) {
        Requests[_category][medicalRequests] = Request(_title, _description, medicalRequests, _amount, 0, 0, 0, msg.sender, 0);
        medicalRequests++;
    } else if (keccak256(bytes(_category)) == keccak256(bytes("Memorial"))) {
        Requests[_category][memorialRequests] = Request(_title, _description, memorialRequests, _amount, 0, 0, 0, msg.sender, 0);
        memorialRequests++;
    } else if (keccak256(bytes(_category)) == keccak256(bytes("NonProfit"))) {
        Requests[_category][nonprofitRequests] = Request(_title, _description, nonprofitRequests, _amount, 0, 0, 0, msg.sender, 0);
        nonprofitRequests++;
    } else if (keccak256(bytes(_category)) == keccak256(bytes("Religious"))) {
        Requests[_category][religiousRequests] = Request(_title, _description, religiousRequests, _amount, 0, 0, 0, msg.sender, 0);
        religiousRequests++;
    } else if (keccak256(bytes(_category)) == keccak256(bytes("Sports"))) {
        Requests[_category][sportRequests] = Request(_title, _description, sportRequests, _amount, 0, 0, 0, msg.sender, 0);
        sportRequests++;
    } else if (keccak256(bytes(_category)) == keccak256(bytes("Travel"))) {
        Requests[_category][travelRequests] = Request(_title, _description, travelRequests, _amount, 0, 0, 0, msg.sender, 0);
        travelRequests++;
    } else if (keccak256(bytes(_category)) == keccak256(bytes("Volunteer"))) {
        Requests[_category][volunteerRequests] = Request(_title, _description, volunteerRequests, _amount, 0, 0, 0, msg.sender, 0);
        volunteerRequests++;
    } else if (keccak256(bytes(_category)) == keccak256(bytes("Wish"))) {
        Requests[_category][wishRequests] = Request(_title, _description, wishRequests, _amount, 0, 0, 0, msg.sender, 0);
        wishRequests++;
    }
  }

  /* Name should also have a default value of Anonymous in the UI for those who
    don't feel safe connecting names to addresses.
  */
  function addOrganzier (
    string memory _role,
    string memory _category,
    uint256 _requestId,
    address _profile
  ) public {
    uint256 _totalOrganizers = (Requests[_category][_requestId].totalOrganizers + 1);
    require(msg.sender == Requests[_category][_requestId].creator);
    /* Not all addresses need to be assigned a value. In the UI any addresses not
    assigned by default should be set to "" which would mean an empty string.
    That will cause setting the mapping data to not fail. Role will also be set
    through the UI. Here we are calling ProfileAddresses found in below which will call
    the name and addresses already setup in the users profile this saves time and gas
    when making multiple donation requests. It may also be possible to remove name and
    addresses being saved in the Organizer struct and just display them in the UI by 
    doing a .call() however this creates more load on the API for users not logged in. */
    string memory _name = ProfileAddresses[_profile].name;
    string[12] memory _addresses = ProfileAddresses[_profile].addresses;
    Organizers[_category][_requestId][_totalOrganizers] = Organizer(
      _name, _role, _addresses
    );
    Requests[_category][_requestId].totalOrganizers++;
  }

  // Only the role should be editable
  function editOrganizer (
    string memory _role,
    string memory _category,
    uint256 _requestId,
    uint256 _organizerId
  ) public {
    /* Will make sure only the request creator can edit organizer data since category and requestId 
    are given as inputs */
    require(msg.sender == Requests[_category][_requestId].creator);
    string memory _name = Organizers[_category][_requestId][_organizerId].name;
    string[12] memory _addresses = Organizers[_category][_requestId][_organizerId].addresses;
    /* This method will cost extra gas and can be improved upon. This can be
    solved by either taking in less addresses or another way. In it's current
    form it will call the current data from the blockchain and input it into the
    UI and once resubmitted you will paying that extra gas to rewrite the same
    address again for those unchanged. The goal would be to save that extra gas
    cost so only the address added/changed is what's sent back. */
    Organizers[_category][_requestId][_organizerId] = Organizer(
      _name, _role, _addresses
    );
  }

    function deleteOrganizer (
    string memory _category,
    uint256 _requestId,
    uint256 _organizerId
  ) public {
    require(msg.sender == Requests[_category][_requestId].creator);

    /* Same issue as noted with editOrganizer above. With deleting an Organizer we
    can only clear the data to empty strings. It will be the job of the UI to detect
    this and not attempt to display it to a user. We can do this by checking either
    no role has been given or by checking the Polygon address is doesn't exist which
    is index 9 of the array. This is because the profile needs a Polygon address as a
    minimum requirement to be an Organizer. */
    Organizers[_category][_requestId][_organizerId] = Organizer(
      "", "", ["", "", "", "", "", "" ,"" ,"" ,"", "" ,"" ,""]
    );
  }

  /* Values come from blockchain calls. Title should also be immutable in case of
  an account getting hacked or a scammer changing the name and description of a
  request. Another alternative is to allow this to be changed but have the entire
  list of Contributors wiped. */
  function editRequest (
    string memory _description,
    string memory _category,
    uint256 _requestId,
    uint256 _amount
  ) public {
    require(msg.sender == Requests[_category][_requestId].creator);
    string memory _title = Requests[_category][_requestId].title;
    uint256 _totalOrganizers = Requests[_category][_requestId].totalOrganizers;
    uint256 _totalContributors = Requests[_category][_requestId].totalContributors;
    int256 _score = Requests[_category][_requestId].score;
    address _creator = Requests[_category][_requestId].creator;
    uint256 _totalPosts = Requests[_category][_requestId].totalPosts;

    Requests[_category][_requestId] = Request(_title, _description, _requestId, _amount, _totalOrganizers, _totalContributors, _score, _creator, _totalPosts);
  }

  /* This feature may need to be disabled in UI in the future if it is used harmfully.
  This feature can easily be exploited through multiple self made accounts or even
  bot made to upvote scam requests to encourage people to donate to that request over
  a potentially real one. Therefore this should not be used as a feature to sort
  through requests and determine which is best to display first. */
  function voteRequest (
    string memory _category,
    uint256 _requestId,
    bool _vote
  ) public {
    require(isVoted[_category][_requestId][msg.sender] == false);
    string memory _title = Requests[_category][_requestId].title;
    string memory _description = Requests[_category][_requestId].description;
    uint256 _amount = Requests[_category][_requestId].amount;
    uint256 _totalOrganizers = Requests[_category][_requestId].totalOrganizers;
    uint256 _totalContributors = Requests[_category][_requestId].totalContributors;
    address _creator = Requests[_category][_requestId].creator;
    uint256 _totalPosts = Requests[_category][_requestId].totalPosts;
    int256 _score = Requests[_category][_requestId].score;

    /* Downvoting can cause a large majority of people to downvote a real donation
    request just bekcause it offends them or doesn't align with their views. This
    should not be solely used as a way to sort requests in the UI for this reason,
    hoever it should be kept in the system to alert people of something that may be
    a faker request or a scammer. The other flaw with this system is that with the
    low gas fees of hosting on a layer 2 protocol people can make many accounts and
    send small balances to boost the upvotes on their request even if it is a scam.
    Therefore this system may need to be disabled in the UI in the future if that is
    the case. */

    // bool = true then upvote else downvote
    if (_vote) {
      _score++;
    } else {
      _score--;
    }

    isVoted[_category][_requestId][msg.sender] = true;
    Requests[_category][_requestId] = Request(_title, _description, _requestId, _amount, _totalOrganizers, _totalContributors, _score, _creator, _totalPosts);
  }

  function addContributor(
    string memory _category,
    uint256 _requestId
  ) public payable {
    require (msg.value > 1);
    uint256 _amountDonated = msg.value;
    address _contributorAddress = msg.sender;
    (bool success, ) = _contributorAddress.call{value: _amountDonated}("");
    require(success, "Transaction failed.");
    uint256 _totalContributors = Requests[_category][_requestId].totalContributors;
    Contributors[_category][_requestId][_totalContributors] = Contributor(_amountDonated, _contributorAddress, _totalContributors);
    Requests[_category][_requestId].totalContributors++;
  }

  function addPost (
    string memory _category,
    uint256 _requestId,
    string memory _title,
    string memory _description,
    string memory _date
  ) public {
    require(msg.sender == Requests[_category][_requestId].creator);
    uint256 _totalPosts = Requests[_category][_requestId].totalPosts;

    Posts[_category][_requestId][_totalPosts] = Post(_title, _description, _date);
    Requests[_category][_requestId].totalPosts++;
  }

  // SECOND PART FOR HOSTING ADDRESSES ON A PROFILE

  // A profile doesn't need to be manually created because it will locate your account based on your polygon address
  struct Profile{
    // Name should be optional
    string name;
    string[12] addresses;
    /* index 0 = btcAddress;
    index 1 = bchAddress;
    index 2 = adaAddress;
    index 3 = dashAddress;
    index 4 = dogeAddress;
    index 5 = ethAddress;
    index 6 = ltcAddress;
    index 7 = xmrAddress;
    index 8 = zecAddress;
    index 9 = maticAddress;
    index 10 = xlmAddress;
    index 11 = xrpAddress; */
  }

  // Polygon Account address => Addresses
  mapping(address => Profile) public ProfileAddresses;

  function addAddressToProfile(
    string memory _name,
    string[12] memory _addresses
  ) public {
    // As mentioned with Organizer not all addresses need to be provided 
    ProfileAddresses[msg.sender] = Profile(_name, [_addresses[0], _addresses[1], _addresses[2],
      _addresses[3], _addresses[4], _addresses[5], _addresses[6], _addresses[7],
      _addresses[8], _addresses[9], _addresses[10], _addresses[11]
      ]
    );
  }

  /* There is no deleteProfile function as all Polygon addresses will by default without logging in return
  with a profile page for just the polygon account. Therefore only an editProfile is needed to edit/remove/add 
  addresses. */
    function editProfile(
    string memory _name,
    string[12] memory _addresses
  ) public {
    // As mentioned with Organizer not all addresses need to be provided 
    ProfileAddresses[msg.sender] = Profile(_name, [_addresses[0], _addresses[1], _addresses[2],
      _addresses[3], _addresses[4], _addresses[5], _addresses[6], _addresses[7],
      _addresses[8], _addresses[9], _addresses[10], _addresses[11]
      ]
    );
  }

}

