import { ChangeDetectionStrategy, Component, Input, Output, EventEmitter, OnInit } from '@angular/core';
import { Observable } from 'rxjs';
import { ApiService } from '../../services/api.service';
import { ISuggest, FormListSettings } from 'jetti-middle/dist';
import { IComplexObject } from '../dynamic-form/dynamic-form-base';

@Component({
  changeDetection: ChangeDetectionStrategy.OnPush,
  selector: 'j-ng-select',
  templateUrl: './ng.select.component.html'
})

export class JNgSelectComponent implements OnInit {

  @Input() selectedItems: IComplexObject[] = [];
  @Input() selectedItemsSimple: { label: string, value: string }[] = [];
  @Input() options: { label: string, value: string }[];
  @Input() type: string;
  @Input() inputStyle: { [x: string]: any };
  @Input() id: string;
  @Input() multiple = true;
  @Input() maxVisibleItems = 10;
  @Input() notFoundText = 'No items found';
  @Output() select = new EventEmitter<IComplexObject[]>();

  suggests$: Observable<ISuggest[]>;
  filters = new FormListSettings();

  constructor(private api: ApiService) { }
  ngOnInit(): void {
  }

  emitSelect() {
    if (!Array.isArray(this.selectedItems)) return;
    this.select.emit(this.selectedItems.map(e => ({ id: e.id, code: e.code, type: e.type, value: e.value })));
  }

  emitSelectSimple() {
    if (!Array.isArray(this.selectedItemsSimple)) return;
    this.select.emit([...this.selectedItemsSimple] as any);
  }

  onFilterChange(ev) {
    this.getSuggests(ev);
  }

  clear(item: IComplexObject) {
    this.selectedItems = [...this.selectedItems.filter(e => e.id !== item.id)];
  }

  getSuggests(text: string) {
    if (!text) return;
      this.suggests$ = this.api.getSuggests(this.type, text, this.filters.filter);
  }

}
