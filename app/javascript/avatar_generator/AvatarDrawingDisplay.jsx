import React from 'react';
import AvatarDrawingDisplayShirt from './AvatarDrawingDisplayShirt.jsx';
import AvatarDrawingDisplayFace from './AvatarDrawingDisplayFace.jsx';
import AvatarDrawingDisplayHat from './AvatarDrawingDisplayHat.jsx';

function AvatarDrawingDisplay(props) {
  const style = {
    position: "relative",
    width: "100px",
    height: "100vh",
  }

  return (
    <div className="avatar-menu-display" style={style}>
      <AvatarDrawingDisplayHat info={props.hatData} faceSize={props.faceData["faceSize"]}/>
      <AvatarDrawingDisplayFace info={props.faceData}/>
      <AvatarDrawingDisplayShirt info={props.shirtData} size={props.faceData["faceSize"]}/>
    </div>
  );
}

export default AvatarDrawingDisplay;
