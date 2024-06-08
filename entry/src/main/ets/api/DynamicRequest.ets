import axios, { AxiosError, AxiosResponse } from '@ohos/axios'

import { baseUrl,testtoken } from '../common/common'
import  DynamicItem  from '../viewmodel/DynamicItem'
import  DynamicDetail  from '../viewmodel/DynamicDetail'
import  DynamicDetailCommentPageVo  from '../viewmodel/DynamicDetailCommentPageVo'
import DynamicType from '../viewmodel/DynamicType'
import { PreferencesUtil } from '../common/PreferencesUtil'


export class DynamicRequest {

  //获取动态列表
  static async getDynamicItem(dynamicdto: any,token1:string): Promise<DynamicItem[]> {
    let dynamicItem:DynamicItem[] = []
    let token:string = ''

    if(token1 == ''){

      token = PreferencesUtil.token
      if (token == '') {
        await PreferencesUtil.getUserToken().then((value) => {
          token = value
          console.log('getUserToken', JSON.stringify(token))
        })
      }
      console.log('getDynamicItem token', token)
    }else {
      token = token1
    }

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
          'token': token
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


  //获取动态详情
  static async getDynamicDetail(dynamicId: string): Promise<DynamicDetail> {
    let dynamicDetail:DynamicDetail
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
      `${baseUrl}/dynamic/detail/${dynamicId}`,
      {
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


  //获取动态详情评论
  static async getDynamicDetailComments(dynamicCommentsDto: any): Promise<DynamicDetailCommentPageVo> {
    let token:string = ''

    token = PreferencesUtil.token
    if (token == '') {
      await PreferencesUtil.getUserToken().then((value) => {
        token = value
        console.log('getUserToken', JSON.stringify(token))
      })
    }
    console.log('getDynamicItem token', token)

    let dynamicCommentPage:DynamicDetailCommentPageVo
    await axios.post(
      `${baseUrl}/dynamic-comments/page`,
      {
        "pageIndex": dynamicCommentsDto.pageIndex,
        "pageSize": dynamicCommentsDto.pageSize,
        "dynamicId": dynamicCommentsDto.dynamicId,
        "topCommentId": dynamicCommentsDto.topCommentId,
        "type": dynamicCommentsDto.type
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
        dynamicCommentPage = res.data.data
        // console.log('getDynamicDetailComments', JSON.stringify(dynamicCommentPage))
      }else {
        console.log('getDynamicDetailComments', res.data.errorMessage)
      }
    }).catch((err: AxiosError) => {
      console.log('getDynamicDetailComments', err.message)
    })

    return dynamicCommentPage
  }


  //根据ID查询用户收藏的动态
  static async getUserFavoriteDynamicItemById(dynamicDto: any): Promise<DynamicItem[]> {
    let dynamicItem:DynamicItem[] = []
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
      `${baseUrl}/dynamic/favorite/page`,
      {
        pageIndex: dynamicDto.pageIndex,
        pageSize: dynamicDto.pageSize,
        userId: dynamicDto.userId,
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
        dynamicItem = res.data.data.records
        console.log('getUserFavoriteDynamicItemById---', JSON.stringify(res.data.data.records))
      }else {
        console.log('getUserFavoriteDynamicItemById---', res.data.errorMessage)
      }
    }).catch((err: AxiosError) => {
      console.log('getUserFavoriteDynamicItemById---', err.message)
    })
    return dynamicItem
  }



  static async addDynamicComment(dynamicCommentsAddDto: any): Promise<any> {
    let dynamicItem:DynamicItem[] = []
    let token:string = ''

    token = PreferencesUtil.token
    if (token == '') {
      await PreferencesUtil.getUserToken().then((value) => {
        token = value
        console.log('getUserToken', JSON.stringify(token))
      })
    }
    console.log('getDynamicItem token', token)

    let comment:any
    await axios.post(
      `${baseUrl}/dynamic-comments/add`,
      {
        "dynamicId": dynamicCommentsAddDto.dynamicId,
        "content": dynamicCommentsAddDto.content,
        "topCommentId": dynamicCommentsAddDto.topCommentId,
        "toCommentId": dynamicCommentsAddDto.toCommentId
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
        comment = res.data.data
        console.log('addDynamicComment', JSON.stringify(comment))
      }else {
        console.log('addDynamicComment', res.data.errorMessage)
      }
    }).catch((err: AxiosError) => {
      console.log('addDynamicComment', err.message)
    })

    return comment
  }

  static async getAllDynamicType(): Promise<DynamicType[]> {
    let dynamicItem:DynamicItem[] = []
    let token:string = ''

    token = PreferencesUtil.token
    if (token == '') {
      await PreferencesUtil.getUserToken().then((value) => {
        token = value
        console.log('getUserToken', JSON.stringify(token))
      })
    }
    console.log('getDynamicItem token', token)


    let dynamicTypeList:DynamicType[] = []
    await axios.post(
      `${baseUrl}/dynamicType/list`,
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
        dynamicTypeList = res.data.data
        console.log('getAllDynamicType', JSON.stringify(dynamicTypeList))
      }else {
        console.log('getAllDynamicType', res.data.errorMessage)
      }
    }).catch((err: AxiosError) => {
      console.log('getAllDynamicType', err.message)
    })

    return dynamicTypeList
  }

  static async getDynamicTop10(): Promise<DynamicItem[]> {
    let dynamicItem:DynamicItem[] = []
    let token:string = ''

    token = PreferencesUtil.token
    if (token == '') {
      await PreferencesUtil.getUserToken().then((value) => {
        token = value
        console.log('getUserToken', JSON.stringify(token))
      })
    }
    console.log('getDynamicItem token', token)

    await axios.get(
      `${baseUrl}/dynamic/top10`,
      {
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'token': token
        }
      }
    ).then((res: AxiosResponse) => {
      if (res.status === 200) {
        dynamicItem = res.data.data
        console.log('getAllDynamicType', JSON.stringify(dynamicItem))
      }else {
        console.log('getAllDynamicType', res.data.errorMessage)
      }
    }).catch((err: AxiosError) => {
      console.log('getAllDynamicType', err.message)
    })

    return dynamicItem
  }

  static async userDynamicActions(dynamicActionDto:any): Promise<any> {
    let theres:any
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
      `${baseUrl}/user-dynamic-actions/Actions`,
      {
        "dynamicId": dynamicActionDto.dynamicId,
        "islike": dynamicActionDto.islike,
        "isfavorite": dynamicActionDto.isfavorite
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
        theres = res.data.data
        console.log('getAllDynamicType', JSON.stringify(theres))
      }else {
        console.log('getAllDynamicType', res.data.errorMessage)
      }
    }).catch((err: AxiosError) => {
      console.log('getAllDynamicType', err.message)
    })

    return theres
  }

  static async dynamicCommentsLike(dynamicCommentsActionDto:any): Promise<any> {
    let theres:any
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
      `${baseUrl}/dynamic-comments/like`,
      {
        "commentId": dynamicCommentsActionDto.commentId,
        "isLike": dynamicCommentsActionDto.isLike
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
        theres = res.data.data
        console.log('getAllDynamicType', JSON.stringify(theres))
      }else {
        console.log('getAllDynamicType', res.data.errorMessage)
      }
    }).catch((err: AxiosError) => {
      console.log('getAllDynamicType', err.message)
    })

    return theres
  }
//发布动态
  static async dynamicPublish(dynamicPublishData:any): Promise<any> {
    let theres:any
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
      `${baseUrl}/dynamic/publish`,
      {
        "title": dynamicPublishData.title,
        "content": dynamicPublishData.content,
        "imageUrls" : dynamicPublishData.imageUrls,
        "typeId": dynamicPublishData.typeId
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
          theres = res.data.errorMessage
        console.log('dynamicPublishData', JSON.stringify(theres))
      }else {
        console.log('dynamicPublishData', res.data.errorMessage)
      }
    }).catch((err: AxiosError) => {
      console.log('getAllDynamicType', err.message)
    })

    return theres
  }



}
