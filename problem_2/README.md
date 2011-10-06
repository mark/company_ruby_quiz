### Problem

Write a class with a method `search` that accepts an IP address, and returns the country it's associated with (use the included specific list of mappings in `IpToCountry.csv`).

The CSV file stores IP addresses as integer values, but the comments at the top
tell how to convert to and from them. Let me know if you have any questions.

For example:

* `"67.99.163.76"` will output `'United States'`

### Test

This directory contains `country_ip.rb` and `country_ip_test.rb`.  Please implement the methods in `country_ip.rb` so that all of the tests in `country_ip_test.rb` pass when the following command is executed:

    ruby country_ip_test.rb