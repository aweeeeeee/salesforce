public with sharing class SoqlQuery {
    public SoqlQuery() {
            /*
                        // Add first contact and related details
            Contact contact1 = new Contact(
            Firstname='Quentin',
            Lastname='Foam',
            Phone='(415)555-1212',
            Department= 'Specialty Crisis Management',
            Title='Control Engineer - Specialty - Solar Arrays',
            Email='qfoam@trailhead.com');
            insert contact1;
            // Add second contact and related details
            Contact contact2 = new Contact(
            Firstname='Vega',
            Lastname='North',
            Phone='(416)556-1312',
            Department= 'Specialty Crisis Management',
            Title='Control Engineer - Specialty - Propulsion',
            Email='vnorth@trailhead.com');
            insert contact2;
            // Add third contact and related details
            Contact contact3 = new Contact(
            Firstname='Palma',
            Lastname='Sunrise',
            Phone='(554)623-1212',
            Department= 'Specialty Crisis Management',
            Title='Control Engineer - Specialty - Radiators',
            Email='psunrise@trailhead.com');
            insert contact3;
        */

        //SELECT Name, Phone, Email, Title FROM Contact
        //              WHERE (Department = 'Specialty Crisis Management')
        // click execute tab

        /**
         *  Contact[] theseContacts = [SELECT Name, Phone, Email, Description FROM Contact
                           WHERE (Department='Specialty Crisis Management')
                           ORDER BY Name];
                            // Log a count of how many contacts were found
                            System.debug(theseContacts.size() + ' contact(s) returned.');
                            // Log all values in the array of contacts
                            System.debug(theseContacts);
         * 
         */
        //debug only

        /**
         *   List<List<sObject>> searchList = [FIND 'Crisis' IN ALL FIELDS 
                                  RETURNING Contact(FirstName, LastName,
                                  Phone, Email, Description)];
                                Contact[] searchContacts = (Contact[])searchList[0];
                                System.debug('Found the following contacts:');
                                for (Contact c : searchContacts) {
                                System.debug(c.LastName + ', ' + c.FirstName);
                                }
         * 
         *  crisis = find / change text
         */

        Account[] accts = [SELECT Name,Phone FROM Account];
        System.debug(accts);

        //SoqlQuery s = new SoqlQuery();

    }
}
