FROM ruby:3.2.2

RUN curl -sL https://deb.nodesource.com/setup_19.x | bash - \
    && wget --quiet -O - /tmp/pubkey.gpg https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update -qq \
    && apt-get install -y build-essential libpq-dev nodejs yarn \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /myapp

COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN gem install bundler:2.3.17
RUN bundle install

COPY package.json /myapp/package.json
COPY yarn.lock /myapp/yarn.lock
RUN yarn install --check-files

COPY . /myapp

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]