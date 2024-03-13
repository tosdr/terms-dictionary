# terms-dictionary

This is the script that ToS;DR is using to align Phoenix document names to Open Terms Archive-style terms types. Using terms types will allow us to both normalize and organize documents.

The script generates a dictionary based on terms types defined here: [ToS;DR Terms Types](https://github.com/tosdr/terms-types)

The ToS;DR terms types are a fork of OTA's official terms types. Documentation for OTA's terms types can be found here: [OTA Terms Types](https://github.com/OpenTermsArchive/terms-types)

ToS;DR has forked OTA's terms types in order to add custom types that are not covered by OTA's official terms types. An example would be **Corporate Social Responsibility**, or CSR. Many documents in Phoenix concern CSR, but OTA did not have an official terms type to classify them. Thus, we added the CSR terms type to the ToS;DR fork of OTA's official terms types.

**Requirements**: Ruby installed in the shell, a CSV dump of Phoenix documents.

To run the script from the console: `ruby ./create_name_dictionary.rb`



