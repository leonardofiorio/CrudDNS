require 'test_helper'

class DomainTest < ActiveSupport::TestCase

  test "the truth" do
    assert true
  end

  test "valid domain" do
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

  	assert domain.valid?
  end

  test "valid subdomain" do
    domain = Domain.new(name: "globo.com",
              type_domain: "MASTER",
              ttl: "100",
              primary_name_server: "ns.globo.com",
              contact: "contact@globo.com",
              refresh: "200",
              retry: "300",
              expire: "400",
              minimum: "500"
      )

      subdomain = Domain.new(name: "dev.globo.com",
              type_domain: "MASTER",
              ttl: "100",
              primary_name_server: "ns.globo.com",
              contact: "contact@globo.com",
              refresh: "200",
              retry: "300",
              expire: "400",
              minimum: "500",
              domains: domain
      )

    assert domain.valid?
    assert subdomain.valid?
  end

  test "invalid name domain" do
    domain = Domain.new(name: "",
              type_domain: "MASTER",
              ttl: "100",
              primary_name_server: "ns.globo.com",
              contact: "contact@globo.com",
              refresh: "200",
              retry: "300",
              expire: "400",
              minimum: "500"            
      )

      assert domain.invalid?
  end

  test "invalid type domain" do
    domain = Domain.new(name: "globo.com",
              type_domain: "MASTER",
              ttl: "",
              primary_name_server: "ns.globo.com",
              contact: "contact@globo.com",
              refresh: "200",
              retry: "300",
              expire: "400",
              minimum: "500"            
      )

      assert domain.invalid?
  end

  test "invalid primary_name_server domain" do
    domain = Domain.new(name: "globo.com",
              type_domain: "MASTER",
              ttl: "100",
              primary_name_server: "",
              contact: "contact@globo.com",
              refresh: "200",
              retry: "300",
              expire: "400",
              minimum: "500"            
      )

      assert domain.invalid?
  end

  test "invalid refresh domain" do
    domain = Domain.new(name: "",
              type_domain: "MASTER",
              ttl: "100",
              primary_name_server: "ns.globo.com",
              contact: "contact@globo.com",
              refresh: "",
              retry: "300",
              expire: "400",
              minimum: "500"            
      )

      assert domain.invalid?
  end

  test "invalid retry domain" do
    domain = Domain.new(name: "",
              type_domain: "MASTER",
              ttl: "100",
              primary_name_server: "ns.globo.com",
              contact: "contact@globo.com",
              refresh: "200",
              retry: "",
              expire: "400",
              minimum: "500"            
      )

      assert domain.invalid?
  end

  test "invalid expire domain" do
    domain = Domain.new(name: "",
              type_domain: "MASTER",
              ttl: "100",
              primary_name_server: "ns.globo.com",
              contact: "contact@globo.com",
              refresh: "200",
              retry: "300",
              expire: "",
              minimum: "500"            
      )

      assert domain.invalid?
  end

  test "invalid minimum domain" do
    domain = Domain.new(name: "",
              type_domain: "MASTER",
              ttl: "100",
              primary_name_server: "ns.globo.com",
              contact: "contact@globo.com",
              refresh: "200",
              retry: "300",
              expire: "400",
              minimum: ""            
      )

      assert domain.invalid?
  end  
end
