# README

CrudDNS é um projeto desenvolvido em Ruby on Rails para inserção, alteração, visualização e remoção em um cadastro de Domains e Records (A, TXT, CNAME e PTR).


Principais Tecnologias:

* Ruby 2.6.5

* Rails 6.0.0

* sqlite 3

* Docker


Como executar:

* $ docker build -t cruddns .

* $ docker run -it -p 3000:3000 cruddns


Testes:

Os testes foram implementados utilizando a implementação nativa do Rails.
Para executar:

 * Descomentar a linha 'CMD rails test' e comentar a linha do servidor

 ou, no caso do ambiente já instalado:

 * $ rails test
