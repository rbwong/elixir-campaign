import React from "react";
import ReactDOM from "react-dom";
import { BrowserRouter as Router } from 'react-router-dom';

import Logo from "components/Sidebar/Logo";

describe("Logo", () => {
  let subject;
  beforeEach(() => {
    subject = () => <Router><Logo /></Router>;
  });

  it("renders without crashing", () => {
    const component = subject();
    const div = document.createElement("div");
    ReactDOM.render(component, div);
  });
});
