require 'test_helper'

class RecordTest < ActiveSupport::TestCase
	  
	  test "the truth" do
	    assert true
	  end


	  test "valid record" do
	  	domain = Domain.new(name: "globo.com",
  						type_domain: "MASTER",
  						ttl: "100",
  						primary_name_server: "ns.globo.com",
              			contact: "contact@globo.com",
              			refresh: "200",
              			retry: "300",
              			expire: "400",
              			minimum: "500",
              			domains: nil
  			)

	  	record = Record.new(name: "popsp.i.s3.globo.com",
	  						ttl: '200',
	  						class_record: "IN",
	  						content: '192.168.30.11',
	  						priority: '1',
	  						type_record: 'A',
	  						domain: domain
	  		)

	  	assert record.valid?
	  end

	  
	  test "invalid domain record" do
	  	record = Record.new(name: "popsp.i.s3.globo.com",
	  						ttl: '200',
	  						class_record: "IN",
	  						content: '192.168.30.11',
	  						priority: '1',
	  						type_record: 'A',
	  						domain: nil
	  		)

	  	assert record.invalid?
	  end	


	  test "invalid name record" do
	  	domain = Domain.new(name: "globo.com",
  						type_domain: "MASTER",
  						ttl: "100",
  						primary_name_server: "ns.globo.com",
              			contact: "contact@globo.com",
              			refresh: "200",
              			retry: "300",
              			expire: "400",
              			minimum: "500",
              			domains: nil
  			)

	  	record = Record.new(name: "",
	  						ttl: '200',
	  						content: '192.168.30.11',
	  						priority: '1',
	  						type_record: 'A',
	  						domain: domain
	  		)

	  	assert record.invalid?
  	  end


  	  test "invalid ttl record" do
	  	domain = Domain.new(name: "globo.com",
  						type_domain: "MASTER",
  						ttl: "100",
  						primary_name_server: "ns.globo.com",
              			contact: "contact@globo.com",
              			refresh: "200",
              			retry: "300",
              			expire: "400",
              			minimum: "500",
              			domains: nil
  			)

	  	record = Record.new(name: "popsp.i.s3.globo.com",
	  						ttl: '',
	  						class_record: "IN",
	  						content: '192.168.30.11',
	  						priority: '1',
	  						type_record: 'A',
	  						domain: domain
	  		)

	  	assert record.invalid?
  	  end

  	  test "invalid class record" do
	  	domain = Domain.new(name: "globo.com",
  						type_domain: "MASTER",
  						ttl: "100",
  						primary_name_server: "ns.globo.com",
              			contact: "contact@globo.com",
              			refresh: "200",
              			retry: "300",
              			expire: "400",
              			minimum: "500",
              			domains: nil
  			)

	  	record = Record.new(name: "popsp.i.s3.globo.com",
	  						ttl: '100',
	  						class_record: "",
	  						content: '192.168.30.11',
	  						priority: '1',
	  						type_record: 'A',
	  						domain: domain
	  		)

	  	assert record.invalid?
  	  end


  	  test "invalid content record" do
	  	domain = Domain.new(name: "globo.com",
  						type_domain: "MASTER",
  						ttl: "100",
  						primary_name_server: "ns.globo.com",
              			contact: "contact@globo.com",
              			refresh: "200",
              			retry: "300",
              			expire: "400",
              			minimum: "500",
              			domains: nil
  			)

	  	record = Record.new(name: "popsp.i.s3.globo.com",
	  						ttl: '200',
	  						class_record: "IN",
	  						content: '',
	  						priority: '1',
	  						type_record: 'A',
	  						domain: domain
	  		)

	  	assert record.invalid?
  	  end


  	  test "invalid priority record" do
	  	domain = Domain.new(name: "globo.com",
  						type_domain: "MASTER",
  						ttl: "100",
  						primary_name_server: "ns.globo.com",
              			contact: "contact@globo.com",
              			refresh: "200",
              			retry: "300",
              			expire: "400",
              			minimum: "500",
              			domains: nil
  			)

	  	record = Record.new(name: "popsp.i.s3.globo.com",
	  						ttl: '',
	  						class_record: "IN",
	  						content: '192.168.30.11',
	  						priority: '',
	  						type_record: 'A',
	  						domain: domain
	  		)

	  	assert record.invalid?
  	  end


	  test "invalid type_record record" do
	  	domain = Domain.new(name: "globo.com",
  						type_domain: "MASTER",
  						ttl: "100",
  						primary_name_server: "ns.globo.com",
              			contact: "contact@globo.com",
              			refresh: "200",
              			retry: "300",
              			expire: "400",
              			minimum: "500",
              			domains: nil
  			)

	  	record = Record.new(name: "popsp.i.s3.globo.com",
	  						ttl: '100',
	  						class_record: "IN",
	  						content: '192.168.30.11',
	  						priority: '1',
	  						type_record: '',
	  						domain: domain
	  		)

	  	assert record.invalid?
  	  end
end
