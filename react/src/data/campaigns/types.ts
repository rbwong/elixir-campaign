import { TeamType } from "data/teams/types"

export interface TagType {
  name: string
}

export interface CampaignType {
  name: string
  startDate: string
  endDate: string
  tags: TagType[]
  descsription: string
  team: TeamType
}
