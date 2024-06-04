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

import DynamicDetailCommentPageVo from './DynamicDetailCommentPageVo';

export interface IDynamicDetailComment {
  commentId: number;
  dynamicId: number;
  userId: number;
  topCommentId: number | null;
  toCommentId: number | null;
  content: string;
  commentDate: string;
  replyCount: number;
  likeCount: number;
  replyUserId: number | null;
  replyUsername: string | null;
  isDeleted: number;
  username: string;
  avatarUrl: string;
  isLike: number | null;
  dynamicDetailCommentPageVo: DynamicDetailCommentPageVo;
}


export default class DynamicDetailComment implements IDynamicDetailComment {

  commentId: number;
  dynamicId: number;
  userId: number;
  topCommentId: number | null;
  toCommentId: number | null;
  content: string;
  commentDate: string;
  replyCount: number;
  likeCount: number;
  replyUserId: number | null;
  replyUsername: string | null;
  isDeleted: number;
  username: string;
  avatarUrl: string;
  isLike: number | null;
  dynamicDetailCommentPageVo: DynamicDetailCommentPageVo;
  constructor(props: DynamicDetailComment) {
    this.commentId = props.commentId;
    this.dynamicId = props.dynamicId;
    this.userId = props.userId;
    this.topCommentId = props.topCommentId;
    this.toCommentId = props.toCommentId;
    this.content = props.content;
    this.commentDate = props.commentDate;
    this.replyCount = props.replyCount;
    this.likeCount = props.likeCount;
    this.replyUserId = props.replyUserId;
    this.replyUsername = props.replyUsername;
    this.isDeleted = props.isDeleted;
    this.username = props.username;
    this.avatarUrl = props.avatarUrl;
    this.isLike = props.isLike;
    this.dynamicDetailCommentPageVo = props.dynamicDetailCommentPageVo;
  };

}