// @ts-nocheck
import camelize from "camelize";

import { fetchApi } from "utils/fetcher";

const BASE_URL = "http://localhost:8000/";

export const loginApi = (
  data: any,
  onSuccess: (data?: Record<string, any>) => void,
  onError: (data?: Record<string, any>) => void
) => {
  return fetchApi("POST", `${BASE_URL}token/`, data)
    .then((data) => onSuccess(camelize(data)))
    .catch((err) => onError(err));
};
