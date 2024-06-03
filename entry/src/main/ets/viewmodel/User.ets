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

export interface IUser {

  id: string;

  username: string

  age: number

  email: string

  avatarUrl: string

  phoneNumber: string




}

/**
 * Water flow item.
 */
export default class User implements IUser {
  id: string;
  username: string
  age: number
  email: string
  avatarUrl: string
  phoneNumber: string
  constructor(props: User) {
    this.id = props.id;
    this.username = props.username;
    this.age = props.age;
    this.email = props.email;
    this.avatarUrl = props.avatarUrl;
    this.phoneNumber = props.phoneNumber;
  }
}