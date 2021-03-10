FROM ruby:2.6.3

RUN apt-get update \
    && apt-get install -y --no-install-recommends\
    vim \
    nodejs  \
    postgresql-client \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


WORKDIR /myproject

COPY Gemfile /myproject/Gemfile
COPY Gemfile.lock /myproject/Gemfile.lock

RUN gem install bundler
RUN bundle install

COPY . /myproject
