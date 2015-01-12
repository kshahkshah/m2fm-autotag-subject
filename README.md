# Mail2FrontMatter::AutotagSubject

[Mail2FrontMatter](https://github.com/whistlerbrk/mail2frontmatter) plugin for extracting tags from an email subject line by convention.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'm2fm-autotag-subject', require: false
```

And then execute:

    $ bundle

## Configuration

In your Mail2FrontMatter YAML configuration enable the plugin by adding it to your preprocessors:

```yaml
protocol: imap
receiver: yourblogemail@yourdomain.com
senders:  yourpersonal@yourdomain.com

preprocessors:
  - key: 'autotag-subject'

mailman:
  server: imap.gmail.com
  port: 993
  ssl: true
  username: yourblogemail@yourdomain.com
  password: yourpassword
```

## Usage

Now when you send an email to ```yourblogemail@yourdomain.com``` your subject line will be parsed for tags within brackets like:

```
to: yourblogemail@yourdomain.com
subject: [revelations, thoughts] My Amazing Revelation Today
body:
  ...
```

AutotagSubject will add 'revelations' and 'thoughts' and remove it from the the title. So your metadata will look like:

```ruby
{
  tags: ['revelations', 'thoughts']
  title: "My Amazing Revelation Today"
}
```

Which will later get transformed to YAML for your static site.

That's it!

## Contributing

1. Fork it ( https://github.com/[my-github-username]/m2fm-autotag-subject/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
