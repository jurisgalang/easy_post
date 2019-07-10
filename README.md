# EasyPost

Limited (for now) implementation of an EasyPost API client. Provides support for [Addresses](https://www.easypost.com/docs/api#addresses), [Parcels](https://www.easypost.com/docs/api#parcels) and related [EasyPost Objects](https://www.easypost.com/docs/api#objects).


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'easy_post'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install easy_post

## Usage

This gem expects the EasyPost API key to be set in the env var `EASY_POST_API_KEY`:
```sh
$ EASY_POST_API_KEY="..." ./bin/console
```

To create or fetch an [Address](https://www.easypost.com/docs/api#addresses) object:
```rb
address = EasyPost::Address.create(
  street1: "417 Montgomery St.",
  street2: "5th Floor",
  city:    "San Francisco",
  state:   "CA",
  zip:     "94104",
  country: "US",
  company: "EasyPost",
  phone:   "+1 (415) 123-4567",
  verify:  %i[delivery]
)
# => #<EasyPost::Address:0x00007fa5af11f498 @id="adr_...", @object="Address", ...>

address = EasyPost::Address.fetch("adr_cf1f297e9e9745b5baa9f38e39821cf7")
# => #<EasyPost::Address:0x00007fa5af11f498 @id="adr_...", @object="Address", ...>
```

Notice that associations (where applicable) that are [EasyPost Objects](https://www.easypost.com/docs/api#objects) themselves are first-class citizens:
```rb
address.verifications
# => #<EasyPost::Verifications:0x00007fa5aea77aa0 @zip4=nil, @delivery={"success"=>true, "errors"=>[], ...>

address.verifications.delivery
# => #<EasyPost::Verification:0x00007fa5af2f02e0 @success=true, @errors=[], @details={"latitude"=> ...>

address.verifications.delivery.details
# => #<EasyPost::VerificationDetails:0x00007fa5b0059fd0 @latitude=37.79298, ...>
```

For [Parcels](https://www.easypost.com/docs/api#parcels) objects:
```rb
parcel = EasyPost::Parcel.create(
  length: 20.2,
  width:  10.9,
  height: 5,
  weight: 65.9
)
# => #<EasyPost::Parcel:0x00007fa5af25b780 @id="prcl_...", @object="Parcel", ...>

parcel.find("prcl_ea5a3dd8c93240a3be21e1dc9835fbc7")
# => #<EasyPost::Parcel:0x00007fa5af25b780 @id="prcl_...", @object="Parcel", ...>
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/easy_post. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the EasyPost project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/easy_post/blob/master/CODE_OF_CONDUCT.md).
