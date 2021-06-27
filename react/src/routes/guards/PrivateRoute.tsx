// @ts-nocheck
/* eslint-disable */

import React, { useEffect } from "react"
import { Route, useHistory } from "react-router-dom"

import Cookies from "js-cookie"

const PrivateRoute = ({ component: Component, path, ...rest }) => {
  const history = useHistory()
  const isAuthenticated = Cookies.get("ecToken") ? true : false

  useEffect(() => {
    if (path && isAuthenticated) {
      return
    }
    history.push("/login")
  })

  const render = (props: any) =>
    isAuthenticated === true ? <Component {...props} /> : null

  return <Route path={path} render={render} {...rest} />
}

export default PrivateRoute
