import React from "react"
import { NavLink } from "react-router-dom"
import styled from "@emotion/styled"

import { fontColors } from "constants/colors"
import logo from "icons/logo.svg"

const Image = styled.img`
	height: 60px;
	padding: 10px 0;
	width: 100%;
`

function Logo() {
	return (
		<NavLink
			style={{
				backgroundColor: "transparent",
				color: fontColors.white,
				cursor: "pointer",
				textDecoration: "none",
				width: "100%",
			}}
			exact
			to='/'
		>
			<Image alt='logo' src={logo} />
		</NavLink>
	)
}

export default Logo
