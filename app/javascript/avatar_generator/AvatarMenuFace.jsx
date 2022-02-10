import React from 'react';

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

export default AvatarMenuFace;
