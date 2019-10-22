class Record < ApplicationRecord

	# Validações
	validates_presence_of :host, :message => "não informado!"
	validates_presence_of :ttl, :message => "não informado!"
	validates_presence_of :content, :message => "não informado!"
	validates_presence_of :priority, :message => "não informado!"
	validates_presence_of :domain, :message => "não informado!"

	#Validação personalizada para o type_record
	validate :type_record_validate

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
end
