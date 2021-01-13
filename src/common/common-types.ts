import { Ref } from './document-types';
import { FormListFilter, FormListOrder } from './user.settings';

export interface MenuItem { type: string; icon: string; label: string; items?: MenuItem[]; routerLink?: string[]; }

export interface DocListRequestBody {
  id: string; type: string; command: string; count: number; offset: number;
  filter: FormListFilter[];
  order: FormListOrder[];
  listOptions?: DocListOptions;
}
export interface DocListOptions {
  withHierarchy: boolean;
  hierarchyDirectionUp: boolean;
}

export interface Continuation { first: { id: Ref, type: string } | null; last: { id: Ref, type: string } | null; }
export interface DocListResponse { data: any[]; continuation: Continuation; }

export interface MenuItem { type: string; description: string; icon: string; menu: string; }

export interface RefValue {
  id: string;
  type: string;
  code: string;
  value: string | number | boolean;
}

export interface PatchValue { [x: string]: (boolean | number | string | RefValue | {}); }

export interface IJettiTask {
  id: number;
  description: string;
  user: string;
  progress: number;
  status: boolean;
  error: string;
  url: string;
  name: string;
}

export interface IEvent {
  id: string;
  startedAt: Date;
  endedAt: Date;
  description: string;
  user: string;
  error: string;
  progress: number;
  url: string;
}

export interface IJob {
  id: string;
  progress: number;
  opts: { [x: string]: any };
  delay: number;
  timestamp: number;
  returnvalue: any;
  attemptsMade: number;
  failedReason: string;
  finishedOn: number;
  processedOn: number;
  data: { [x: string]: any };
  message: string;
}

interface JobInformation {
  key: string;
  name: string;
  id?: string;
  endDate?: number;
  tz?: string;
  cron: string;
  every: number;
  next: number;
}

export interface IJobs {
  Active: IJob[];
  Completed: IJob[];
  Delayed: IJob[];
  Failed: IJob[];
  Waiting: IJob[];
  RepeatableJobs?: JobInformation[];
}

export interface IJWTPayload {
  email: string;
  description: string;
  isAdmin: boolean;
  roles: any[];
  env: { [x: string]: string };
}

export interface IAccount extends IJWTPayload {
  created: string;
  password: string;
  status: string;
}

export interface ILoginResponse {
  account: IAccount | undefined;
  token: string;
  photo?: any;
}

export interface ITree {
  id: string;
  description: string;
  parent: string;
}

export interface ISuggest {
  id: string;
  type: string;
  code: string;
  value: string;
  deleted: boolean;
  description?: string;
}

export type PrimitiveTypes =
  'string' |
  'number' |
  'date' |
  'datetime' |
  'time' |
  'boolean' |
  'table' |
  'json' |
  'javascript' |
  'textarea' |
  'enum' |
  'link' |
  'URL';

export interface IAttachmentsSettings {
  AttachmentType: string;
  AttachmentTypeDescription: string;
  StorageType: 'URL' | 'FILE';
  MaxFileSize: number;
  FileFilter: string;
  Tags: string[];
}

