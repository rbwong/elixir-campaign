// @ts-nocheck
import React from "react"
import { useQuery } from "@apollo/client"

// Components
import DropDown from "components/Fields/Dropdown"
import ListItem from "components/List/ListItem"
import ListColumn from "components/List/ListColumn"

// Data
import { GET_TEAMS } from "data/teams/queries"
import { TeamType } from "data/teams/types"

interface Prop {
  filter: string
  onFilter: () => {}
}

function CampaignListHeader({ filter, onFilter }: Prop) {
  const { isLoading, data } = useQuery(GET_TEAMS)

  if (isLoading || !data) {
    return null
  }

  const teamsDict = Object.assign(
    ...data.allTeams.map((team: TeamType) => ({ [team.code]: team }))
  )

  return (
    <ListItem>
      <ListColumn flexSize='0 0 180px'>Name</ListColumn>
      <ListColumn flexSize='0 0 200px'>
        <DropDown
          options={Object.keys(teamsDict)}
          defaultValue={filter}
          onChange={(value) => onFilter(value)}
        >
          Select team: {filter}
        </DropDown>
      </ListColumn>
      <ListColumn flexSize='1'>Tags</ListColumn>
      <ListColumn flexSize='0 0 130px'>Start date</ListColumn>
      <ListColumn flexSize='0 0 130px'>End date</ListColumn>
      <ListColumn flexSize='1'>Description</ListColumn>
    </ListItem>
  )
}

export default CampaignListHeader
