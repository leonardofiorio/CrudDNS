class Domain < ApplicationRecord
	
	#Validações de atributos
	validates_presence_of :name, :message => "O nome deve ser informado!"
	validates_presence_of :type_domain, :message => "O tipo deve ser informado!"
	validates_presence_of :ttl, :message => "O valor de ttl deve ser informado!"
	validates_presence_of :primary_name_server, :message => "O nome do servidor principal deve ser informado!"
	validates_presence_of :contact, :message => "O contato deve ser informado!"
	validates_presence_of :refresh, :message => "O valor de refresh deve ser informado!"
	validates_presence_of :retry, :message => "O valor de retry deve ser informado!"
	validates_presence_of :expire, :message => "O valor de expire deve ser informado!"
	validates_presence_of :minimum, :message => "O valor de minimum deve ser informado!"

	# Tratamento das zonas
	belongs_to :is_contained, class_name: "Domain", optional:true

end
