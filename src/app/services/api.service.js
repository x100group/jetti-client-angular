"use strict";
var __assign = (this && this.__assign) || function () {
    __assign = Object.assign || function(t) {
        for (var s, i = 1, n = arguments.length; i < n; i++) {
            s = arguments[i];
            for (var p in s) if (Object.prototype.hasOwnProperty.call(s, p))
                t[p] = s[p];
        }
        return t;
    };
    return __assign.apply(this, arguments);
};
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __generator = (this && this.__generator) || function (thisArg, body) {
    var _ = { label: 0, sent: function() { if (t[0] & 1) throw t[1]; return t[1]; }, trys: [], ops: [] }, f, y, t, g;
    return g = { next: verb(0), "throw": verb(1), "return": verb(2) }, typeof Symbol === "function" && (g[Symbol.iterator] = function() { return this; }), g;
    function verb(n) { return function (v) { return step([n, v]); }; }
    function step(op) {
        if (f) throw new TypeError("Generator is already executing.");
        while (_) try {
            if (f = 1, y && (t = op[0] & 2 ? y["return"] : op[0] ? y["throw"] || ((t = y["return"]) && t.call(y), 0) : y.next) && !(t = t.call(y, op[1])).done) return t;
            if (y = 0, t) op = [op[0] & 2, t.value];
            switch (op[0]) {
                case 0: case 1: t = op; break;
                case 4: _.label++; return { value: op[1], done: false };
                case 5: _.label++; y = op[1]; op = [0]; continue;
                case 7: op = _.ops.pop(); _.trys.pop(); continue;
                default:
                    if (!(t = _.trys, t = t.length > 0 && t[t.length - 1]) && (op[0] === 6 || op[0] === 2)) { _ = 0; continue; }
                    if (op[0] === 3 && (!t || (op[1] > t[0] && op[1] < t[3]))) { _.label = op[1]; break; }
                    if (op[0] === 6 && _.label < t[1]) { _.label = t[1]; t = op; break; }
                    if (t && _.label < t[2]) { _.label = t[2]; _.ops.push(op); break; }
                    if (t[2]) _.ops.pop();
                    _.trys.pop(); continue;
            }
            op = body.call(thisArg, _);
        } catch (e) { op = [6, e]; y = 0; } finally { f = t = 0; }
        if (op[0] & 5) throw op[1]; return { value: op[0] ? op[1] : void 0, done: true };
    }
};
exports.__esModule = true;
var core_1 = require("@angular/core");
var environment_1 = require("../../environments/environment");
var document_mapping_1 = require("../common/mapping/document.mapping");
var operators_1 = require("rxjs/operators");
var ApiService = /** @class */ (function () {
    function ApiService(http, lds) {
        this.http = http;
        this.lds = lds;
    }
    ApiService.prototype.getAttachmentStorageById = function (attachmentId) {
        var query = environment_1.environment.api + "attachments/getAttachmentStorageById/" + attachmentId;
        return this.http.get(query).toPromise();
    };
    ApiService.prototype.getAttachmentsByOwner = function (ownerId, withDeleted) {
        var query = environment_1.environment.api + "attachments/getByOwner/" + ownerId + "/" + withDeleted;
        return this.http.get(query).toPromise();
    };
    ApiService.prototype.getAttachmentsSettingsByOwner = function (ownerId) {
        var query = environment_1.environment.api + "attachments/getAttachmentsSettingsByOwner/" + ownerId;
        return this.http.get(query).toPromise();
    };
    ApiService.prototype.addAttachments = function (attach) {
        var query = environment_1.environment.api + "attachments/add";
        return this.http.post(query, attach).toPromise();
    };
    ApiService.prototype.delAttachments = function (attachmentsId) {
        var query = environment_1.environment.api + "attachments/del";
        return this.http.post(query, attachmentsId).toPromise();
    };
    ApiService.prototype.byId = function (id) {
        var query = environment_1.environment.api + "byId/" + id;
        return (this.http.get(query)).toPromise();
    };
    ApiService.prototype.ancestors = function (id, level) {
        var query = environment_1.environment.api + "ancestors/" + id + "/" + level;
        return (this.http.get(query)).toPromise();
    };
    ApiService.prototype.descendants = function (id, level) {
        var query = environment_1.environment.api + "descendants/" + id + "/" + level;
        return (this.http.get(query)).toPromise();
    };
    ApiService.prototype.haveDescendants = function (id) {
        var query = environment_1.environment.api + "haveDescendants/" + id;
        return (this.http.get(query)).toPromise();
    };
    ApiService.prototype.isCountryByCompany = function (companyId, countryCode) {
        return this.getObjectPropertyById(companyId, 'Country.code').then(function (code) {
            return code && code === countryCode;
        });
    };
    ApiService.prototype.getObjectPropertyById = function (id, valuePath) {
        var query = environment_1.environment.api + "getObjectPropertyById/" + id + "/" + valuePath;
        return (this.http.get(query)).toPromise();
    };
    ApiService.prototype.getDocPropValuesByType = function (type, propNames) {
        var query = environment_1.environment.api + "getDocPropValuesByType";
        return (this.http.post(query, { type: type, propNames: propNames })).toPromise();
    };
    ApiService.prototype.getDocMetaByType = function (type) {
        var query = environment_1.environment.api + "getDocMetaByType/" + type;
        return (this.http.get(query)).toPromise();
    };
    ApiService.prototype.getIndexedOperationType = function (operationId) {
        return __awaiter(this, void 0, void 0, function () {
            var query;
            return __generator(this, function (_a) {
                query = environment_1.environment.api + "getIndexedOperationType/" + operationId;
                return [2 /*return*/, (this.http.get(query)).toPromise()];
            });
        });
    };
    ApiService.prototype.formControlRef = function (id) {
        var query = environment_1.environment.api + "formControlRef/" + id;
        return (this.http.get(query)).toPromise();
    };
    ApiService.prototype.getDocList = function (type, id, command, count, offset, order, filter, listOptions) {
        if (count === void 0) { count = 10; }
        if (offset === void 0) { offset = 0; }
        if (order === void 0) { order = []; }
        if (filter === void 0) { filter = []; }
        if (listOptions === void 0) { listOptions = { withHierarchy: false, hierarchyDirectionUp: false }; }
        var query = environment_1.environment.api + "list";
        var body = { id: id, type: type, command: command, count: count, offset: offset, order: order, filter: filter, listOptions: listOptions };
        return this.http.post(query, body);
    };
    ApiService.prototype.getView = function (type, group) {
        var query = environment_1.environment.api + "view";
        return this.http.post(query, { type: type, group: group });
    };
    ApiService.prototype.getViewModel = function (type, id, params) {
        if (id === void 0) { id = ''; }
        if (params === void 0) { params = {}; }
        var query = environment_1.environment.api + "view";
        return this.http.post(query, __assign({ type: type, id: id }, params), { params: params });
    };
    ApiService.prototype.getFormView = function (type) {
        var query = environment_1.environment.api + "form/view/" + type;
        return this.http.get(query);
    };
    ApiService.prototype.getSuggests = function (docType, filter, filters) {
        var query = environment_1.environment.api + "suggest/" + docType + "?filter=" + filter;
        return this.http.post(query, { filters: filters });
    };
    ApiService.prototype.postDoc = function (doc) {
        var apiDoc = document_mapping_1.viewModelToFlatDocument(doc);
        var query = environment_1.environment.api + "post";
        return (this.http.post(query, apiDoc));
    };
    ApiService.prototype.unpostDocById = function (id) {
        var query = environment_1.environment.api + "unpost/" + id;
        return this.http.get(query);
    };
    ApiService.prototype.startWorkFlow = function (id) {
        var query = environment_1.environment.api + "startWorkFlow/" + id;
        return this.http.get(query);
    };
    ApiService.prototype.saveDoc = function (doc) {
        var apiDoc = document_mapping_1.viewModelToFlatDocument(doc);
        var query = environment_1.environment.api + "save";
        return (this.http.post(query, apiDoc));
    };
    ApiService.prototype.savePostDoc = function (doc) {
        var apiDoc = document_mapping_1.viewModelToFlatDocument(doc);
        var query = environment_1.environment.api + "savepost";
        return (this.http.post(query, apiDoc));
    };
    ApiService.prototype.postDocById = function (id) {
        var query = environment_1.environment.api + "post/" + id;
        return this.http.get(query);
    };
    ApiService.prototype.deleteDoc = function (id) {
        var query = "" + environment_1.environment.api + id;
        return (this.http["delete"](query));
    };
    ApiService.prototype.getDocRegisterMovementsList = function (id) {
        var query = environment_1.environment.api + "register/movements/list/" + id;
        return this.http.get(query);
    };
    ApiService.prototype.getDocAccountMovementsView = function (id) {
        var query = environment_1.environment.api + "register/account/movements/view/" + id;
        return (this.http.get(query));
    };
    ApiService.prototype.getDocRegisterAccumulationList = function (id) {
        var query = environment_1.environment.api + "register/accumulation/list/" + id;
        return this.http.get(query);
    };
    ApiService.prototype.getDocTransformedMovements = function (id) {
        var query = environment_1.environment.api + "register/movements/transformed/" + id;
        return this.http.get(query);
    };
    ApiService.prototype.getDocRegisterInfoList = function (id) {
        var query = environment_1.environment.api + "register/info/list/" + id;
        return this.http.get(query);
    };
    ApiService.prototype.getDocAccumulationMovements = function (type, id) {
        var query = environment_1.environment.api + "register/accumulation/" + type + "/" + id;
        return this.http.get(query);
    };
    ApiService.prototype.getDocInfoMovements = function (type, id) {
        var query = environment_1.environment.api + "register/info/" + type + "/" + id;
        return this.http.get(query);
    };
    ApiService.prototype.getRegisterInfoMovementsByFilter = function (type, filter) {
        var query = environment_1.environment.api + "/register/info/byFilter/" + type;
        return this.http.post(query, filter);
    };
    ApiService.prototype.getOperationsGroups = function () {
        var query = environment_1.environment.api + "operations/groups";
        return (this.http.get(query));
    };
    ApiService.prototype.getUserFormListSettings = function (type) {
        var query = environment_1.environment.api + "user/settings/" + type;
        return this.http.get(query);
    };
    ApiService.prototype.setUserFormListSettings = function (type, formListSettings) {
        var query = environment_1.environment.api + "user/settings/" + type;
        return this.http.post(query, formListSettings);
    };
    ApiService.prototype.getUserDefaultsSettings = function () {
        var query = environment_1.environment.api + "user/settings/defaults";
        return this.http.get(query);
    };
    ApiService.prototype.setUserDefaultsSettings = function (value) {
        var query = environment_1.environment.api + "user/settings/defaults";
        return this.http.post(query, value);
    };
    ApiService.prototype.getDocDimensions = function (type) {
        var query = "" + environment_1.environment.api + type + "/dimensions";
        return (this.http.get(query));
    };
    ApiService.prototype.valueChanges = function (doc, property, value) {
        var apiDoc = document_mapping_1.viewModelToFlatDocument(doc);
        var query = environment_1.environment.api + "valueChanges/" + doc.type + "/" + property;
        var callConfig = { doc: apiDoc, value: value };
        return this.http.post(query, callConfig).toPromise();
    };
    ApiService.prototype.onCommand = function (doc, command, args) {
        var apiDoc = document_mapping_1.viewModelToFlatDocument(doc);
        var query = environment_1.environment.api + "command/" + doc.type + "/" + command;
        var callConfig = { doc: apiDoc, args: args };
        return this.http.post(query, callConfig).toPromise();
    };
    ApiService.prototype.documentsDataAsJSON = function (documents) {
        var query = environment_1.environment.api + "documentsDataAsJSON";
        return this.http.post(query, documents).toPromise();
    };
    ApiService.prototype.jobAdd = function (data, opts) {
        var query = environment_1.environment.api + "jobs/add";
        return this.http.post(query, { data: data, opts: opts });
    };
    ApiService.prototype.jobs = function () {
        var query = environment_1.environment.api + "jobs";
        return this.http.get(query);
    };
    ApiService.prototype.jobById = function (id) {
        var query = environment_1.environment.api + "jobs/" + id;
        return this.http.get(query);
    };
    ApiService.prototype.tree = function (type) {
        var query = environment_1.environment.api + "tree/" + type;
        return this.http.get(query);
    };
    ApiService.prototype.hierarchyList = function (type, id, columns) {
        var _this = this;
        if (id === void 0) { id = 'top'; }
        if (columns === void 0) { columns = []; }
        var query = environment_1.environment.api + "hierarchyList/" + type + "/" + id;
        var result = this.http.get(query);
        if (columns.length) {
            result.pipe(operators_1.take(1)).subscribe(function (hierarchyList) {
                _this.getDocList(type, '', 'first').toPromise().then(function (docList) {
                });
            });
        }
        return result;
    };
    ApiService.prototype.execute = function (type, method, doc) {
        var apiDoc = document_mapping_1.viewModelToFlatDocument(doc);
        var query = environment_1.environment.api + "form/" + type + "/" + method;
        return this.http.post(query, apiDoc);
    };
    ApiService.prototype.batchActual = function () {
        var query = environment_1.environment.api + "batch/actual";
        return this.http.get(query);
    };
    ApiService.prototype.getHistoryById = function (id) {
        var query = environment_1.environment.api + "getHistoryById/" + id;
        return this.http.get(query);
    };
    ApiService.prototype.restoreObjectFromHistory = function (id, type) {
        var query = environment_1.environment.api + "restore/" + type + "/" + id;
        return this.http.get(query);
    };
    ApiService.prototype.getDescedantsObjects = function (id) {
        var query = environment_1.environment.api + "getDescedantsObjects/" + id;
        return this.http.get(query);
    };
    ApiService.prototype.SubSystemsMenu = function () {
        var query = environment_1.environment.auth + "subsystems/menu";
        return this.http.get(query);
    };
    ApiService = __decorate([
        core_1.Injectable({ providedIn: 'root' })
    ], ApiService);
    return ApiService;
}());
exports.ApiService = ApiService;
