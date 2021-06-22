// @ts-nocheck
import React, { useState } from "react";
import { css } from "@emotion/core";
import styled from "@emotion/styled";
import PacmanLoader from "react-spinners/PacmanLoader";

import { CampaignType } from "types/campaignTypes";
import { useCampaigns } from "api/campaigns";
import { baseColors } from "constants/colors";

import CampaignListItem from "pages/Campaign/CampaignListItem";
import CampaignListHeader from "pages/Campaign/CampaignListHeader";

const LoadingContainer = styled.div`
  align-items: center;
  display: flex;
  height: 100vh;
  width: 100%;
`;

const LoadingIcon = css`
  border-color: red;
  display: block;
  margin: 0 auto;
  padding-right: 100px;
`;

const Row = styled.div`
  margin-bottom: 10px;
`;

function CampaignList() {
  const [teamFilter, setTeamFilter] = useState("all");
  const { data, isLoading } = useCampaigns(teamFilter);

  if (isLoading) {
    return (
      <LoadingContainer>
        <PacmanLoader
          css={LoadingIcon}
          size={30}
          color={baseColors.gold}
          loading
        />
      </LoadingContainer>
    );
  }

  return (
    <div>
      <Row>
        <CampaignListHeader filter={teamFilter} onFilter={setTeamFilter} />
      </Row>
      {data &&
        data.map((campaign: CampaignType) => (
          <Row key={`row-${campaign.id}`}>
            <CampaignListItem campaign={campaign} />
          </Row>
        ))}
    </div>
  );
}

export default CampaignList;
