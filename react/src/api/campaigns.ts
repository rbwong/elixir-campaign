// @ts-nocheck
import useSWR from "swr";
import snakeCaseKeys from "snakecase-keys";

import { authenticatedFetcher } from "utils/fetcher";

const BASE_URL = "http://localhost:8000/";

export function useCampaigns(teamFilter: string) {
  const filters = {
    team: teamFilter,
  };
  const url = new URL(`${BASE_URL}campaigns/`);
  url.search = new URLSearchParams(snakeCaseKeys(filters)).toString();

  const { data, error } = useSWR(url.href, authenticatedFetcher);

  return {
    data: data,
    isLoading: !error && !data,
    isError: error,
  };
}
