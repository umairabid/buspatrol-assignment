FROM ruby:3.0.0

WORKDIR /app
COPY . /app

RUN apt-get update -qq && apt-get install -y \
  apt-utils \
  postgresql-client
RUN bundle install

EXPOSE 4567

CMD [ "./run.sh" ]