import axios, { AxiosError, AxiosResponse } from '@ohos/axios'

import { baseUrl,testtoken } from '../common/common'
import  DynamicItem  from '../viewmodel/DynamicItem'
import  DynamicDetail  from '../viewmodel/DynamicDetail'



export class DynamicRequest {
  static async getDynamicItem(dynamicdto: any): Promise<DynamicItem[]> {
    let dynamicItem:DynamicItem[] = []
    await axios.post(
      `${baseUrl}/dynamic/page`,
      {
        pageIndex: dynamicdto.pageIndex,
        pageSize: dynamicdto.pageSize,
        type: dynamicdto.type,
        keyWord: dynamicdto.keyWord,
        userId: dynamicdto.userId,
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
        dynamicItem = res.data.data.records
        console.log('getDynamicItem', JSON.stringify(dynamicItem))
      }else {
        console.log('getDynamicItem', res.data.errorMessage)
      }
    }).catch((err: AxiosError) => {
      console.log('getDynamicItem', err.message)
    })
    return dynamicItem
  }

  static async getDynamicDetail(dynamicId: string): Promise<DynamicDetail> {
    let dynamicDetail:DynamicDetail
    await axios.post(
      `${baseUrl}/dynamic/detail/${dynamicId}`,
      {
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
        dynamicDetail = res.data.data
        console.log('getDynamicItem', JSON.stringify(dynamicDetail))
      }else {
        console.log('getDynamicItem', res.data.errorMessage)
      }
    }).catch((err: AxiosError) => {
      console.log('getDynamicItem', err.message)
    })

    return dynamicDetail
  }
}
