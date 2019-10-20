class Domain < ApplicationRecord
	
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

	# Relacionamento entre os domains: subdomains
	belongs_to :domains, class_name: "Domain", optional:true, dependent: :destroy

	# Relacionamento de Records pertencentes ao domain
	has_many :records, class_name: "Record", :inverse_of => :domain 

end
