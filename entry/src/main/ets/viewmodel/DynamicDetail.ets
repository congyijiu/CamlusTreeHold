/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

export interface IDynamicDetail {

  id: string;

  imageUrlList: Array<string>;

  title: string;

  author: string;

  avatar: string;

  content: string;

  postDate: string;

  commentCount: number;

  likeCount: number;

  favoriteCount: number;

  typeId: string;

  isLike: number;

  isFavorite: number;

  isFollow: number;
  userId:string;
}

/**
 * Water flow item.
 */
export default class DynamicDetail implements IDynamicDetail {

  id: string;
  imageUrlList: Array<string>;
  title: string;
  author: string;
  userId:string;
  avatar: string;
  content: string;
  postDate: string;
  commentCount: number;
  likeCount: number;
  favoriteCount: number;
  typeId: string;
  isLike: number;
  isFavorite: number;
  isFollow: number;

  constructor(props: DynamicDetail) {
    this.id = props.id;
    this.imageUrlList = props.imageUrlList;
    this.title = props.title;
    this.author = props.author;
    this.avatar = props.avatar;
    this.content = props.content;
    this.postDate = props.postDate;
    this.commentCount = props.commentCount;
    this.likeCount = props.likeCount;
    this.favoriteCount = props.favoriteCount;
    this.typeId = props.typeId;
    this.isLike = props.isLike;
    this.isFavorite = props.isFavorite;
    this.isFollow = props.isFollow;
    this.userId = props.userId;
  }
}