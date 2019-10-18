class Record < ApplicationRecord

	#attr_accessible: :host, :ttl, :content, :priority, :type_record, :domain

	validates_presence_of :host, :message => "não informado!"
	validates_presence_of :ttl, :message => "não informado!"
	validates_presence_of :content, :message => "não informado!"
	validates_presence_of :priority, :message => "não informado!"
	validates_presence_of :type_record, :message => "não informado!"
	validates_presence_of :domain, :message => "não informado!"

	belongs_to :domain, class_name: "Domain", optional: false
end
