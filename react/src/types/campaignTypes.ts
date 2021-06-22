import { TeamType } from "types/teamTypes";

export interface CampaignType {
  name: string;
  startDate: string;
  endDate: string;
  hashtags: string[];
  description: string;
  team: TeamType;
}
