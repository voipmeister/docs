---
title: Pagination
---

Where indicated, pagination is enabled/available. When calling those APIs, the data is returned in this format:

- `data` contains a list of all of the objects (for example, the airports)
- `links` contains the links to navigate through the paginated list
- `meta` contains information about the current dataset

```json
{ 
  "data": [ ... ],
  "links": {
    "first":"http://phpvms.test/api/airports?page=1",
    "last":"http://phpvms.test/api/airports?page=3",
    "prev":null,
    "next":"http://phpvms.test/api/airports?page=2"
  },
  "meta": {
    "current_page": 1,
    "from":1, 
    "last_page":3,
    "path":"http://phpvms.test/api/airports",
    "per_page":50,
    "to":50,
    "total":120
  }
}
```