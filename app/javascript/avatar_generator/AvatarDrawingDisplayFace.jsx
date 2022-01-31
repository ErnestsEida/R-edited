import React from 'react';
import { faLaugh, faSmile, faRobot, faMeh, faDizzy} from '@fortawesome/free-solid-svg-icons'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'

const faces = {
  laugh: <FontAwesomeIcon icon={faLaugh} />,
  smile: <FontAwesomeIcon icon={faSmile} />,
  robot: <FontAwesomeIcon icon={faRobot} />,
  stare: <FontAwesomeIcon icon={faMeh} />,
  dizzy: <FontAwesomeIcon icon={faDizzy} />,
}

function AvatarDrawingDisplayFace(props) {
  const sideMargin = (100 - (props.info["faceSize"] * 10)) / 2;
  const topMargin = 350 - (props.info["faceSize"] * 10);

  const style = {
    zIndex: 2,
    position: "absolute",
    top: topMargin + "px",
    left: sideMargin.toString() + "px",
    right: sideMargin.toString() + "px",
    fontSize: parseInt(props.info["faceSize"]) * 10,
    color: props.info["faceColor"],
    width: "100px",
    height: "100px",
  }

  return (
    <p className="avatar-face" style={style}>{faces[props.info["faceType"]]}</p>
  );
}

export default AvatarDrawingDisplayFace;
