import axios, { AxiosError, AxiosResponse } from '@ohos/axios'

import { baseUrl } from '../common/common'

export const getUserInfo = async (id: number): Promise<any> => {
  let user:any = {}
  await axios.get(
    `${baseUrl}/user/info/${id}`,
    {
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'token': 'eyJhbGciOiJIUzUxMiIsInppcCI6IkdaSVAifQ.H4sIAAAAAAAA_yXLWwrEIAyF4b3kuYKXqGN3k2KGcaAgxMIMpXtvpG_n4_Cf8B0NVnBMGS2SeYWaDVqupiCXyRTDOwWfNlig0YDVZZfRpYhhATk2reUvg_f5iyg_3HZS0VFV1Ltu_vWnjNaXWTb9_HUDswUnwoAAAAA.A12sa3Xv2jAZfl3HgTUv_nybP-Aojb2pgHb5rps57sshlCGb8F-llkGx_bBm1eSgV3hDTDbBqrbI7tBzS1ynbw'
      }
    }

  ).then((res: AxiosResponse) => {
    user = res.data
    console.log('getUserInfo1', JSON.stringify(user))
  }).catch((err: AxiosError) => {
    console.log('getUserInfo', err.message)
  })
  return user
}