import * as React from 'react';
import {
  BrowserRouter as Router,
  Route,
  Switch,
  Redirect
} from 'react-router-dom';

import Dashboard from './dashboard/Dashboard.component';
import Login from './login/Login.component';

const Routes = () => (
  <Router>
    <Switch>
      <Route exact={true} path="/" component={Dashboard} />
      <Route path="/login" component={Login} />
      <Route>
        <Redirect to="/" />
      </Route>
    </Switch>
  </Router>
);

export default Routes;
