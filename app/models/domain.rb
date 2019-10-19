class Domain < ApplicationRecord

	#attr_accessible :name, :type_domain, :ttl, :primary_name_server, :contact, :refresh, :retry, :expire, :minimum 
	
	#Validações de atributos
	validates_presence_of :name, :message => "deve ser informado!"
	validates_presence_of :type_domain, :message => "deve ser informado!"
	validates_presence_of :ttl, :message => "deve ser informado!"
	validates_presence_of :primary_name_server, :message => "deve ser informado!"
	validates_presence_of :contact, :message => "deve ser informado!"
	validates_presence_of :refresh, :message => "deve ser informado!"
	validates_presence_of :retry, :message => "deve ser informado!"
	validates_presence_of :expire, :message => "deve ser informado!"
	validates_presence_of :minimum, :message => " deve ser informado!"

	# Tratamento das zonas
	belongs_to :domains, class_name: "Domain", optional:true

	has_many :records, class_name: "Record", :inverse_of => :domain 

end
