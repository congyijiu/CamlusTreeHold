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

import User from './User';

export interface IDynamicDetailComment {

  id: string;

  dynamicId: string;

  content: string;

  createTime: string;

  updateTime: string;

  likeCount: number;

  replyCount: number;

  user: User;


}

export default class DynamicDetailComment implements IDynamicDetailComment {

  id: string;

  dynamicId: string;

  content: string;

  createTime: string;

  updateTime: string;

  likeCount: number;

  replyCount: number;

  user: User;
  constructor(props: DynamicDetailComment) {
    this.id = props.id;
    this.dynamicId = props.dynamicId;
    this.content = props.content;
    this.createTime = props.createTime;
    this.updateTime = props.updateTime;
    this.likeCount = props.likeCount;
    this.replyCount = props.replyCount;
    this.user = props.user;
  };

}