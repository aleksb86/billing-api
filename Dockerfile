FROM ruby:3.0.2-alpine3.14

RUN apk add --update \
  build-base \
  postgresql-dev \
  tzdata \
  && rm -rf /var/cache/apk/*

WORKDIR /usr/src

COPY Gemfile Gemfile.lock ./
RUN bundle install

EXPOSE 3000
CMD ["bundle", "exec", "puma", "-p", "3000"]
COPY . .
