import { gql } from "@apollo/client"

export const GET_TEAMS = gql`
  query {
    allTeams {
      id
      name
      code
      colorSet
    }
  }
`
