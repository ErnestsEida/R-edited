import React, { useState, useEffect } from 'react'
const Axios = require('axios');
import AvatarDrawing from './AvatarDrawing.jsx';
import AvatarMenu from './AvatarMenu.jsx';

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
    return document.getElementsByClassName("js-user")[0].getAttribute('data-user');
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
      <AvatarMenu onSubmit={handleSubmit} hatUpdate={setHat} onHatChange={setHat} hatData={hat} faceUpdate={setFace} onFaceChange={setFace} faceData={face} onShirtChange={setShirt} shirtData={shirt}/>
      <AvatarDrawing hatData={hat} faceData={face} shirtData={shirt}/>
    </div>
  );
}

export default AvatarGenerator;
