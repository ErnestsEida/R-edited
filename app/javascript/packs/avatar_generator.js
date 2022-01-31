import React, { useState, useEffect } from 'react';
import ReactDOM from 'react-dom';
import '../../assets/stylesheets/users.scss';
import AvatarGenerator from '../avatar_generator/AvatarGenerator.jsx';

ReactDOM.render(<AvatarGenerator />, document.getElementsByClassName('content')[0]);
