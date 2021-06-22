import React from "react";
import ReactDOM from "react-dom";
import { BrowserRouter as Router } from 'react-router-dom';

import Sidebar from "components/Sidebar/Sidebar";

describe("Sidebar", () => {
  let subject;
  beforeEach(() => {
    subject = () => <Router><Sidebar /></Router>;
  });

  it("renders witout crashing", () => {
		const component = subject();
    const div = document.createElement("div");
    ReactDOM.render(component, div);
  });
});

