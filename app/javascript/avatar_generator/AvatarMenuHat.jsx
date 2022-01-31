import React from 'react';

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

export default AvatarMenuHat;
