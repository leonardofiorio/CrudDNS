require 'test_helper'

class RecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @record = records(:one)
    @domain = domains(:one)
  end

  test "should get index" do
    get records_url
    assert_response :success
  end

  test "should get new" do
    get new_record_url
    assert_response :success
  end

  test "should create record" do
    assert_difference('Domain.count') do
     post "/domains", params: { "domain"=>{
                                    "id" => 1,
                                    "domains"=>"",
                                     "name"=>"globo.com",
                                      "type_domain"=>"MASTER",
                                       "ttl"=>"1",
                                        "primary_name_server"=>"ns.globo.com", 
                                        "contact"=>"contact@globo.com",
                                         "refresh"=>"1",
                                          "retry"=>"2",
                                           "expire"=>"3", 
                                           "minimum"=>"4"}
                                }
    end

    assert_difference('Record.count') do
      post records_url, params: { "record" => { 
                                    "content" => "conteudo",
                                    "name" => "meuhost",
                                    "priority" => "1", 
                                    "ttl" => "200", 
                                    "class_record" => "IN",
                                    "type_record" => "CNAME",
                                    "domain_id" => 1 
                                  } 
                                }
    end

    assert_redirected_to record_url(Record.last)
  end

  test "should show record" do
    get record_url(@record)
    assert_response :success
  end

  test "should get edit" do
    get edit_record_url(@record)
    assert_response :success
  end

  test "should update record" do
    post "/domains", params: { "domain"=>{
                                    "id" => 1,
                                    "domains"=>"",
                                     "name"=>"globo.com",
                                      "type_domain"=>"MASTER",
                                       "ttl"=>"1",
                                        "primary_name_server"=>"ns.globo.com", 
                                        "contact"=>"contact@globo.com",
                                         "refresh"=>"1",
                                          "retry"=>"2",
                                           "expire"=>"3", 
                                           "minimum"=>"4"
                                  }
                                }

    post records_url, params: { "record" => { 
                                    "id" => 1 ,
                                    "content" => "conteudo",
                                    "name" => "meuhost",
                                    "priority" => "1", 
                                    "ttl" => "200", 
                                    "class_record" => "IN",
                                    "type_record" => "CNAME",
                                    "domain_id" => 1 
                                  } 
                                } 

    patch record_url(@record), params: { "record" => 
                                  { 
                                    "id" => 1,
                                    "content" => "content",
                                    "name" => "meuhost",
                                    "priority" => "1", 
                                    "ttl" => "200", 
                                    "class_record" => "IN",
                                    "type_record" => "CNAME",
                                    "domain_id" => 1 
                                  } 
                                }

    assert_redirected_to record_url(@record)
  end

  test "should destroy record" do
    assert_difference('Record.count', -1) do
      delete record_url(@record)
    end

    assert_redirected_to domain_path(@record.domain_id)
  end

  
  # Tentando inserir CNAME com mesmo nome de CNAME já existente
  # O segundo record não deve ser inserido
  test "CNAME name duplicated - should not create record" do 
      post "/domains", params: { "domain"=>{
                                    "id" => 1,
                                    "domains"=>"",
                                     "name"=>"globo.com",
                                      "type_domain"=>"MASTER",
                                       "ttl"=>"1",
                                        "primary_name_server"=>"ns.globo.com", 
                                        "contact"=>"contact@globo.com",
                                         "refresh"=>"1",
                                          "retry"=>"2",
                                           "expire"=>"3", 
                                           "minimum"=>"4"
                                  }
                                }

    post records_url, params: { "record" => { 
                                    "id" => 1 ,
                                    "content" => "conteudo",
                                    "name" => "meuhost",
                                    "priority" => "1", 
                                    "ttl" => "200", 
                                    "class_record" => "IN",
                                    "type_record" => "CNAME",
                                    "domain_id" => 1 
                                  } 
                                } 

    assert_difference("Record.count", 0) do                            
      post records_url, params: { "record" => { 
                                      "id" => 1 ,
                                      "content" => "conteudo",
                                      "name" => "meuhost",
                                      "priority" => "1", 
                                      "ttl" => "200", 
                                      "class_record" => "IN",
                                      "type_record" => "A",
                                      "domain_id" => 1 
                                    } 
                                  } 
    end
  end

  test "new Record with same name CNAME - should not create record" do 

      post "/domains", params: { "domain"=>{
                                    "id" => 1,
                                    "domains"=>"",
                                     "name"=>"globo.com",
                                      "type_domain"=>"MASTER",
                                       "ttl"=>"1",
                                        "primary_name_server"=>"ns.globo.com", 
                                        "contact"=>"contact@globo.com",
                                         "refresh"=>"1",
                                          "retry"=>"2",
                                           "expire"=>"3", 
                                           "minimum"=>"4"
                                  }
                                }

      post records_url, params: { "record" => { 
                                    "id" => 1 ,
                                    "content" => "conteudo",
                                    "name" => "meuhost",
                                    "priority" => "1", 
                                    "ttl" => "200", 
                                    "class_record" => "IN",
                                    "type_record" => "CNAME",
                                    "domain_id" => 1 
                                  } 
                                } 

      assert_difference("Record.count", 0) do  
        post records_url, params: { "record" => { 
                                      "id" => 2 ,
                                      "content" => "conteudo",
                                      "name" => "meuhost",
                                      "priority" => "1", 
                                      "ttl" => "200", 
                                      "class_record" => "IN",
                                      "type_record" => "A",
                                      "domain_id" => 1 
                                    } 
                                  } 
      end
  end
end