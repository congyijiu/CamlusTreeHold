

export interface IMessageDetail{
  id: number,
  sendUserId: number,
  acceptUserId: number,
  type: string,
  content: string,
  readed: null,
  delete: null,
  sendTime: string
}


export default class MessageDetail implements IMessageDetail{
sendTime: string;
readed: null;
content: string;
type: string;
acceptUserId: number;
sendUserId: number;
id: number;
delete: null;

  constructor(pros: MessageDetail) {
    this.id = pros.id;
    this.sendUserId = pros.sendUserId;
    this.acceptUserId = pros.acceptUserId;
    this.type = pros.type;
    this.content = pros.content;
    this.readed = pros.readed;
    this.delete = pros.delete;
    this.sendTime = pros.sendTime;
  }

}