import React from "react"
import { NavLink } from "react-router-dom"

import { baseColors, fontColors } from "constants/colors"

interface Props {
	children: any
	exact?: boolean
	to: string
}

const Menu: React.FC<Props> = ({ children, exact, to }: Props) => (
	<NavLink
		style={{
			backgroundColor: "transparent",
			borderRadius: "3px",
			color: fontColors.white,
			cursor: "pointer",
			fontSize: "13px",
			marginBottom: "10px",
			padding: "10px 20px",
			textAlign: "center",
			textDecoration: "none",
		}}
		activeStyle={{ backgroundColor: baseColors.opaque }}
		exact={exact}
		to={to}
	>
		{children}
	</NavLink>
)

export default Menu
