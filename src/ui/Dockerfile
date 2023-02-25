FROM alpine:3.14.5

RUN apk update && apk upgrade
RUN apk add --no-cache ruby-full \
                       ruby-dev \
                       ruby-bundler \
                       build-base \
    && gem install bundler:1.17.2 \
    && gem install bson_ext -v '1.12.5' \
    && rm -rf /var/cache/apk/*

ENV APP_HOME /app
RUN mkdir $APP_HOME

WORKDIR $APP_HOME
ADD Gemfile* $APP_HOME/
RUN bundle install
ADD . $APP_HOME

ENV POST_SERVICE_HOST post
ENV POST_SERVICE_PORT 5000
ENV COMMENT_SERVICE_HOST comment
ENV COMMENT_SERVICE_PORT 9292

CMD ["puma"]
