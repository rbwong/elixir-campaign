import { TeamType } from "data/teams/types"

export interface TagType {
  name: string
}

export interface CampaignType {
  name: string
  startDate: string
  endDate: string
  tags: TagType[]
  description: string
  team: TeamType
}
