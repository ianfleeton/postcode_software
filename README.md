# README

Unofficial Ruby wrapper for using the web SDK provided by https://www.postcodesoftware.com.

## Installation

```sh
gem install postcode_software
```

## Usage

```ruby
require "postcode_software"
PostcodeSoftware.account  = "myaccount"
PostcodeSoftware.password = "mypassword"
response = PostcodeSoftware.look_up("LS18 4AB")
response.address_1 # => "North Broadgate Lane"
response.address_2 # => "Horsforth"
response.town      # => "Leeds"
response.postcode  # => "LS18 4AB"
response.premises[0]
# => {:organisation=>nil, :building_details=>"Broadgate House", :number=>nil}
```
