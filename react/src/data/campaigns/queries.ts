import { gql } from "@apollo/client"

export const GET_CAMPAIGNS = gql`
  query ($team: String!) {
    allCampaigns(team: $team) {
      id
      name
      descsription
      startDate
      endDate
      budget
      tags {
        name
      }
      team {
        name
      }
    }
  }
`
