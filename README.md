## Running on Heroku (free)

1. Clone this repository to your local computer.

2. Create Heroku app: `heroku apps:create private-cals-yourname`

3. Deploy to Heroky: `git push heroku master`

4.  Set secret key:

        heroku config:add SECURITY_TOKEN="`ruby -e "require 'SecureRandom'; print SecureRandom.hex"`"

    Note the security token that is generated in your terminal output.

5. Set your calendar URLs by using the same `heroku config:add CALENDAR_URLS="..."` command. URLs should all be HTTPS and delimited with `|`.

6. Go to `http://private-cals-yourname.herokuapp.com?token=...` where `...` is the token you noted in step 4.

You now have (theoretically) redacted calendar feeds. USE AT YOUR OWN RISK.


## Running locally

`shotgun app.rb`

## License

The MIT License (MIT)

Copyright (c) 2013 Max Mansick

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.