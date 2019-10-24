class Record < ApplicationRecord

	# Validações
	validates_presence_of :name, :message => "não informado!"
	validates_presence_of :ttl, :message => "não informado!"
	validates_presence_of :content, :message => "não informado!"
	validates_presence_of :priority, :message => "não informado!"
	validates_presence_of :domain, :message => "não informado!"
	validates_presence_of :class_record, :message => "não informado!"

	#Validação personalizada para o type_record
	validate :type_record_validate

	#Validação personalizada para o formato ipv4
	validate :content_ipv4_validate

	# Validação do Domain a qual o Record pertence
	belongs_to :domain, class_name: "Domain", optional: false

	# Método de validação do type_record
	def type_record_validate
		if self.type_record.eql?('A') or self.type_record.eql?('TXT') or 
			self.type_record.eql?('CNAME') or self.type_record.eql?('PTR')
		else
			errors.add(:type_record, " invalido!")
		end
	end 

	def content_ipv4_validate
		if self.type_record.eql?('A')
			if (ip_address?(self.content))
			else
				errors.add(:content, " formato ipv4 inválido!")
			end
		end	
	end

	# Retorna true caso o formato for valido e false para formato inválido
	# Não restringe os valores de cada octeto
	def ip_address?(str)
  		!!(str =~ /^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$/)
	end
end
