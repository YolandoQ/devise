FROM ruby:3.0.2

WORKDIR /backend

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .

ENV RAILS_ENV=development

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]