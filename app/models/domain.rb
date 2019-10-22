class Domain < ApplicationRecord
	
	#Validações de atributos
	validates_presence_of  :name, :message => "deve ser informado!"
	validates_presence_of  :ttl, :message => "deve ser informado!"
	validates_presence_of  :primary_name_server, :message => "deve ser informado!"
	validates_presence_of  :contact, :message => "deve ser informado!"
	validates_presence_of  :refresh, :message => "deve ser informado!"
	validates_presence_of  :retry, :message => "deve ser informado!"
	validates_presence_of  :expire, :message => "deve ser informado!"
	validates_presence_of  :minimum, :message => " deve ser informado!"

	# Validação customizada do type_domain
	validate :type_domain_validate

	# Relacionamento entre os domains: subdomains
	belongs_to :domains, class_name: "Domain", optional:true, dependent: :destroy

	# Relacionamento de Records pertencentes ao domain
	has_many :records, class_name: "Record", :inverse_of => :domain 


	# Método de validação do type_domain
	def type_domain_validate
		if self.type_domain.eql?('MASTER') or self.type_domain.eql?('SLAVE') or 
			self.type_domain.eql?('FORWARD') or self.type_domain.eql?('STUB') or
			self.type_domain.eql?('HINT')
		else
			errors.add(:type_domain, " invalido!")
		end
	end 

end
