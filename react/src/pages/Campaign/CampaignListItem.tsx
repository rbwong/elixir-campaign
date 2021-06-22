// @ts-nocheck
import React from "react";

import ListItem from "components/List/ListItem";
import ListColumn from "components/List/ListColumn";
import Hashtag from "components/Tags/Hashtag";

import { CampaignType } from "types/campaignTypes";

interface Prop {
  campaign: CampaignType;
}

function CampaignListItem({ campaign }: Prop) {
  const startDate = new Date(campaign.startDate);
  const endDate = new Date(campaign.endDate);

  return (
    <ListItem>
      <ListColumn flexSize="0 0 180px">{campaign.name}</ListColumn>
      <ListColumn flexSize="0 0 200px">{campaign.team.name}</ListColumn>
      <ListColumn flexSize="1">
        {campaign.hashtags.map((hashtag) => (
          <Hashtag name={hashtag} key={`hashtag-${hashtag}`}></Hashtag>
        ))}
      </ListColumn>
      <ListColumn flexSize="0 0 130px">{startDate.toLocaleString()}</ListColumn>
      <ListColumn flexSize="0 0 130px">{endDate.toLocaleString()}</ListColumn>
      <ListColumn flexSize="1">{campaign.description}</ListColumn>
    </ListItem>
  );
}

export default CampaignListItem;
