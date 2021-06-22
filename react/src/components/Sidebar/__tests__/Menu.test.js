import React from "react";
import ReactDOM from "react-dom";
import { BrowserRouter as Router } from 'react-router-dom';
import { render, screen } from '@testing-library/react';

import Menu from "components/Sidebar/Menu";

describe("Menu", () => {
	let props;
  let subject;
  beforeEach(() => {
		props = {
      to: '/sample',
      exact: true,
    };
    subject = () => <Router><Menu {...props}>Text</Menu></Router>;
  });

  it("renders witout crashing", () => {
		const component = subject();
    const div = document.createElement("div");
    ReactDOM.render(component, div);
  });

	it('renders with text', () => {
		const component = subject();
		render(component);
		expect(screen.getByText('Text')).toBeInTheDocument();
	});
});

