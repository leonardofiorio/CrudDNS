class DomainsController < ApplicationController
  before_action :set_domain, only: [:show, :edit, :update, :destroy]

  # GET /domains
  # GET /domains.json
  def index
    @domains = Domain.all
  end

  # GET /domains/1
  # GET /domains/1.json
  def show
    @domains_contained = Domain.where(domains_id: params[:id])
    @records = Record.where(domain_id: params[:id])
  end

  # GET /domains/new
  # GET /domains/new/1
  def new
    @domain = Domain.new

    if params[:id]
      @domain.domains = Domain.find(params[:id])
    end
  end


  # GET /domains/1/edit
  def edit
  end

  # POST /domains
  # POST /domains.json
  def create
    @domain = Domain.new()

    if domain_params[:domains] != ""
      @domain.domains = Domain.find(domain_params[:domains])
    end
    
    @domain.name = domain_params[:name]
    @domain.type_domain = domain_params[:type_domain]
    @domain.ttl = domain_params[:ttl]
    @domain.primary_name_server = domain_params[:primary_name_server]
    @domain.contact = domain_params[:contact]
    @domain.refresh = domain_params[:refresh]
    @domain.expire = domain_params[:expire]
    @domain.retry = domain_params[:retry]
    @domain.minimum = domain_params[:minimum]

    respond_to do |format|
      if @domain.save
        format.html { redirect_to @domain, notice: 'Domain inserido com sucesso!' }
        format.json { render :show, status: :created, location: @domain }
      else
        format.html { render :new }
        format.json { render json: @domain.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /domains/1
  # PATCH/PUT /domains/1.json
  def update
    respond_to do |format|

      new_values = {
          "name"=>domain_params[:name], 
          "type_domain"=>domain_params[:type_domain], 
          "ttl"=>domain_params[:ttl], 
          "primary_name_server"=>domain_params[:primary_name_server], 
          "contact"=>domain_params[:contact], 
          "refresh"=>domain_params[:refresh], 
          "retry"=>domain_params[:retry], 
          "expire"=>domain_params[:expire], 
          "minimum"=>domain_params[:minimum],
          "domains"=>nil
      }


      if domain_params[:domains] != ""
        new_values[:domains] = Domain.find(domain_params[:domains].to_i)
      end  


      if @domain.update(new_values)
        format.html { redirect_to @domain, notice: 'Domain atualizado com sucesso!' }
        format.json { render :show, status: :ok, location: @domain }
      else
        format.html { render :edit }
        format.json { render json: @domain.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /domains/1
  # DELETE /domains/1.json
  def destroy
    @domain.destroy
    respond_to do |format|
      format.html { redirect_to domains_url, notice: 'Domain removido com sucesso!' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_domain
      @domain = Domain.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def domain_params
      params.require(:domain).permit(:name, :type_domain, :ttl, :primary_name_server, :contact, :refresh, :retry, :expire, :minimum, :domains)
    end
end
