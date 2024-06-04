import axios, { AxiosError, AxiosResponse } from '@ohos/axios'
import LoginItem from '../viewmodel/LoginItem'
import { baseUrl ,testtoken} from '../common/common'


export class UserRequest{
  static async getUserInfo(id: number): Promise<any> {
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


  //登录方法
  static async postUserInfo(username1:string , password1:string): Promise<LoginItem> {
    let user:any = {}
    await axios.post(
      `${baseUrl}/user/login`,
      {
        // pageIndex: dynamicdto.pageIndex,
        username : username1,
        password : password1
      },
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
        console.log('postUserInfo', JSON.stringify(user))
      }else {
        console.error('postUserInfo', res.data.errorMessage)
      }
    }).catch((err: AxiosError) => {
      console.log('postUserInfo', err.message)
    })
    return user
  }


  //注册方法
  static async register(username1:string , password1:string , passwordAgain1:string): Promise<any> {
    let user:any = {}
    await axios.post(
      `${baseUrl}/user/register`,
      {
        // pageIndex: dynamicdto.pageIndex,
        username : username1,
        password : password1,
        passwordAgain1 : passwordAgain1,
      },
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
        console.log('register', JSON.stringify(user))
      }else {
        console.error('register', res.data.errorMessage)
      }
    }).catch((err: AxiosError) => {
      console.log('register', err.message)
    })
    return user
  }




}
