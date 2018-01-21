import * as React from 'react';

import Routes from './Routes';
import './App.css';

// Material-ui
import 'typeface-roboto';
import Reboot from 'material-ui/Reboot';

const App = () => (
  <React.Fragment>
    <Reboot />
    <Routes />
  </React.Fragment>
);

export default App;
