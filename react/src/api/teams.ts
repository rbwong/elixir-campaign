// @ts-nocheck
import useSWR from "swr";

import { authenticatedFetcher } from "utils/fetcher";

const BASE_URL = "http://localhost:8000/";

export function useTeams() {
  const url = new URL(`${BASE_URL}teams/`);

  const { data, error } = useSWR(url.href, authenticatedFetcher);

  return {
    data: data,
    isLoading: !error && !data,
    isError: error,
  };
}
