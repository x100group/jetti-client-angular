import { ChangeDetectionStrategy, Component, EventEmitter, Input, OnDestroy, OnInit, Output, ChangeDetectorRef } from '@angular/core';
import { Router } from '@angular/router';
import { TreeNode } from 'primeng/api';
import { merge, Observable, Subject, Subscription } from 'rxjs';
import { filter, map, switchMap, tap, take } from 'rxjs/operators';
import { ITree, DocumentBase } from 'jetti-middle/dist';
import { v1 } from 'uuid';
import { DocService } from '../../common/doc.service';
import { ApiService } from '../../services/api.service';
import { LoadingService } from '../loading.service';
import { MetadataService } from '../metadata.service';

@Component({
  changeDetection: ChangeDetectionStrategy.OnPush,
  selector: 'j-tree-list',
  templateUrl: 'base.tree-list.component.html',
})
export class BaseTreeListComponent implements OnInit, OnDestroy {
  @Output() selectionChange = new EventEmitter();
  @Input() type: string;
  @Input() showCommands = true;
  @Input() scrollHeight = `${(window.innerHeight - 275)}px`;

  treeNodes$: Observable<TreeNode[]>;
  treeNodes: TreeNode[] = [];
  selection: TreeNode;

  // tslint:disable-next-line: max-line-length
  constructor(public meta: MetadataService, private api: ApiService, public router: Router, public ds: DocService, public lds: LoadingService, private cd: ChangeDetectorRef) { }

  ngOnDestroy(): void {

  }


  ngOnInit() {


    // this.treeNodes$ = this.paginator.pipe(
    //   switchMap(doc => {
    //     return this.api.tree(this.type).pipe(
    //       map(tree => <TreeNode[]>[{
    //         label: '(All)',
    //         data: { id: undefined, description: '(All)', type: this.type, value: null, code: null },
    //         expanded: true,
    //         expandedIcon: 'fa fa-folder-open',
    //         collapsedIcon: 'fa fa-folder',
    //         children: this.buildTreeNodes(tree, null),
    //       }]),
    //       tap(treeNodes => {
    //         this.treeNodes = treeNodes;
    //       }));
    //   }));
    // setTimeout(() => this.paginator.next());

    // this.hotkeys.addShortcut({ keys: 'Insert', description: 'Add' }).subscribe(() => { this.add(); });
    // this.hotkeys.addShortcut({ keys: 'F2', description: 'Open' }).subscribe(() => { this.open(); });
    // this.hotkeys.addShortcut({ keys: 'F9', description: 'Copy' }).subscribe(() => { this.copy(); });
    // this.hotkeys.addShortcut({ keys: 'Delete', description: 'Delete' }).subscribe(() => { this.delete(); });
  }

  async onNodeSelect(event: { node: TreeNode, origin: any }) {
    debugger;
    if (!event.node.leaf) return;
    if (!event.node.children.length)
      await this.meta.loadNodeChildren(event.node);
    if (event.node.children.length) event.node.expanded = true;
  }

  private findDoc(tree: TreeNode[], id: string): TreeNode | undefined {
    if (!id) { return undefined; }
    const result = tree.find(el => el.data.id === id);
    if (result) return result;
    for (let i = 0; i < tree.length; i++) {
      const childrenResult = this.findDoc(tree[i].children || [], id);
      if (childrenResult) return childrenResult;
    }
  }



  private buildTreeNodes(tree: ITree[], parent: string | null): TreeNode[] {
    return tree.filter(el => el.parent === parent).map(el => {
      return <TreeNode>{
        label: el.description,
        data: { id: el.id, description: el.description, type: this.type, value: el.description, code: null },
        expanded: true,
        expandedIcon: 'fa fa-folder-open',
        collapsedIcon: 'fa fa-folder',
        children: this.buildTreeNodes(tree, el.id) || [],
      };
    });
  }

}
