import React from 'react';

function AvatarMenuShirt(props) {
  const handleOnChange = (event) => {
    if (event.target.name === "shirtOn")
    {
      props.onChange(prevState =>({...prevState, [event.target.name]: event.target.checked}));
    } else {
      props.onChange(prevState =>({...prevState, [event.target.name]: event.target.value}));
    }
  }

    return (
      <div className="avatar-generator-menu-section">
        <div className="form-check form-switch">
          <input type="checkbox" name="shirtOn" checked={props.data["shirtOn"]} className="form-check-input" onChange={handleOnChange}/>
          <label htmlFor="shirtOn" className="form-check-label"> Shirt </label>
        </div>
        { props.data["shirtOn"] &&
          <div className="form-check form-switch">
            <input type="checkbox" name="shirtOn" className="form-check-input" onChange={handleOnChange}/>
            <label htmlFor="shirtOn" className="form-check-label"> Shirt </label>
          </div>
          &&
          <div className="form-group">
            <label htmlFor="shirtColor" className="form-label"> Shirt color </label>
            <input type="color" name="shirtColor" value={props.data["shirtColor"]} className="form-control" onChange={handleOnChange}/>
          </div>
        }
      </div>
    );
  }

export default AvatarMenuShirt;
