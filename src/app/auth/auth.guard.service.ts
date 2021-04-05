import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, CanActivate, Router, RouterStateSnapshot } from '@angular/router';
import { MessageService } from 'primeng/api';
import { AuthService } from '../auth/auth.service';

@Injectable()
export class AuthGuardService implements CanActivate {

  constructor(private auth: AuthService, private messageService: MessageService) { }

  async canActivate(route: ActivatedRouteSnapshot, state: RouterStateSnapshot) {
    if (route.params.type === 'home') { return true; }
    if (!this.auth.permissionsByType(route.params.type, route.params.group).read)
    // || (route.params.id && !(await this.auth.isAvalibleObject(route.params.id))))
    {
      this.messageService.add({ severity: 'error', summary: 'Access denied!', detail: '', key: '1' });
      return false;
    }
    return true;
  }
}
