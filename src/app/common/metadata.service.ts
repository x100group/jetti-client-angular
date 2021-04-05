import { Injectable } from '@angular/core';
import { MessageService, TreeNode } from 'primeng/api';
import { ApiService } from '../services/api.service';
import { BehaviorSubject, Subject } from 'rxjs';

export type MetaKind = 'Catalogs' | 'Documents' | 'Forms' | 'RegistersInfo' | 'RegistersAccumulation';

export class MetaTreeNode {
  key: string;
  kind: MetaKind;
  parentKey?: string;
  id?: string;
  type?: string;
  label?: string;
  isLeaf: boolean;
  propKey?: string;
  propLabel?: string;
  propType?: string;
  propOptions?: string;
  propValue?: any;
  children?: MetaTreeNode[];
}

@Injectable()
export class MetadataService {

  private readonly _tree$ = new BehaviorSubject<TreeNode[]>([]);

  tree$ = this._tree$.asObservable();

  constructor(public api: ApiService, private messageService: MessageService) {
    this.api.treeMetaDescendants({ key: 'root' }).toPromise()
      .then(nodes =>
        this._tree$.next(
          nodes.map(c => ({ key: c.key, label: c.label || c.key, data: c, leaf: c.isLeaf, children: c.children || [] }))
        )
      );
  }

  async loadNodeChildren(node: TreeNode): Promise<void> {
    if (!node.leaf) return;
    const children = await this.api.treeMetaDescendants(node.data).toPromise();
    if (!children.length) return;
    node.children = children.map(c => ({ key: c.key, label: c.label, parent: node, data: c, leaf: c.isLeaf, children: c.children || [] }));
    this._tree$.next(this._tree$.value);
  }

  openSnackBar(severity: string, summary: string, detail: string) {
    this.messageService.add({ severity, summary, detail, key: '1' });
  }

}
