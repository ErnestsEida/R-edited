import React from 'react';
import AvatarMenuHat from './AvatarMenuHat.jsx';
import AvatarMenuFace from './AvatarMenuFace.jsx';
import AvatarMenuShirt from './AvatarMenuShirt.jsx';

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

export default AvatarMenu;
