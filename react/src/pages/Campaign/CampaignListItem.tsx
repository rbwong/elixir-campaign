import React from "react"

// Components
import ListItem from "components/List/ListItem"
import ListColumn from "components/List/ListColumn"
import Hashtag from "components/Tags/Hashtag"

// Data
import { CampaignType, TagType } from "data/campaigns/types"

interface Prop {
  campaign: CampaignType
}

function CampaignListItem({ campaign }: Prop) {
  const startDate = new Date(campaign.startDate)
  const endDate = new Date(campaign.endDate)

  return (
    <ListItem>
      <ListColumn flexSize='0 0 180px'>{campaign.name}</ListColumn>
      <ListColumn flexSize='0 0 200px'>{campaign.team.name}</ListColumn>
      <ListColumn flexSize='1'>
        {campaign.tags.map((tag: TagType) => (
          <Hashtag name={tag.name} key={`hashtag-${tag.name}`} />
        ))}
      </ListColumn>
      <ListColumn flexSize='0 0 130px'>{startDate.toLocaleString()}</ListColumn>
      <ListColumn flexSize='0 0 130px'>{endDate.toLocaleString()}</ListColumn>
      <ListColumn flexSize='1'>{campaign.descsription}</ListColumn>
    </ListItem>
  )
}

export default CampaignListItem
