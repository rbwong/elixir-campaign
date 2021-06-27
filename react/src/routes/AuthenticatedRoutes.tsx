import React from "react"
import { Switch, Route } from "react-router-dom"
import styled from "@emotion/styled"

// pages
import CampaignList from "pages/Campaign/CampaignList"

// Layouts
import Sidebar from "components/Sidebar/Sidebar"

const Page = styled.div`
  box-sizing: border-box;
  display: flex;
  padding: 10px;
`

const SidebarContainer = styled.div`
  flex: 0 0 300x;
`

const Content = styled.div`
  flex: 1;
  margin-left: 10px;
`

const AuthenticatedRoutes = () => (
  <Page>
    <SidebarContainer>
      <Sidebar />
    </SidebarContainer>
    <Content>
      <Switch>
        <Route exact component={CampaignList} path='/' />
      </Switch>
    </Content>
  </Page>
)

export default AuthenticatedRoutes
