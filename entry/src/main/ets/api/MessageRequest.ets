import axios, { AxiosError, AxiosResponse } from '@ohos/axios'
import { baseUrl ,testtoken} from '../common/common'
import router from '@ohos.router'
import { PreferencesUtil } from '../common/PreferencesUtil'
import promptAction from '@ohos.promptAction';
import ArrayList from '@ohos.util.ArrayList'
import MessageDetail from'../viewmodel/MessageDetail'


export class MessageRequest{

  //获取好友消息列表
  static async getMessageList(MessageListData: any): Promise<any> {
    let token: string = ''

    token = PreferencesUtil.token
    if (token=='') {
      await PreferencesUtil.getUserToken().then((value) => {
        token = value
        console.log('getUserToken', JSON.stringify(token))
      })
    }
    let userList:any = []
    await axios.get(
      `${baseUrl}/message/friendMsgList/${MessageListData.index}/${MessageListData.size}`,
      {
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'token': token
        }
      }
    ).then((res: AxiosResponse) => {
      if (res.status === 200) {
        userList = res.data.data.records
        console.log('getMessageList', JSON.stringify(userList))
      }else {
        console.error('getMessageList', res.data.errorMessage)
      }
    }).catch((err: AxiosError) => {
      console.log('getMessageListErr', err.message)
    })
    return userList

  }
  //获取消息详情
  static async getMessageDetail(MessageDetailData: any): Promise<any> {
    let token: string = ''
    token = PreferencesUtil.token
    if (token=='') {
      await PreferencesUtil.getUserToken().then((value) => {
        token = value
        console.log('getUserToken', JSON.stringify(token))
      })
    }
    let messageList:any = []
    await axios.post(
      `${baseUrl}/message/messageDetail`,
      {
        "acceptUserId":MessageDetailData.acceptUserId,
        "index":MessageDetailData.index,
        "size":MessageDetailData.size
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
        messageList = res.data.data.records
        console.log('getMessageList', JSON.stringify(messageList))
      }else {
        console.error('getMessageList', res.data.errorMessage)
      }
    }).catch((err: AxiosError) => {
      console.log('getMessageListErr', err.message)
    })
    return messageList

  }


}