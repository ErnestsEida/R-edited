import React from 'react';
import { faTshirt } from '@fortawesome/free-solid-svg-icons'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'

const shirtElement = <FontAwesomeIcon icon={faTshirt} />

function AvatarDrawingDisplayShirt(props) {
  const sideMargin = (100 - (props.size * 10)) / 2;
  const topMargin = (431.8  - (props.size * 10)) - (82 - props.size * 8.2);

  const style = {
    zIndex: 1,
    position: "absolute",
    left: sideMargin + "px",
    right: sideMargin + "px",
    top: topMargin + "px",
    color: props.info["shirtColor"],
    fontSize: parseInt(props.size) * 10,
    width: "100px",
    height: "100px",
  }

  if (props.info["shirtOn"]){
    return (
      <p className="avatar-shirt" style={style}>{shirtElement}</p>
    );
  }
  return (null);
}

export default AvatarDrawingDisplayShirt;
