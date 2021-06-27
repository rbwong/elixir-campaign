import { gql } from "@apollo/client"

export const GET_CAMPAIGNS = gql`
  query {
    allCampaigns {
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
