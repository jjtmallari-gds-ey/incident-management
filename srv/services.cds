using {sap.capire.incidents as my} from '../db/schema';

service AdminService {
    entity Incidents as projection on my.Incidents;
    entity Customers as projection on my.Customers;

}

annotate AdminService with @(requires: 'admin');

service ProcessorService {
    entity Incidents as projection on my.Incidents;

    @readonly
    entity Customers as projection on my.Customers;

}

annotate ProcessorService.Incidents with @odata.draft.enabled;
annotate ProcessorService with @(requires: 'support');
