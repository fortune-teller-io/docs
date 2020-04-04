FROM ruby:2.7.1

RUN apt-get update && apt install -yq pkg-config build-essential nodejs git libxml2-dev libxslt-dev && apt-get autoremove -yq

WORKDIR /app

COPY ./ ./

RUN bundle install

ENTRYPOINT [ "bundle", "exec", "middleman" ]