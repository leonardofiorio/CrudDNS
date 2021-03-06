class RecordsController < ApplicationController
  before_action :set_record, only: [:show, :edit, :update, :destroy]

  # GET /records
  # GET /records.json
  def index
    @records = Record.all
  end 

  # GET /records/1
  # GET /records/1.json
  def show
  end

  # GET /records/new
  def new
    @record = Record.new
  end

  # GET /records/1/edit
  def edit
  end

  # POST /records
  # POST /records.json
  def create
    @record = Record.new(record_params)

    if @record.type_record == "CNAME"
      # Se o tipo é um CNAME, não pode existir outro Record, 
      # com o mesmo nome, no mesmo Domain.

      records_domain = Record.where(domain_id: @record.domain_id)

      records_domain.each do |r|
        
        if @record.name == r.name
            
            respond_to do |format|
                format.html { 
                  flash[:notice] = 'O Record não foi inserido! Existe um Record com mesmo nome no mesmo Domain'
                  render :new
                }
                format.json { render json: @record.errors, status: :unprocessable_entity }
            end
            return 
        end

      end
    
    else
      # Se o tipo não é um CNAME, não pode existir um Record do tipo CNAME, 
      # com o mesmo nome, no mesmo Domain.

      records_cname_domain = Record.where(type_record: "CNAME", name: @record.name,
       domain_id: @record.domain_id).count()

      if records_cname_domain != 0

          respond_to do |format|
                format.html { 
                  flash[:notice] = 'O Record não foi inserido! Existe um Record do tipo CNAME com mesmo nome no mesmo Domain'
                  render :new
                }
                format.json { render json: @record.errors, status: :unprocessable_entity }
          end

          return
      end

    end


    respond_to do |format|
      if @record.save
        format.html { redirect_to @record, notice: 'Record inserido com sucesso!' }
        format.json { render :show, status: :created, location: @record }
      else
        format.html { 
          flash[:notice] = 'O Record não pode ser inserido! '
          render :new
        }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /records/1
  # PATCH/PUT /records/1.json
  def update

    if @record.type_record == "CNAME"
      # Se o tipo é um CNAME, não pode existir outro Record, 
      # com o mesmo nome, no mesmo Domain.

      records_domain = Record.where(domain_id: @record.domain_id)

      records_domain.each do |r|
        
        if @record.name == r.name
            
            respond_to do |format|
                format.html { 
                  flash[:notice] = 'O Record não foi atualizado! Existe um Record com mesmo nome no mesmo Domain'
                  render :edit
                }
                format.json { render json: @record.errors, status: :unprocessable_entity }
            end

            return 
        end

      end
    
    else
      # Se o tipo não é um CNAME, não pode existir um Record do tipo CNAME, 
      # com o mesmo nome, no mesmo Domain.

      records_cname_domain = Record.where(type_record: "CNAME", name: params[:name],
       domain_id: @record.domain_id).where('id != ?', @record.id).count()

      if records_cname_domain != 0

          respond_to do |format|
                format.html { 
                  flash[:notice] = 'O Record não foi atualizado! Existe um Record do tipo CNAME com mesmo nome no mesmo Domain'
                  render :edit
                }
                format.json { render json: @record.errors, status: :unprocessable_entity }
          end

          return
      end

    end



    respond_to do |format|
      if @record.update(record_params)
        format.html { redirect_to @record, notice: 'Record atualizado com sucesso!' }
        format.json { render :show, status: :ok, location: @record }
      else
        format.html { 
          flash[:notice] = 'O Record não pode ser atualizado! '
          render :edit 
        }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /records/1
  # DELETE /records/1.json
  def destroy
    domain = @record.domain_id
    @record.destroy
    respond_to do |format|
      format.html { redirect_to domain_path(domain), notice: 'Record foi apagado com sucesso!' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_record
      @record = Record.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def record_params
      params.require(:record).permit(:domain_id ,:type_record, :name, :ttl, :class_record, :content, :priority)
    end
end
