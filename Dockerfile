FROM ruby:3.0.2-alpine3.14

# # musl locale path (https://github.com/rilian-la-te/musl-locales)
# ENV MUSL_LOCPATH "/usr/share/i18n/locales/musl"

RUN apk add --update \
  build-base \
  postgresql-dev \
  tzdata \
  # musl-locales \
  # musl-locales-lang \
  # tesseract-ocr \
  # tesseract-ocr-data-rus \
  && rm -rf /var/cache/apk/*

# Russian locale settings
# ENV LANG ru_RU.UTF-8
# ENV LANGUAGE ru_RU.UTF-8
# ENV LC_ALL ru_RU.UTF-8

WORKDIR /usr/src

COPY Gemfile Gemfile.lock ./
RUN bundle install

EXPOSE 3000
CMD ["bundle", "exec", "puma", "-p", "3000"]
COPY . .
