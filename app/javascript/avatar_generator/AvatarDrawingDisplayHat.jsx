import React from 'react';
import { faHatWizard, faHatCowboySide, faHardHat} from '@fortawesome/free-solid-svg-icons'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'

const hats = {
  wizard: <FontAwesomeIcon icon={faHatWizard} />,
  cowboy: <FontAwesomeIcon icon={faHatCowboySide} />,
  hardhat: <FontAwesomeIcon icon={faHardHat} />
}

function AvatarDrawingDisplayHat(props) {
  const sideMargin = (100 - (props.info["hatSize"] * 10)) / 2
  const topMargin = (280 - (props.info["hatSize"] * 10)) + (70 - props.faceSize * 7);

  const style = {
    zIndex: 3,
    position: "absolute",
    top: topMargin + "px",
    right: sideMargin.toString() + "px",
    left: sideMargin.toString() + "px",
    fontSize: parseInt(props.info["hatSize"]) * 10,
    color: props.info["hatColor"],
    width: "100px",
    height: "100px",
  }
  return (
    <p className="avatar-hat" style={style}>{hats[props.info["hatType"]]}</p>
  );
}

export default AvatarDrawingDisplayHat;
