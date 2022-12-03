FROM ruby:3.1.2

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client && rm -rf /var/cache/apk/*

WORKDIR /lightshot_parser_rails
COPY . ./

RUN bundle install

RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]