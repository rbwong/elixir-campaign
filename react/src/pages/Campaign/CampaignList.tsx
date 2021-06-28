// @ts-nocheck
import React, { useState } from "react"
import { useQuery } from "@apollo/client"
import { css } from "@emotion/react"
import styled from "@emotion/styled"
import PacmanLoader from "react-spinners/PacmanLoader"

// Data
import { GET_CAMPAIGNS } from "data/campaigns/queries"
import { CampaignType } from "data/campaigns/types"
import { baseColors } from "constants/colors"

import CampaignListItem from "pages/Campaign/CampaignListItem"
import CampaignListHeader from "pages/Campaign/CampaignListHeader"

const LoadingContainer = styled.div`
  align-items: center;
  display: flex;
  height: 100vh;
  width: 100%;
`

const LoadingIcon = css`
  border-color: red;
  display: block;
  margin: 0 auto;
  padding-right: 100px;
`

const Row = styled.div`
  margin-bottom: 10px;
`

function CampaignList() {
  const [teamFilter, setTeamFilter] = useState("all")
  const { isLoading, data } = useQuery(GET_CAMPAIGNS, {
    variables: { team: teamFilter },
  })

  if (isLoading || !data) {
    return (
      <LoadingContainer>
        <PacmanLoader
          css={LoadingIcon}
          size={30}
          color={baseColors.gold}
          loading
        />
      </LoadingContainer>
    )
  }

  return (
    <div>
      <Row>
        <CampaignListHeader filter={teamFilter} onFilter={setTeamFilter} />
      </Row>
      {data.allCampaigns.map((campaign: CampaignType) => (
        <Row key={`row-${campaign.id}`}>
          <CampaignListItem campaign={campaign} />
        </Row>
      ))}
    </div>
  )
}

export default CampaignList
