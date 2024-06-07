import axios, { AxiosError, AxiosResponse } from '@ohos/axios'
import LoginItem from '../viewmodel/LoginItem'
import { baseUrl ,testtoken} from '../common/common'
import router from '@ohos.router'
import { PreferencesUtil } from '../common/PreferencesUtil'
import promptAction from '@ohos.promptAction';
import EditUser from '../viewmodel/editUser'



export class UserRequest{


  // static token:string = PreferencesUtil.getUserToken()


  //根据Id获取用户信息
  static async getUserInfo(id: number): Promise<any> {
    let token:string = ''

    token = PreferencesUtil.token
    if (token == '') {
      await PreferencesUtil.getUserToken().then((value) => {
        token = value
        console.log('getUserToken', JSON.stringify(token))
      })
    }
    console.log('getDynamicItem token', token)
    let user:any = {}
    await axios.get(
      `${baseUrl}/user/info/${id}`,
      {
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'token': token
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
    console.log('postUserInfo', username1)
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
          // 'token': testtoken
        }
      }
    ).then(async (res: AxiosResponse) => {
      if (res.status === 200) {
        user = res.data.data
        if (user != null) {
          // console.log("林甲锋" + res.data.data.token)

          await PreferencesUtil.putPreferenceValue('MyPreferences', 'token' , res.data.data.token)

          PreferencesUtil.token = res.data.data.token
          console.log('token in postUserInfo', PreferencesUtil.token)
          PreferencesUtil.userId = res.data.data.id
          console.log('userId in postUserInfo', PreferencesUtil.userId)
          router.pushUrl(
            { url: 'pages/Index',
              params: {
                token: res.data.data.token
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
          // 'token': testtoken
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

    let token1:string = ''

    token = PreferencesUtil.token
    if (token == '') {
      await PreferencesUtil.getUserToken().then((value) => {
        token = value
        console.log('getUserToken', JSON.stringify(token))
      })
    }
    console.log('getDynamicItem token', token)


    console.log('getUserToken', token)
    let user:any = {}
    await axios.get(
      `${baseUrl}/user/info`,
      {
        headers: {
          'token': token
        }
      }
    ).then((res: AxiosResponse) => {
      if (res.status === 200) {
        user = res.data.data
        console.log('getUserInfoByToken', JSON.stringify(res))
      }else {
        console.error('getUserInfoByToken', res.data.errorMessage)
      }
    }).catch((err: AxiosError) => {
      console.log('getUserInfoByToken', err.message)
    })

    console.log('getUserInfoByToken user', JSON.stringify(user))
    return user
  }



  //修改用户信息
  static async editUserInfo(user1: EditUser): Promise<any> {
    let user:any = {}
    let token:string = ''

    token = PreferencesUtil.token
    if (token == '') {
      await PreferencesUtil.getUserToken().then((value) => {
        token = value
        console.log('getUserToken', JSON.stringify(token))
      })
    }
    console.log('getDynamicItem token', token)


    await axios.put(
      `${baseUrl}/user/info`,
      {
        // id : user1.id,
        username : user1.username,
        signature:user1.signature,
        gender:user1.gender,
        hobbies : user1.hobbies,
        phoneNumber : user1.phoneNumber,
        email : user1.email,
      },

      {
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'token': token
        }
      }
    ).then((res: AxiosResponse) => {
      if (res.status === 200) {
        console.log('editUserInfo',JSON.stringify(user1))
        // return JSON.stringify(user1)
      }else {
        console.error('editUserInfo', res.data.errorMessage)
      }
    }).catch((err: AxiosError) => {
      console.log('editUserInfo', err.message)
    })
    return user
  }

  //关注用户/取消关注
  static async userFollow(userId: Number|string): Promise<any> {
    let theRes:any = {}
    let token:string = ''
    token = PreferencesUtil.token
    if (token == '') {
      await PreferencesUtil.getUserToken().then((value) => {
        token = value
        console.log('getUserToken', JSON.stringify(token))
      })
    }
    console.log('getDynamicItem token', token)
    await axios.post(
      `${baseUrl}/user/follow/${userId}`,
      {},
      {
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'token': token
        }
      }
    ).then((res: AxiosResponse) => {
      if (res.status === 200) {
        console.log('editUserInfo',JSON.stringify(res.data))
        // return JSON.stringify(user1)
      }else {
        console.error('editUserInfo', res.data.errorMessage)
      }
    }).catch((err: AxiosError) => {
      console.log('editUserInfo', err.message)
    })
    return theRes
  }

}
