import { Injectable, OnDestroy } from '@angular/core';
import { IUserSettings } from 'jetti-middle/dist/common/classes/user-settings';
import { MessageService } from 'primeng/api';
import { Subject } from 'rxjs';
import { BehaviorSubject } from 'rxjs/internal/BehaviorSubject';
import { take } from 'rxjs/operators';
import { v4 } from 'uuid';
import { ApiService } from '../../services/api.service';

export type kind = 'columns' | 'filter';

export const hiddenColumns =
  ['id',
    'date',
    'user',
    // 'posted',
    'parent',
    'isfolder',
    'info',
    'timestamp',
    'workflow',
    'type'];
@Injectable({ providedIn: 'root' })
export class UserSettingsService implements OnDestroy {

  _settings$ = new BehaviorSubject<IUserSettings[]>([]);

  get settings() { return this._settings$.value; }
  set settings(settings: IUserSettings[]) { this._settings$.next(settings) };

  // get selectedSettings() { return this.state.selected; }
  // get defaultSettings() { return this.state.default; }
  // get allSettings() { return this.state.settings; }
  get state() { return this._settings$.value; }
  // get isModify() { return !!(this.selectedSettings && this.selectedSettings.isModify); }
  // get readonly() { return !!(this.selectedSettings && this.selectedSettings.readonly); }
  // get selectedSettingsDescription() {
  //   return this.selectedSettings ?
  //     `${this.isModify && !this.selectedSettings.description.startsWith('*') ? '*' : ''}${this.selectedSettings.description || ''}` : '';
  // }

  // set isModify(mod: boolean) { this.selectedSettings.isModify = mod; }

  constructor(private api: ApiService, private messageService: MessageService) { }

  ngOnDestroy(): void {
    this._settings$.complete();
    // this._userSettingsFilter$.complete();
  }

  getSelectedSettings(type: string, kind: kind) {
    return this.settings.find(e => e.type === type && e.kind === kind && e.selected);
  }

  copySettings(type: string, kind: kind) {
    const selected = this.getSelectedSettings(type, kind);
    let newSettings = {
      ...selected,
      isNew: true,
      id: v4().toLocaleUpperCase(),
      description: 'Copy: ' + selected.description
    }
    this.settings = [...this.settings, newSettings]
  }

  async loadSettings(type: string, user: string, defaultSettings: IUserSettings[]) {
    const savedSettings = await this.api.getUserSettings(type, user);
    this.settings = [...savedSettings, ...defaultSettings];
  }

  async setSelectedSettings(settings: IUserSettings, kind: kind) {
    settings = { ...settings, kind };
    if (settings.isModify) await this.saveSettingsAsSelected(settings);
    else this.showSuccessMessage(`Applied settings "${settings.description || 'DEFAULT'}"`);
    this.settings = [...this.settings, settings];
  }

  async resetSelectedSettings(type: string, kind: kind) {
    const selected = this.getSelectedSettings(type, kind);
    // if (!selected) 
    // const settings = this.selectedSettings.isNew ? this.defaultSettings : this.selectedSettings;
    // this.selectedSettings = { ...settings, isModify: false };
  }

  deleteSelectedSettings(type: string, kind: kind) {
    const selected = this.getSelectedSettings(type, kind);
    if (!selected || selected.readonly) throw new Error('Cant delete setting: default settings is not provided');
    const delDesc = selected.description;
    if (!selected.isNew) this.api.deleteUserSettings(selected.id);
    this.settings = [...this.settings.filter(e => e.id !== selected.id)]
    this.showSuccessMessage(`Settings "${delDesc}" is deleted`);
  }

  async saveSettingsAsSelected(settings: IUserSettings) {
    if (settings.readonly) { settings.isModify = false; return; }
    if (!settings.description || settings.description.trim() === '*') settings.description = '<unnamed>';
    const settingsToSave: IUserSettings[] = [];
    settingsToSave.push({ ...settings, selected: true });
    const oldSelected = this.settings.find(e => e.selected && e.id !== settings.id);
    if (oldSelected) settingsToSave.push({ ...oldSelected, selected: false });
    await this.saveSettings(settingsToSave);
  }

  async saveSettings(settings: IUserSettings[]) {
    const savedSettings = await this.api.saveUserSettings(settings);
    // const allSettings = [...this.allSettings];
    for (const set of savedSettings) {
      set.isModify = false;
      set.isNew = false;
      this.showSuccessMessage(`Settings ${set.description} is saved`);
      // this.cacheSettings(set);
      // const oldSet = allSettings.find(e => e.id === set.id);
      // if (oldSet) allSettings[allSettings.indexOf(oldSet)] = set;
      // else allSettings.unshift(set);
    }
    this.settings = [...this.settings, ...savedSettings];
    // this.allSettings = allSettings;
  }

  getSettingsFromCache(id: string) {
    if (!id) return null;
    const settings = localStorage.getItem(this.settingsCacheKey(id));
    return settings ? JSON.parse(settings) as IUserSettings : null;
  }

  cacheSettings(settings: IUserSettings) {
    return localStorage.setItem(this.settingsCacheKey(settings.id), JSON.stringify(settings));
  }

  settingsCacheKey(id: string) {
    return `formSettings: ${id} `;
  }

  private showSuccessMessage(summary: string, detail = '') {
    this.messageService.add({ severity: 'success', summary, detail, key: '1' });
  }
}
