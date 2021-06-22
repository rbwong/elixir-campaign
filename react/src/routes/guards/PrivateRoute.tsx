// @ts-nocheck

import React, { useEffect } from "react";
import { Route } from "react-router-dom";
import { useHistory } from "react-router-dom";
import Cookies from "js-cookie";

const PrivateRoute = ({ component: Component, path, ...rest }) => {
  const history = useHistory();
  const isAuthenticated = Cookies.get("bToken") ? true : false;
  const loading = false;

  useEffect(() => {
    if (loading || isAuthenticated) {
      return;
    }
    history.push("/login");
  }, []);

  const render = (props: any) =>
    isAuthenticated === true ? <Component {...props} /> : null;

  return <Route path={path} render={render} {...rest} />;
};

export default PrivateRoute;
