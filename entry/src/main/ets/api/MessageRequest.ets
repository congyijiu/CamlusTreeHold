import axios, { AxiosError, AxiosResponse } from '@ohos/axios'
import { baseUrl ,testtoken} from '../common/common'
import router from '@ohos.router'
import PreferencesUtil from '../common/PreferencesUtil'
import promptAction from '@ohos.promptAction';
import ArrayList from '@ohos.util.ArrayList'


export class MessageRequest{
  //获取好友消息列表
  static async getMessageList(MessageListData: any): Promise<any> {
    let userList = []
    await axios.get(
      `${baseUrl}/message/friendMsgList/${MessageListData.index}/${MessageListData.size}`,
      {
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'token': testtoken
        }
      }
    ).then((res: AxiosResponse) => {
      if (res.status === 200) {
        userList = res.data.records
        console.log('getUserInfo', JSON.stringify(userList))
      }else {
        console.error('getUserInfo', res.data.errorMessage)
      }
    }).catch((err: AxiosError) => {
      console.log('getUserInfo', err.message)
    })
    return userList
  }

}