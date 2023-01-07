FROM ruby:3.0.1-alpine AS ruby_base

RUN apk add --update --no-cache binutils-gold build-base curl file g++ gcc gcc git less libstdc++ libffi-dev libc-dev linux-headers libxml2-dev libxslt-dev libgcrypt-dev make netcat-openbsd nodejs openssl pkgconfig postgresql-dev tzdata yarn imagemagick
#
#RUN  #sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
#
#
#RUN gem install bundler
#
#WORKDIR /app
#
#COPY Gemfile Gemfile.lock ./
#
#RUN bundle check || bundle --without development test
#
#COPY . ./app



# Install node 14-LTS and yarn
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
#RUN apt-get update -qq && apt-get install -qq --no-install-recommends \
#    nodejs \
#  && apt-get clean \
#  && rm -rf /var/lib/apt/lists/*
RUN npm install -g yarn
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install
COPY . /app
EXPOSE 3000
RUN SECRET_KEY_BASE=1 RAILS_ENV=production bundle exec rake assets:precompile
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]