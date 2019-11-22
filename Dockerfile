FROM ruby:2.6.5

MAINTAINER Leonardo Fiório 
RUN apt install -y curl
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - 
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client yarn


RUN mkdir /CrudDNS
WORKDIR /CrudDNS

# Copiando projeto para raiz da imagem
COPY . /CrudDNS

COPY Gemfile /CrudDNS/Gemfile

RUN bundle install

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000 

# Executando server 
CMD rails s -b 0.0.0.0 -p 3000

