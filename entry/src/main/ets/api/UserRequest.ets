import axios, { AxiosError, AxiosResponse } from '@ohos/axios'

import { baseUrl ,testtoken} from '../common/common'


export class UserRequest{
  async getUserInfo(id: number): Promise<any> {
    let user:any = {}
    await axios.get(
      `${baseUrl}/user/info/${id}`,
      {
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'token': testtoken
        }
      }
    ).then((res: AxiosResponse) => {
      if (res.status === 200) {
        user = res.data.data
        console.log('getUserInfo', JSON.stringify(user))
      }else {
        console.error('getUserInfo', res.data.errorMessage)
      }
    }).catch((err: AxiosError) => {
      console.log('getUserInfo', err.message)
    })
    return user
  }

}
