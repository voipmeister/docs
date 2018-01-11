---
title: 'Importing from v2/v5'
taxonomy:
    category:
        - docs
---

The importer tool can only be run on the command line, via a PHP artisan command. Before running the importer, you should install phpVMS using the installer. 

```sh
php artisan phpvms:importer  {db_host} {db_name} {db_user} {db_pass?}
```

## notes and caveats

Due to some changes with how some of the fundamentals have changed within the system, be aware of the following:

* Users will have to reset their passwords
* Column names don't entirely match up between the databases
* IDs will differ (numeric, or PIREP IDs will be converted to the new alphanumeric format)
* financial data is not yet imported, since this part of phpVMS hasn't been rewritten yet

### Specific things that need to be done

* Aircraft that are imported are all placed in a generic subfleet. You will need to go and either add additional subfleets, or just rename this subfleet to whatever you want
* All flights will be assigned to this subfleet. Unfortunately, you will need to re-assign the flights to be with the proper subfleet
* Ranks are now assigned subfleets they are allowed to fly. This is different from the old version, which operated on a linear progression for the aircraft that are allowable per-rank. You will need to edit the ranks and set the subfleets that are assigned to them.