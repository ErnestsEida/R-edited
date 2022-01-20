import React, { useState, useEffect } from 'react'
import ReactDOM from 'react-dom'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faHatWizard, faHatCowboySide, faHardHat, faLaugh, faSmile, faRobot, faMeh, faDizzy, faShirt, faTshirt } from '@fortawesome/free-solid-svg-icons'
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

function AvatarMenu(props) {
  const handleSubmit = (event) => {
    props.onSubmit();
    event.preventDefault();
  }

  return (
    <form className="col-4 avatar-generator-menu" onSubmit={handleSubmit}>
      <input type="submit" value="Save" className="btn btn-primary form-control"/>
      <AvatarMenuHat onChange={props.onHatChange} data={props.hatData}/>
      <AvatarMenuFace onChange={props.onFaceChange} data={props.faceData}/>
      <AvatarMenuShirt onChange={props.onShirtChange} data={props.shirtData}/>
    </form>
  );
}

function AvatarMenuHat(props) {

  const handleOnChange = (event) => {
    props.onChange(prevState =>({...prevState, [event.target.name]: event.target.value}));
  }
  if (props.data["hatType"] === "none") {
    return (
      <div className="avatar-generator-menu-section">
        <div className="form-group">
          <label htmlFor="hatType" className="form-label"> Hat type </label>
          <select name="hatType" value={props.data["hatType"]} className="form-select" onChange={handleOnChange}>
            <option value="none">None</option>
            <option value="wizard">Wizard</option>
            <option value="cowboy">Cowboy</option>
            <option value="hardhat">Hardhat</option>
          </select>
        </div>
      </div>
    )
  } else {
    return (
      <div className="avatar-generator-menu-section">
        <div className="form-group">
          <label htmlFor="hatType" className="form-label"> Hat type </label>
          <select name="hatType" value={props.data["hatType"]} className="form-select" onChange={handleOnChange}>
            <option value="none">None</option>
            <option value="wizard">Wizard</option>
            <option value="cowboy">Cowboy</option>
            <option value="hardhat">Hardhat</option>
          </select>
        </div>

        <div className="form-group">
          <label htmlFor="hatSize" className="form-label"> Hat size </label>
          <input type="range" value={props.data["hatSize"]} name="hatSize" className="form-control" min="1" max="10" onChange={handleOnChange}/>
        </div>

        <div className="form-group">
          <label htmlFor="hatColor" className="form-label"> Hat color </label>
          <input type="color" value={props.data["hatColor"]} name="hatColor" className="form-control" onChange={handleOnChange} />
        </div>
      </div>
    );
  }
}

function AvatarMenuFace(props) {
  const handleOnChange = (event) => {
    props.onChange(prevState =>({...prevState, [event.target.name]: event.target.value}));
  }

  return (
    <div className="avatar-generator-menu-section">
      <div className="form-group">
        <label htmlFor="faceType" className="form-label"> Face type </label>
        <select name="faceType" value={props.data["faceType"]} className="form-select" onChange={handleOnChange}>
          <option value="smile">Smile</option>
          <option value="stare">Stare</option>
          <option value="laugh">Laugh</option>
          <option value="dizzy">Dizzy</option>
          <option value="robot">Robot</option>
        </select>
      </div>

      <div className="form-group">
        <label htmlFor="faceSize" className="form-label"> Face size </label>
        <input type="range" name="faceSize" value={props.data["faceSize"]} className="form-control" min="1" max="10" onChange={handleOnChange}/>
      </div>

      <div className="form-group">
        <label htmlFor="faceColor" className="form-label"> Face color </label>
        <input type="color" name="faceColor" className="form-control" value={props.data["faceColor"]} onChange={handleOnChange}/>
      </div>
    </div>
  );
}

function AvatarMenuShirt(props) {
  const handleOnChange = (event) => {
    if (event.target.name === "shirtOn")
    {
      props.onChange(prevState =>({...prevState, [event.target.name]: event.target.checked}));
    } else {
      props.onChange(prevState =>({...prevState, [event.target.name]: event.target.value}));
    }
  }

  if (!props.data["shirtOn"]) {
    return (
      <div className="avatar-generator-menu-section">
        <div className="form-check form-switch">
          <input type="checkbox" name="shirtOn" value={props.data["shirtOn"]} className="form-check-input" onChange={handleOnChange}/>
          <label htmlFor="shirtOn" className="form-check-label"> Shirt </label>
        </div>
      </div>
    );
  } else {
    return (
      <div className="avatar-generator-menu-section">
        <div className="form-check form-switch">
          <input type="checkbox" name="shirtOn" className="form-check-input" onChange={handleOnChange}/>
          <label htmlFor="shirtOn" className="form-check-label"> Shirt </label>
        </div>

        <div className="form-group">
          <label htmlFor="shirtColor" className="form-label"> Shirt color </label>
          <input type="color" name="shirtColor" value={props.data["shirtColor"]} className="form-control" onChange={handleOnChange}/>
        </div>
      </div>
    );
  }
}

function AvatarDrawing(props) {
  return (
    <div className="col-8 d-flex justify-content-center">
      <AvatarDrawingDisplay hatData={props.hatData} faceData={props.faceData} shirtData={props.shirtData}/>
    </div>
  );
}

function AvatarDrawingDisplay(props) {
  return (
    <div className="avatar-menu-display">
      <AvatarDrawingDisplayHat info={props.hatData}/>
      <AvatarDrawingDisplayFace info={props.faceData}/>
      <AvatarDrawingDisplayShirt info={props.shirtData} size={props.faceData["faceSize"]}/>
    </div>
  );
}

function AvatarDrawingDisplayHat(props) {
  const style = {
    fontSize: parseInt(props.info["hatSize"]) * 10,
    color: props.info["hatColor"],
  }
  return (
    <p className="avatar-hat" style={style}>{hats[props.info["hatType"]]}</p>
  );
}

function AvatarDrawingDisplayFace(props) {
  const style = {
    fontSize: parseInt(props.info["faceSize"]) * 10,
    color: props.info["faceColor"],
  }
  return (
    <p className="avatar-face" style={style}>{faces[props.info["faceType"]]}</p>
  );
}

function AvatarDrawingDisplayShirt(props) {
  const style = {
    color: props.info["shirtColor"],
    fontSize: parseInt(props.size) * 10,
  }

  if (props.info["shirtOn"]){
    return (
      <p className="avatar-shirt" style={style}>{shirtElement}</p>
    );
  }
  return (null);
}

function AvatarGenerator(props) {
  const [hat, setHat] = useState({
    hatType: "none",
    hatSize: 5,
    hatColor: "#666666",
  });
  const [face, setFace] = useState({
    faceType: "smile",
    faceSize: 5,
    faceColor: "#666666",
  });
  const [shirt, setShirt] = useState({
    shirtOn: false,
    shirtColor: "#666666",
  });

  function getUserId() {
    let userId = window.location.pathname.split("/")[2];
    return userId;
  }

  useEffect(() => {
    const userId = getUserId();
    Axios.get('/users/'+userId+'/fetch_avatar')
      .then((response) => {
        setHat(response["data"]["hat"]);
        setFace(response["data"]["face"]);
        setShirt(response["data"]["shirt"]);
      }).catch((error) => {
        console.error(error);
      });
  }, []);

  const handleSubmit = () => {
    const userId = getUserId();
    const data = {
        hat: hat,
        face: face,
        shirt: shirt,
    }

    Axios.patch('/users/'+userId+'/update_avatar', data)
      .catch((error) => {
        console.error("error occured on saving avatar!");
      });
  }

  return (
    <div className="row">
      <AvatarMenu onSubmit={handleSubmit} onHatChange={setHat} hatData={hat} onFaceChange={setFace} faceData={face} onShirtChange={setShirt} shirtData={shirt}/>
      <AvatarDrawing hatData={hat} faceData={face} shirtData={shirt}/>
    </div>
  );
}

ReactDOM.render(<AvatarGenerator />, document.getElementsByClassName('content')[0]);
