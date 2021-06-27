// @ts-nocheck
/* eslint-disable */
import camelize from "camelize"

import { fetchApi } from "utils/fetcher"

const BASE_URL = "http://localhost:4000/api/"

export const loginApi = (
  data: any,
  onSuccess: (data?: Record<string, any>) => void,
  onError: (data?: Record<string, any>) => void
) =>
  fetchApi("POST", `${BASE_URL}sign_in/`, data)
    .then((data) => onSuccess(camelize(data)))
    .catch((err) => onError(err))
