import React from "react"
import styled from "@emotion/styled"

import { bgColors } from "constants/colors"
import Logo from "components/Sidebar/Logo"
import Menu from "components/Sidebar/Menu"

const Container = styled.div`
	background-color: ${bgColors.dark0};
	border-radius: 8px;
	display: flex;
	flex-direction: column;
	height: calc(100vh);
	padding: 10px;
	width: 200px;

	position: -webkit-sticky; /* Safari */
	position: sticky;
	top: 0;
`

const LogoContainer = styled.div`
	align-items: center;
	flex: 0 0 60px;
	height: 60px;
	justify-content: center;
	width: 100%;
`

const List = styled.div`
	display: flex;
	flex: 1;
	flex-direction: column;
	margin-top: 16px;
	width: 100%;
`

function Sidebar() {
	return (
		<Container>
			<LogoContainer>
				<Logo />
			</LogoContainer>
			<List>
				<Menu exact to='/'>
					Campaigns
				</Menu>
				<Menu to='/metrics'>Metrics (Coming soon)</Menu>
			</List>
		</Container>
	)
}

export default Sidebar
