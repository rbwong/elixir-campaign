import React, { useEffect } from "react";
import { BrowserRouter as Router, Switch, Route } from "react-router-dom";

// Components
import PrivateRoute from "routes/guards/PrivateRoute";
import AuthenticatedRoutes from "routes/AuthenticatedRoutes";
import LoginPage from "pages/LoginPage";

function App() {
  useEffect(() => {
    document.title = "Elixir Campaign";
  }, []);

  return (
    <Router>
      <Switch>
        <Route path="/login" component={LoginPage} />
        <PrivateRoute path="/" component={AuthenticatedRoutes} />
      </Switch>
    </Router>
  );
}

export default App;
