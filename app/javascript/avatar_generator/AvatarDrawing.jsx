import React from 'react';
import AvatarDrawingDisplay from './AvatarDrawingDisplay.jsx'

function AvatarDrawing(props) {
  return (
    <div className="avatar-display col-8 d-flex justify-content-center">
      <AvatarDrawingDisplay hatData={props.hatData} hatUpdate={props.hatUpdate} faceData={props.faceData} faceUpdate={props.faceUpdate} shirtData={props.shirtData} shirtUpdate={props.shirtUpdate}/>
    </div>
  );
}

export default AvatarDrawing;
