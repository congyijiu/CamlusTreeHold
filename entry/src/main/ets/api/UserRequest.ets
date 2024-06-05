import axios, { AxiosError, AxiosResponse } from '@ohos/axios'
import LoginItem from '../viewmodel/LoginItem'
import { baseUrl ,testtoken} from '../common/common'
import router from '@ohos.router'
import PreferencesUtil from '../common/PreferencesUtil'
import promptAction from '@ohos.promptAction';


export class UserRequest{


  //根据Id获取用户信息
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
  static async postUserInfo(username1:string , password1:string): Promise<any> {
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
        if (user != null) {
          // console.log("林甲锋" + res.data.data.token)

          PreferencesUtil.putPreferenceValue('MyPreferences', 'token' , JSON.stringify(res.data.data.token))
          router.pushUrl(
            { url: 'pages/Index',
              params: {

              }}
          );
        }else {
          promptAction.showToast({
            message: '用户名或密码错误',
            duration: 2000,
            bottom: 50
          });
        }

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


  // 根据token获取用户信息
  static async getUserInfoByToken(token: string): Promise<any> {
    let user:any = {}
    await axios.get(
      `${baseUrl}/user/info`,
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
        console.log('getUserInfoByToken', JSON.stringify(user))
      }else {
        console.error('getUserInfoByToken', res.data.errorMessage)
      }
    }).catch((err: AxiosError) => {
      console.log('getUserInfoByToken', err.message)
    })

    console.log('getUserInfoByToken user', JSON.stringify(user))
    return user
  }



}
