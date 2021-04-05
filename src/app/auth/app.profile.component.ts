import { animate, state, style, transition, trigger } from '@angular/animations';
import { Component, Input } from '@angular/core';
import { AuthService } from '../auth/auth.service';
import { SafeUrl, DomSanitizer } from '@angular/platform-browser';
import { DialogService } from 'primeng/api';
import { InputValueDialogComponent } from './../dialog/input-value.dialog.component';

@Component({
  selector: 'app-inline-profile',
  templateUrl: './app.profile.component.html',
  providers: [DialogService],
  animations: [
    trigger('menu', [
      state('hidden', style({
        height: '0px'
      })),
      state('visible', style({
        height: '*'
      })),
      transition('visible => hidden', animate('400ms cubic-bezier(0.86, 0, 0.07, 1)')),
      transition('hidden => visible', animate('400ms cubic-bezier(0.86, 0, 0.07, 1)'))
    ])
  ]
})
export class AppProfileComponent {

  active: boolean;
  image: SafeUrl = '';
  @Input() inline = true;

  constructor(public appAuth: AuthService, private sanitizer: DomSanitizer, private dialog: DialogService) {
    appAuth.userProfile$.subscribe(data => {
      const photo = localStorage.getItem('photo');
      if (photo) this.image = this.sanitizer.bypassSecurityTrustUrl(`data:image/jpg;base64,${photo}`);
    });
  }

  loadUserPermission() {
    this.appAuth.loadPermissions();
  }

  onClick(event) {
    this.active = !this.active;
    event.preventDefault();
  }

  viewAs() {
    const ref = this.dialog.open(InputValueDialogComponent, {
      header: 'Choose a user',
      width: '70%',
      data: {
        schema: { User: { type: 'Catalog.User', style: { 'width': '270px', 'min-width': '270px' } } },
        value: { User: { id: '', type: 'Catalog.User', code: '', value: '' } }
      }
    });
    ref.onClose.subscribe(sel => sel && sel.User && sel.User.code && this.appAuth.viewAs(sel.User.code));
  }

}
