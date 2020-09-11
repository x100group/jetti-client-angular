import { CatalogOperation, Parameter } from './Catalog.Operation';
import { MSSQL } from '../../mssql';
import { IServerDocument } from '../documents.factory.server';
import { lib } from '../../std.lib';
import { DocTypes } from '../documents.types';
import { riseUpdateMetadataEvent, IDynamicProps } from '../Dynamic/dynamic.common';

export class CatalogOperationServer extends CatalogOperation implements IServerDocument {

    async onCreate(tx: MSSQL) {
        if (!this.script)
            this.script = `/*
// Account
Registers.Account.push({
    debit: { account: lib.account.byCode('50.01'), subcounts: [$.CashRegister, lib.doc.byCode('Catalog.CashFlow', 'IN.CUSTOMER', tx)] },
    kredit: { account: lib.account.byCode('62.01'), subcounts: [$.Customer] },
    sum: AmountInBalance
});

// Balance
Registers.Accumulation.push({
    kind: false,
    type: "Register.Accumulation.Balance",
    data: {
        Department: $.Department,
        Balance: lib.doc.byCode('Catalog.Balance', 'AR', tx),
        Analytics: $.Customer,
        Amount: AmountInBalance
    }
});

Registers.Accumulation.push({
    kind: true,
    type: "Register.Accumulation.Balance",
    data: {
        Department: $.Department,
        Balance: lib.doc.byCode('Catalog.Balance', 'CASH', tx),
        Analytics: $.CashRegister,
        Amount: AmountInBalance
    }
});

// PL
Registers.Accumulation.push({
    kind: true,
    type: "Register.Accumulation.PL",
    data: {
        Department: $.Department,
        PL: $.Expense,
        Analytics: $.Analytics,
        Amount: $.Amount,
    }`;
        return this;
    }

    async updateSQLViews() {
        await lib.meta.updateSQLViewsByOperationId(this.id as any);
    }

    async riseUpdateMetadataEvent() {
        await riseUpdateMetadataEvent();
    }

    async getDynamicMetadata(tx: MSSQL): Promise<IDynamicProps> {
        return { type: this.getType(), Prop: await this.getPropFunc(tx), Props: await this.getPropsFunc(tx) };
    }

    getType(): string { return `Operation.${this.shortName}`; }

    async createDocServer(tx: MSSQL) {
        const type = 'Document.Operation';
        return await lib.doc.createDocServer(type, { id: this.id, Operation: this.id } as any, tx);
    }

    async getPropsFunc(tx: MSSQL): Promise<Function> {
        const doc = await this.createDocServer(tx);
        const props = { ...doc.Props() };
        props.type = { type: 'string', hidden: true, hiddenInList: true };
        props.Operation.value = this.id;
        return () => props;
    }

    async getPropFunc(tx: MSSQL): Promise<Function> {
        const doc = await this.createDocServer(tx);
        return () => ({ ...doc.Prop(), type: this.getType() as DocTypes });
    }
}
