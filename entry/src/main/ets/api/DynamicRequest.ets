import axios, { AxiosError, AxiosResponse } from '@ohos/axios'

import { baseUrl } from '../common/common'
import  DynamicItem  from '../viewmodel/DynamicItem'



export const getDynamicItem = async (id: number): Promise<DynamicItem> => {
  let user:any = ''
  axios.post(
    `${baseUrl}/user/info/${id}`,
    {
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'token': 'eyJhbGciOiJIUzUxMiIsInppcCI6IkdaSVAifQ.H4sIAAAAAAAA_yXLWwrEIAyF4b3kuYKXqGN3k2KGcaAgxMIMpXtvpG_n4_Cf8B0NVnBMGS2SeYWaDVqupiCXyRTDOwWfNlig0YDVZZfRpYhhATk2reUvg_f5iyg_3HZS0VFV1Ltu_vWnjNaXWTb9_HUDswUnwoAAAAA.A12sa3Xv2jAZfl3HgTUv_nybP-Aojb2pgHb5rps57sshlCGb8F-llkGx_bBm1eSgV3hDTDbBqrbI7tBzS1ynbw'
      },
      data: {
        id: id
      }
    }

  ).then((res: AxiosResponse) => {
    user = res.data
    console.log('getUserInfo', JSON.stringify(res.data))
  }).catch((err: AxiosError) => {
    console.log('getUserInfo', err.message)
  })
  return user
}