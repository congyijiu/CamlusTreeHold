export interface LoginItem1 {

  username: string;

  password: string;

}

export default class LoginItem implements LoginItem1{
  password: string;

  username: string;

  constructor(props: LoginItem) {
    this.username = props.username;
    this.password = props.password
  }


}