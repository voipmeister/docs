---
title: 'Flight Fields'
media_order: 'Screen Shot 2018-03-20 at 1.42.50 PM.png,Screen Shot 2018-03-20 at 1.42.33 PM.png'
taxonomy:
    category:
        - docs
---

You can add custom fields to your flight schedules. In the admin panel, go to `Flights` and then `Fields` on the top right. The fields will show up in `Edit Flight`, as a "template" for fields that can/should be filled out.

To use these values in your template, you can call the `field()` method on the `Flight` model (e.g, in the `flights/table.blade.php` file):

```php
echo $flight->field('Departure Gate');
```

The fields page:
![](Screen%20Shot%202018-03-20%20at%201.42.50%20PM.png)

How the fields show up on the "Edit Flight" page:
![](Screen%20Shot%202018-03-20%20at%201.42.33%20PM.png)