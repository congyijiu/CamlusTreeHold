import axios, { AxiosError, AxiosResponse } from '@ohos/axios'
import { baseUrl, gpttoken, gptUrl, testtoken } from '../common/common'
import router from '@ohos.router'
import { PreferencesUtil } from '../common/PreferencesUtil'
import promptAction from '@ohos.promptAction';
import ArrayList from '@ohos.util.ArrayList'
import GptMessage from '../viewmodel/GptMessage'


export class GptRequest {
  //聊天
  static async getGptMessage(message: GptMessage): Promise<any> {
    let theres:any = ''
    let messagejson:any = [
      { "type": "text", "text": message.message }
    ]
    if (message.imageBase64) {
      messagejson = [
        { "type": "text", "text": message.message },
        { "type": "image_url", "image_url": { "url": `${message.imageBase64}`} }
      ]
    }
    await axios.post(
      `${gptUrl}/v1/chat/completions`,
      {
        "model": "gpt-4o",
        "messages": [
          {
            "role": "system",
            "content": "You are a helpful assistant."
          },
          {
            "role": "user", "content": messagejson
          }
        ]
      },
      {
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'user-agent': 'congyijiuscript',
          'Authorization': `Bearer ${gpttoken}`
        }
      }
    ).then((res: AxiosResponse) => {
      if (res.status === 200) {
        theres = res.data.choices[0].message.content
        console.log('getGptMessage res', JSON.stringify(theres))
      } else {
        console.error('getGptMessage res', res.data.errorMessage)
      }
    }).catch((err: AxiosError) => {
      console.log('getGptMessage res', err.message)
    })
    return theres
  }
}