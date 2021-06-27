// @ts-nocheck
import camelize from "camelize"
import snakeCaseKeys from "snakecase-keys"
import Cookies from "js-cookie"

export const fetcher = (...args) => fetch(...args).then((res) => res.json())

export const authenticatedFetcher = <Data = any>(
  url: string,
  options?: Record<string, any>,
  params?: any,
  json = true,
  credentials: "omit" | "include" = "omit"
): Promise<Data> => {
  const opts = {
    method: "GET",
    headers: {
      Accept: "application/json",
      "Content-Type": "application/json",
      Authorization: `Bearer ${Cookies.get("bToken")}`,
    },
    credentials,
    ...options,
    body: params ? JSON.stringify(snakeCaseKeys(params)) : null,
  }

  return fetch(url, opts)
    .then((r) => (json ? r.json() : r))
    .then((data) => {
      if (data.code) {
        Cookies.remove("bToken")
        window.location.href = "/login"
      }
      return camelize(data)
    })
}

const handleErrors = async (err: any) =>
  // if (err.status === 401) store.dispatch(logoutUserIfNeeded());
  Promise.reject(err)
export async function fetchApi(
  method: string,
  url: string,
  params?: any,
  json = true
) {
  try {
    const res = await fetch(url, {
      method,
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json",
      },
      credentials: "omit",
      body: params ? JSON.stringify(snakeCaseKeys(params)) : null,
    })
    if (!res.ok) throw res
    else return json ? await res.json() : await res
  } catch (err) {
    return handleErrors(err)
  }
}
