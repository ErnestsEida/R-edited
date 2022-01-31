import React, { useState, useEffect } from 'react'
import ReactDOM from 'react-dom'
import Cookies from 'js-cookie';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faHatWizard, faHatCowboySide, faHardHat, faLaugh, faSmile, faRobot, faMeh, faDizzy, faTshirt } from '@fortawesome/free-solid-svg-icons'
const Axios = require('axios');

const hats = {
  wizard: <FontAwesomeIcon icon={faHatWizard} />,
  cowboy: <FontAwesomeIcon icon={faHatCowboySide} />,
  hardhat: <FontAwesomeIcon icon={faHardHat} />
}

const faces = {
  laugh: <FontAwesomeIcon icon={faLaugh} />,
  smile: <FontAwesomeIcon icon={faSmile} />,
  robot: <FontAwesomeIcon icon={faRobot} />,
  stare: <FontAwesomeIcon icon={faMeh} />,
  dizzy: <FontAwesomeIcon icon={faDizzy} />,
}

const shirtElement = <FontAwesomeIcon icon={faTshirt} />

function NavbarAvatarDisplay(props) {
  const [hat, setHat] = useState({
    hatType: "none",
    hatSize: 5,
    hatColor: "#666666",
  });
  const [face, setFace] = useState({
    faceType: "smile",
    faceSize: 5,
    faceColor: "#666666"
  });
  const [shirt, setShirt] = useState({
    shirtOn: false,
    shirtColor: "#666666",
  });


  useEffect(() => {
    const userId = Cookies.get("user");
    Axios.get("/users/"+userId+"/fetch_avatar")
      .then((response) => {
        setHat(response["data"]["hat"]);
        setFace(response["data"]["face"]);
        setShirt(response["data"]["shirt"]);
      })
      .catch((error) => {
        console.error("error on fetching avatar!");
      })
  }, []);

  return (
    <div className="avatar-container">
      <NavbarAvatarDisplayHat info={hat}/>
      <NavbarAvatarDisplayFace info={face}/>
      <NavbarAvatarDisplayShirt info={shirt}/>
    </div>
  );
}

function NavbarAvatarDisplayHat(props) {
  const style = {
    zIndex: 3,
    color: props.info["hatColor"],
    position: "absolute",
    top: "10px",
  };

  return (
    <p style={style}>{hats[props.info["hatType"]]}</p>
  );
}

function NavbarAvatarDisplayFace(props) {
  const style = {
    zIndex: 2,
    color: props.info["faceColor"],
    position: "absolute",
    top: "22px",
  };

  return (
    <p style={style}>{faces[props.info["faceType"]]}</p>
  );
}

function NavbarAvatarDisplayShirt(props) {
  const style = {
    zIndex: 1,
    color: props.info["shirtColor"],
    position: "absolute",
    top: "35px"
  };

  return (
    <p style={style}>{shirtElement}</p>
  );
}

if (document.getElementById("avatar-display") !== null) {
  ReactDOM.render(<NavbarAvatarDisplay />, document.getElementById("avatar-display"));
}
